<?php

namespace App\Http\Controllers\Api;

use App\Helper;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreFundRequest;
use App\Models\Fund;
use App\Scopes\OrderByScope;
use Illuminate\Http\JsonResponse;
use Facades\App\Services\QueryStrService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

class FundApiController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:fund-list-self|fund-list-all', ['only' => 'index', 'show']);
        //        $this->middleware('permission:fund-show-self|fund-show-all', ['only' => ['show']]);
        $this->middleware('permission:fund-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:fund-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:fund-delete-self', ['only' => ['destroy']]); //// |fund-delete-all // TODO Delete all
        $this->middleware('permission:fund-approval', ['only' => ['approval']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {

        $data = Fund::when(!Helper::AuthHasPermission('fund-list-all'), function ($qry) {
            return $qry->where('user_id', auth()->id());
        })
            ->with([
                'given_to', 'received_from', 'transaction'
            ])
            /* Filters */
            ->where(function ($qry) {
                $qry->when(request('from_date'), function ($qry) {
                    $qry->whereDate('funds.date', '>=', request('from_date'));
                });
                $qry->when(request('to_date'), function ($qry) {
                    $qry->whereDate('funds.date', '<=', request('to_date'));
                });
                $qry->when(request('user_ids'), function ($qry) {
                    $user_ids = request('user_ids');
                    $user_ids = is_string($user_ids) ? explode(',', $user_ids) : $user_ids;
                    $qry->whereIn('funds.user_id', $user_ids);
                });
                //                $qry->when(request('amount_min'), function ($query) {
                //                    $query->where('funds.amount', '>=', request('amount_min'));
                //                });
                //                $qry->when(request('amount_max'), function ($query) {
                //                    $query->where('funds.amount', '<=', request('amount_max'));
                //                });
            })
            /* Filters END */
            /* Dynamic Order By -amount->desc, amount->acs */
            ->when(count($orderByPairs = QueryStrService::getOrderBy(Fund::class)) ?? 0, function ($qry) use ($orderByPairs) {
                $orderByPairs->each(function ($pair) use ($qry) {
                    if ($pair && count($pair)) {
                        // Use the 'splat' to turn the pair into two arguments
                        $qry->orderBy(...$pair);
                    }
                });
            })
            ->orderBy('transaction_id')
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all());

        return $this->res($data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreFundRequest $request
     * @return JsonResponse
     */
    public function store(StoreFundRequest $request): JsonResponse
    {
        $fund = null;
        try {
            $fund = new Fund();
            DB::transaction(function () use ($fund) {
                $fund->user_id = request('user_id');
                $fund->amount = request('amount');
                $fund->date = request('date');
                $fund->transaction_id = request('transaction_id');
                $fund->desc = request('desc');
                $fund->save();

                if ($fund) {
                    $fund->given_to->fund += $fund->amount;
                    $fund->given_to->save();
                }
            });
            return $this->res($fund, " New record created {$fund->id}.");
        } catch (Throwable $e) {
            $log_msg = ['Line:' => $e->getLine(), 'Message:' => $e->getMessage(), 'Code:' => $e->getCode()];
            Log::error($log_msg);
            //throw $th;
            optional($fund)->delete();
            return $this->resError($e->getMessage());
        }
    }
}


//
//    /**
//     * Show the form for editing the specified resource.
//     *
//     * @param Fund $fund
//     * @return Response
//     */
//    public function edit(Fund $fund)
//    {
//        //
//    }
//
//    /**
//     * Update the specified resource in storage.
//     *
//     * @param UpdateFundRequest $request
//     * @param Fund $fund
//     * @return Response
//     */
//    public function update(UpdateFundRequest $request, Fund $fund)
//    {
//        //
//    }
//
//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param Fund $fund
//     * @return Response
//     */
//    public function destroy(Fund $fund)
//    {
//        //
//    }
