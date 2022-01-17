<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSalaryRequest;
use App\Http\Requests\UpdateSalaryRequest;
use App\Models\Advance;
use App\Models\Salary;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use phpDocumentor\Reflection\Types\Mixed_;
use Throwable;

class SalaryApiController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:salary-list-all|salary-list-self', ['only' => ['index']]);
        // $this->middleware('permission:salary-create', ['only' => ['create', 'store']]);
        // $this->middleware('permission:salary-edit|salary-edit-self', ['only' => ['edit', 'update']]);
        // $this->middleware('permission:salary-list-self|salary-show-self', ['only' => ['show']]);
        // $this->middleware('permission:salary-delete-self', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        try {
            // dump($request->all());
            $this->validate(request(), [
                'user_ids' => 'sometimes',
                'user_ids.*' => 'sometimes|integer|exists:users,id',
                'amount_min' => 'nullable|sometimes|numeric|min:0|max:1000000',
                'amount_max' => 'nullable|sometimes|numeric|min:0|max:1000000',
                'from_date' => 'nullable|sometimes|date|before:tomorrow'/*|date_format:Y-m-d*/,
                'to_date' => 'nullable|sometimes|date|before:tomorrow' /*|date_format:Y-m-d*/,
                // 'to_date' => 'nullable|sometimes|date|date_format:Y-m-d|before:tomorrow|after_or_equal:from_date', // TODO
            ]);

            // Log::debug($request->all());
            $salaries = Salary::with(['user'])
                ->latest()
                ->select([
                    'salaries.id',
                    'salaries.user_id',
                    'salaries.month_year',
                    'salaries.amount',
                    'salaries.deduction',
                    'salaries.created_by',
                    'salaries.created_at',
                ])
                ->when(!auth()->user()->hasAnyPermission(['salary-list-all']), function ($query) {
                    return $query->where('salaries.user_id', auth()->id());
                })
