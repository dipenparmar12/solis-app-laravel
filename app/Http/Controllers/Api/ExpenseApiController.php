<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreExpenseRequest;
use App\Http\Requests\UpdateExpenseRequest;
use App\Models\Expense;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Throwable;

class ExpenseApiController extends Controller
{
//    /**
//     * Display a listing of the resource.
//     *
//     * @return \Illuminate\Http\Response
//     */
//    public function index()
//    {
//        //
//    }


    /**
     * Store a newly created resource in storage.
     *
     * @param StoreExpenseRequest $request
     * @return JsonResponse
     */
    public function store(StoreExpenseRequest $request)
    {
        $record = null;
        try {
            $record = Expense::create(request()->only([
                'amount', 'date',  'particular', 'category',
                'project_id', 'dealer_id', 'transaction_id',
                'desc',
                // 'expense_by', 'is_approved',
            ]));

            $record->expense_by = auth()->id();
            $record->save();

            return $this->res($record, 'New record created.');
        } catch (Throwable $th) {
            //throw $th;
            optional($record)->delete();
            return $this->resError($th->getMessage());
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
}
