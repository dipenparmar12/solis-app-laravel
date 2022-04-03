<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreExpenseRequest;
use App\Http\Requests\UpdateExpenseRequest;
use App\Models\Expense;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Throwable;

class ExpenseApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        try {
            $expenses = Expense::
            // select([ '*', ])->
            with([
                'project', 'dealer', 'transaction',
                'expense_by_user',
            ])
                ->latest()
                /* User Permission filter */
                ->when(!auth()->user()->hasAnyPermission('expense-list-all'), function ($qry) {
                    return $qry->where('expenses.expense_by', auth()->id());
                })
                /* Dynamic Order By -amount=desc, amount=acs */
                ->when(count($orderByPairs = QueryStrService::getOrderBy(Expense::class)) ?? 0, function ($qry) use ($orderByPairs) {
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

//            $expenses->getCollection()->transform(function ($item) {
//                $item->subRows = $item->emi_info;
//                return $item;
//            });

            return $this->res($expenses, 'Expenses list.');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param StoreExpenseRequest $request
     * @return JsonResponse
     */
    public function store(StoreExpenseRequest $request): JsonResponse
    {
        $record = null;
        try {
            $record = Expense::create(request()->only([
                'amount', 'date',  'particular', 'category',
                'project_id', 'dealer_id', 'transaction_id',
                'desc',
                // 'expense_b
                //y', 'is_approved',
            ]));

            $record->expense_by = auth()->id();
            $record->save();

            return $this->res($record, " New record created {$record->id}.");
        } catch (Throwable $th) {
            //throw $th;
            optional($record)->delete();
            return $this->resError($th->getMessage());
        }
    }

    public function approval(Expense $expense): JsonResponse
    {
        request()->validate([
            'verdict' => 'required|boolean',
        ]);

        $approval_verdict = request('verdict');

        if (!auth()->user()->hasAnyPermission(['expense-approval'])) {
            return $this->resError(['id' => $expense->id], "Unauthorized request!");
        }

        if ($expense->is_approved !== null) {
            $approval_verdict = $expense->is_approved ? 'Approved' : 'Disapproved';
            return $this->resError(['id' => $expense->id], "Expense id:{$expense->id} already {$approval_verdict}");
        }

        $expense->update([
            'is_approved' => $approval_verdict,
            'approval_by' => auth()->id(),
        ]);

        if ($approval_verdict) {
//            //// TODO:IMP logic for user pettycase calculating
//            $expense->user->fund -= $expense->amount;
//            $expense->user->save();
//            if ($expense->project_id) {
//                if ($expense->project instanceof Project) {
//                    $expense->project->expense += $expense->amount;
//                    $expense->project->save();
//                }
//            }
        }

        return $this->res($expense, "Expense id {$expense->id} updated. ");
    }


    private function income_filters($qry)
    {
        return $qry;
    }
}


//
//    /**
//     * Display the specified resource.
//     *
//     * @param  \App\Models\Expense  $expense
//     * @return \Illuminate\Http\Response
//     */
//    public function show(Expense $expense)
//    {
//        //
//    }
//
//    /**
//     * Show the form for editing the specified resource.
//     *
//     * @param  \App\Models\Expense  $expense
//     * @return \Illuminate\Http\Response
//     */
//    public function edit(Expense $expense)
//    {
//        //
//    }
//
//    /**
//     * Update the specified resource in storage.
//     *
//     * @param  \App\Http\Requests\UpdateExpenseRequest  $request
//     * @param  \App\Models\Expense  $expense
//     * @return \Illuminate\Http\Response
//     */
//    public function update(UpdateExpenseRequest $request, Expense $expense)
//    {
//        //
//    }
//
//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  \App\Models\Expense  $expense
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy(Expense $expense)
//    {
//        //
//    }