//                ->join('users as creator', 'creator.id', '=', 'salaries.created_by')
//                ->addSelect([
//                    'creator.name as created_by_name',
//                ])
                /* Dynamic Order By -amount=desc, amount=acs */
                ->when(count($orderByPairs = QueryStrService::getOrderBy(Salary::class)) ?? 0, function ($qry) use ($orderByPairs) {
                    $orderByPairs->each(function ($pair) use ($qry) {
                        if ($pair && count($pair)) {
                            // Use the 'splat' to turn the pair into two arguments
                            $qry->orderBy(...$pair);
                        }
                    });
                })
                /* Filters */
                ->where(function ($qry) {
                   $this->salary_filters($qry);
                })
                /* Filters END */
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());
//            $advances->getCollection()->transform(function ($item) {
//                $item->subRows = $item->emi_info;
//                return $item;
//            });

            return $this->res($salaries, 'salaries');
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreSalaryRequest $request
     * @return JsonResponse
     */
    public function store(StoreSalaryRequest $request): mixed
    {
        try {
            DB::beginTransaction();

            if (request()->get('deduction')) {
                $advance_summery = Advance::where('settled', Advance::UNPAID)
                    ->where('user_id', request()->get('user_id'))
                    ->selectRaw('COALESCE(sum(amount), 0) as total_advance')
                    ->selectRaw('COALESCE(sum(paid_amount), 0) as total_paid')
                    ->selectRaw('COALESCE(sum(amount), 0)-COALESCE(sum(paid_amount), 0) as outstanding')
                    ->first();

                if (optional($advance_summery)->outstanding <= 0) {
                    return $this->resError(request()->all(), "Not found any pending advances. For this user");
                }
                if (optional($advance_summery)->outstanding < request('deduction')) {
                    $outstanding_amt = optional($advance_summery)->outstanding;
                    return $this->resError(request()->all(), "Deduction should not be greater then outstanding amount: $outstanding_amt, received:{$request->get('deduction')}");
                }
            }

            $pending_advances = Advance::select([
                'advances.id',
                'advances.user_id',
                'advances.amount',
                'advances.paid_amount',
                'advances.settled',
                'advances.date',
            ])
                ->where('advances.user_id', request('user_id'))
                ->orderBy('advances.date')
                ->get();
            /*return $pending_advances;*/

            $initial_accumulator = [
                'advances' => collect([]),
                'total_deduction' => 0,
                'deduction' => request('deduction'),
            ];

            $emi_details = $pending_advances->reduce(function ($accumulator, $advance) {
                if ($accumulator['deduction'] <= 0 || $advance->settled === 1) {
                    optional($accumulator['advances'])->push($advance);
                    return $accumulator;
                }
                $advance['calc_outstanding'] = $advance->amount - $advance->paid_amount;
                //$this->calc_outstanding($advance);
                $emi = ($advance->calc_outstanding <= $accumulator['deduction']) ? $advance->calc_outstanding : $accumulator['deduction'];
                $advance->settled = $advance->calc_outstanding <= $accumulator['deduction'];
                $advance->paid_amount += $emi;
                $advance->emi_temp = $emi;
                $accumulator['deduction'] -= $emi;
                $accumulator['total_deduction'] += $emi;

                optional($accumulator['advances'])->push($advance);
                return $accumulator;
            }, $initial_accumulator);

            /*return $emi_details;*/

            if (request('deduction') && ($emi_details['deduction'] !== 0 && $emi_details['total_deduction'] === request('deduction'))) {
                return $this->resError(request()->all());
            }

            $salary = new Salary();
            $salary->user_id = request('user_id');
            $salary->amount = request('salary_amount');
            $salary->deduction = request('deduction');
            $salary->month_year = request('month_year');
            $salary->save();
            // return $this->resError($salary, "");

            $emi_details['advances']->each(function ($advance) use ($salary) {
                if ($advance['emi_temp']) {
                    $this->include_deduction_in_emi_info($advance, $salary, $advance['emi_temp']);
                }
//                $this->calc_outstanding($advance);
                $advance['calc_outstanding'] = $advance->amount - $advance->paid_amount;
                unset($advance->calc_outstanding, $advance->emi_temp);
                $advance->save();
            });

            DB::commit();
        } catch (Throwable $t) {
            DB::rollBack();
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError(request()->all(), $t->getMessage());
        }

        return $this->res($salary, 'Salary created.');
    }


    /**
     * Remove the specified resource from storage.
     * TODO::testing
     * @param Salary $salary
     * @return JsonResponse
     */
    public function destroy(Salary $salary): mixed
    {
        try {
            $advances = Advance::select([
                'advances.id',
                'advances.emi_info',
                'advances.amount'
            ])
                // ->whereJsonContains('emi_info', ['id' => $salary->id, 'model'=> Salary::getTableName()])
                ->whereJsonContains('emi_info', ['id' => $salary->id])
                ->get();

            DB::beginTransaction();
            /// 1. expenses entry remove
            /// 2. incomes increment
            //// update Advance deduction if paid any
            $advances->map(function ($advance) use ($salary) {
                $emi_items = collect($advance->emi_info);
//                dump($emi_items);
                $total_paid_amount = 0;
                $emi_items_updated = $emi_items->filter(function ($emi) use ($total_paid_amount, $salary) {
                    if ($emi->id !== $salary->id && optional($emi)->model !== Salary::getTableName()) {
                        $total_paid_amount += $emi->deduction;
                        return $emi;
                    }
                    return false;
                });
//                dump($emi_items_updated->values());
                // $emi_items->put('salaries', $meta_salaries_updated->values());
                $advance->emi_info = $emi_items_updated->values();
                $advance->paid_amount = $total_paid_amount;
                $advance->settled = $advance->amount <= $advance->paid_amount;
                $advance->save();
            });

            //// delete salary
            $salary->delete();
            DB::commit();
            return $this->res($salary, 'Salary updated.');
        } catch (Throwable $t) {
            DB::rollback();
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    public function include_deduction_in_emi_info(Advance $modal, Salary $salary, $deduction_amt): Advance
    {
        $advance = $modal->where('advances.id', $modal->id)->first();
        $in_hand_amt = $salary->amount - $salary->deduction;
        if ($advance) {
            // `prepend` Adding an Element to the Beginning of a Collection
            $emis_info = collect($advance->emi_info)
                ->prepend([
                    'model' => Salary::getTableName(),
                    'id' => $salary->id,
                    'deduction' => $deduction_amt * 1,
                    'date' => now(),
                    'desc' => "Salary Deductions, (salary Amount:{$salary->amount}, deduction:{$salary->deduction}, In-hand:{$in_hand_amt})",
                ]);
            $modal->emi_info = $emis_info;
        }
        /*dump($advance, $meta);*/
        return $modal;
    }


    public function exclude_deduction_in_emi_info(Advance $advance, $salary_id)
    {
        $advance = $advance->where('advances.id', $advance->id)->first();
        if ($advance) {
//            $meta = collect($advance->emi_info);
            $emi_items = collect($advance->emi_info);
            $meta_salaries_updated = $emi_items->filter(function ($emi) use ($salary_id) {
                /*dump($emi);*/
                if ($emi->salary_id !== $salary_id) return $emi;
                return false;
            });
            dump($meta_salaries_updated->values());
            // $emi_items->put('salaries', $meta_salaries_updated->values());
            $advance->emi_info = $emi_items;
        }
        return $advance;
    }


    public function salary_filters($qry)
    {
        return $qry->when(request('user_ids'), function ($qry) {
            $user_ids = request('user_ids');
            $user_ids = is_string($user_ids) ? explode(',', $user_ids) : $user_ids;
            $qry->whereIn('salaries.user_id', $user_ids);
        })
            ->when(request()->get('from_date'), function ($query) {
                $query->whereDate('salaries.month_year', '>=', request()->get('from_date'));
            })
            ->when(request()->get('to_date'), function ($query) {
                $query->whereDate('salaries.month_year', '<=', request()->get('to_date'));
            })
            ->when(request()->get('amount_min'), function ($query) {
                $query->where('salaries.amount', '>=', request()->get('amount_min'));
            })
            ->when(request()->get('amount_max'), function ($query) {
                $query->where('salaries.amount', '<=', request()->get('amount_max'));
            });
    }

//    public function getOriginalOnly()
//    {
//        foreach ($this->getAttributes() as $key => $value) {
//            if (!array_key_exists($key, $this->getOriginal())) {
//                unset($this->$key);
//            }
//        }
//        return $this;
//    }


//
//    /**
//     * Show the form for creating a new resource.
//     *
//     * @return \Illuminate\Http\Response
//     */
//    public function create()
//    {
//        //
//    }
//
//
//    /**
//     * Display the specified resource.
//     *
//     * @param  \App\Models\Salary  $salary
//     * @return \Illuminate\Http\Response
//     */
//    public function show(Salary $salary)
//    {
//        //
//    }
//
//    /**
//     * Show the form for editing the specified resource.
//     *
//     * @param  \App\Models\Salary  $salary
//     * @return \Illuminate\Http\Response
//     */
//    public function edit(Salary $salary)
//    {
//        //
//    }
//
//    /**
//     * Update the specified resource in storage.
//     *
//     * @param  \App\Http\Requests\UpdateSalaryRequest  $request
//     * @param  \App\Models\Salary  $salary
//     * @return \Illuminate\Http\Response
//     */
//    public function update(UpdateSalaryRequest $request, Salary $salary)
//    {
//        //
//    }
//
}
