<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSalaryRequest;
use App\Http\Requests\UpdateSalaryRequest;
use App\Models\Salary;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
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
                ->join('users as creator', 'creator.id', '=', 'salaries.created_by')
                ->addSelect([
                    'creator.name as created_by_name',
                ])
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
                    $qry->when(request('user_ids'), function ($qry) {
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
                })
                /* Filters END */
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

            return $this->res($salaries, 'salaries');
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

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
//    /**
//     * Store a newly created resource in storage.
//     *
//     * @param  \App\Http\Requests\StoreSalaryRequest  $request
//     * @return \Illuminate\Http\Response
//     */
//    public function store(StoreSalaryRequest $request)
//    {
//        //
//    }
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
//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  \App\Models\Salary  $salary
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy(Salary $salary)
//    {
//        //
//    }
}
