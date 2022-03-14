<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Dealer;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use Throwable;

class DealerApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        try {
            $dealers = Dealer::
            // select([ '*', ])->
            latest()
                ->withSum(['estimates', 'expenses', 'payments'], 'amount')
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

            return $this->res($dealers, 'Dealers resource.');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }

    }


    /**
     * Merged Estimates & Expenses
     * @param Dealer $dealer
     * @return JsonResponse
     */
    public function balance_sheet(Dealer $dealer): JsonResponse
    {
        try {
            $data = [];
            $dealer->load([
                'estimates',
                'estimates.project',
                'expenses.expense_by_user',
                'expenses',
                'payments',
            ]);

            $estimates = collect()
                ->merge($dealer->estimates)
                ->map(function ($item) {
                    $item->date = $item->s_date;
                    $item->resource = 'estimate';
                    // unset($item->s_date);
                    return $item;
                });

            $expenses = collect()
                ->merge($dealer->expenses)
                ->map(function ($item) {
                    $item->resource = 'expense';
                    return $item;
                });

            $payments = collect()
                ->merge($dealer->payments)
                ->map(function ($item) {
                    $item->resource = 'payment';
                    return $item;
                });

            $dealer->balance_sheet = collect()
                ->merge($estimates)
                ->merge($expenses)
                ->merge($payments)
                ->sortByDesc('date')
                ->values()
            ;

            return $this->res($dealer);
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    private function filters($qry)
    {
        return $qry;
    }

}





//    /**
//     * Store a newly created resource in storage.
//     *
//     * @param  \App\Http\Requests\StoreDealerRequest  $request
//     * @return \Illuminate\Http\Response
//     */
//    public function store(StoreDealerRequest $request)
//    {
//        //
//    }

/**
 * Display the specified resource.
 *
 * @param Dealer $dealer
 * @return
 */
//    public function show(Dealer $dealer)
//    {
//        //
//    }
//
//
//    /**
//     * Update the specified resource in storage.
//     *
//     * @param  \App\Http\Requests\UpdateDealerRequest  $request
//     * @param  \App\Models\Dealer  $dealer
//     * @return \Illuminate\Http\Response
//     */
//    public function update(UpdateDealerRequest $request, Dealer $dealer)
//    {
//        //
//    }
//
//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  \App\Models\Dealer  $dealer
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy(Dealer $dealer)
//    {
//        //
//    }
