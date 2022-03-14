<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePaymentRequest;
use App\Http\Requests\UpdatePaymentRequest;
use App\Models\Payment;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use Throwable;

class PaymentApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index()
    {
        try {
            $data = Payment::
            // select([ '*', ])->
            with([
                'dealer',
                'transaction',
                'payment_by_user',
            ])->
            latest()
                /* User Permission filter */
                ->when(!auth()->user()->hasAnyPermission('payment-list-all'), function ($qry) {
                    return $qry->where('payments.payment_by', auth()->id());
                })
                /* Dynamic Order By -amount=desc, amount=acs */
                ->when(count($orderByPairs = QueryStrService::getOrderBy(Payment::class)) ?? 0, function ($qry) use ($orderByPairs) {
                    $orderByPairs->each(function ($pair) use ($qry) {
                        if ($pair && count($pair)) {
                            // Use the 'splat' to turn the pair into two arguments
                            $qry->orderBy(...$pair);
                        }
                    });
                })
                /* Filters */
                ->where(function ($qry) {
                    return $this->payment_filters($qry);
                })
                /* Filters END */
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

//            $data->getCollection()->transform(function ($item) {
//                $item->subRows = $item->emi_info;
//                return $item;
//            });

            Log::info($data);
            return $this->res($data, 'Payments list.');
        } catch (Throwable $t) {
//            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StorePaymentRequest $request
     * @return JsonResponse
     */
    public function store(StorePaymentRequest $request): JsonResponse
    {
        $record = null;
        try {
            $record = Payment::create(request()->only([
                'amount', 'date', 'particular',
                'dealer_id',
                'transaction_id',
                'desc',
            ]));
            $record->payment_by = auth()->id();
            $record->save();

            return $this->res($record, " New record created {$record->id}.");

        } catch (Throwable $th) {
            //throw $th;
            optional($record)->delete();
            return $this->resError($th->getMessage());
        }
    }

    private function payment_filters($qry)
    {
        return $qry;
    }

}

//
///**
// * Update the specified resource in storage.
// *
// * @param  \App\Http\Requests\UpdatePaymentRequest  $request
// * @param  \App\Models\Payment  $payment
// * @return \Illuminate\Http\Response
// */
//public function update(UpdatePaymentRequest $request, Payment $payment)
//{
//    //
//}
//
///**
// * Remove the specified resource from storage.
// *
// * @param  \App\Models\Payment  $payment
// * @return \Illuminate\Http\Response
// */
//public function destroy(Payment $payment)
//{
//    //
//}
