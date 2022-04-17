<?php

namespace App\Http\Controllers\Api;

use App\Helpers;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreIncomeRequest;
use App\Http\Requests\UpdateIncomeRequest;
use App\Models\Income;
use Facades\App\Services\QueryStrService;
use http\Env\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Throwable;

// TODO::IMP SortBy not working in income index
class IncomeApiController extends Controller
{

    public function __construct()
    {
        //    $this->middleware(['role:team']);
        $this->middleware('permission:income-list-all|income-list-self', ['only' => ['index', 'income_summary']]);
        // $this->middleware('permission:income-create', ['only' => ['create', 'store']]);
        // $this->middleware('permission:income-edit|income-edit-self', ['only' => ['edit', 'update']]);
        // $this->middleware('permission:income-list-self|income-show-self', ['only' => ['show']]);
        // $this->middleware('permission:income-delete-self', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        try {
            $incomes = Income::
                // select([ '*', ])->
                with([
                    'project', 'received_by_user', 'transaction'
                ])
                ->latest()
                /* User Permission filter */
                ->when(!Helpers::AuthHasPermission('income-list-all'), function ($qry) {
                    return $qry->where('incomes.user_id', auth()->id());
                })
                /* Dynamic Order By -amount=desc, amount=acs */
                ->when(count($orderByPairs = QueryStrService::getOrderBy(Income::class)) ?? 0, function ($qry) use ($orderByPairs) {
                    $orderByPairs->each(function ($pair) use ($qry) {
                        if ($pair && count($pair)) {
                            // Use the 'splat' to turn the pair into two arguments
                            $qry->orderBy(...$pair);
                        }
                    });
                })
                /* Filters */
                ->where(function ($qry) {
                    return $this->income_filters($qry);
                })
                /* Filters END */
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

            //            $incomes->getCollection()->transform(function ($item) {
            //                $item->subRows = $item->emi_info;
            //                return $item;
            //            });

            return $this->res($incomes, 'Income resource.');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreIncomeRequest $request
     * //     * @return JsonResponse
     */
    public function store(StoreIncomeRequest $request): JsonResponse
    {
        try {
            $income = Income::create(request()->only([
                // "received_by",
                "project_id", "transaction_id",
                "from", "amount", "date",
                'particular', 'desc',
            ]));

            if (request('received_by')) {
                $income->received_by = request('received_by') ?: auth()->id();
                $income->save();
            }

            if ($request->hasFile('income_file')) {
                $fileName = pathinfo(request()->file('income_file')->getClientOriginalName(), PATHINFO_BASENAME);
                $income
                    ->addMediaFromRequest('income_file')
                    ->usingFileName($fileName)
                    ->sanitizingFileName(function ($fileName) {
                        return 'income__' . uniqid() . '__' . strtolower(str_replace(['#', '/', '\\', ' ', '.tmp'], '-', $fileName));
                    })
                    ->toMediaCollection('default', 'private');
            }

            return $this->res($income, 'Income created successfully.');
        } catch (Throwable $t) {
            DB::rollBack();
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param Income $income
     */
    public function show(Income $income)
    {
        //        $income->load([
        //            'project', 'received_by_user', 'transaction'
        //        ]);
        $mediaItems = $income->getMedia();
        return $income;
    }

    /**
     * @throws NotFoundExceptionInterface
     */
    private function income_filters($qry)
    {
        return $qry->when(request('received_by_ids'), function ($qry) {
            $user_ids = request('received_by_ids');
            $user_ids = is_string($user_ids) ? explode(',', $user_ids) : $user_ids;
            $qry->whereIn('incomes.received_by', $user_ids);
        })
            ->when(request('from_date'), function ($query) {
                $query->whereDate('incomes.date', '>=', request('from_date'));
            })
            ->when(request('to_date'), function ($query) {
                $query->whereDate('incomes.date', '<=', request('to_date'));
            })
            ->when(request('amount_min'), function ($query) {
                $query->where('incomes.amount', '>=', request('amount_min'));
            })
            ->when(request('amount_max'), function ($query) {
                $query->where('incomes.amount', '<=', request('amount_max'));
            });
    }

    //
    //    /**
    //     * Show the form for editing the specified resource.
    //     *
    //     * @param  \App\Models\Income  $income
    //     * @return \Illuminate\Http\Response
    //     */
    //    public function edit(Income $income)
    //    {
    //        //
    //    }
    //
    //    /**
    //     * Update the specified resource in storage.
    //     *
    //     * @param  \App\Http\Requests\UpdateIncomeRequest  $request
    //     * @param  \App\Models\Income  $income
    //     * @return \Illuminate\Http\Response
    //     */
    //    public function update(UpdateIncomeRequest $request, Income $income)
    //    {
    //        //
    //    }
    //
    //    /**
    //     * Remove the specified resource from storage.
    //     *
    //     * @param  \App\Models\Income  $income
    //     * @return \Illuminate\Http\Response
    //     */
    //    public function destroy(Income $income)
    //    {
    //        //
    //    }
}
