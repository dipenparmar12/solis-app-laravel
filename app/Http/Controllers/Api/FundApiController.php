<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Fund;
use App\Scopes\OrderByScope;
use Illuminate\Http\JsonResponse;
use Facades\App\Services\QueryStrService;

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

        $data = Fund::when(!auth()->user()->hasAnyPermission(['fund-list-all']), function ($qry) {
            return $qry->where('user_id', auth()->id());
        })
            ->with(['given_to', 'received_from', 'project', 'transaction'])
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
            ->orderBy('transaction_id' )
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all());

        return $this->res($data);

//        $project_id = request()->query('project_id');
//        $user_id = request()->query('user_id');
//        $from_date = request()->query('from_date');
//        $to_date = request()->query('to_date');
//
//        $validator = Validator::make(request()->all(), [
//            'project_id' => 'nullable|exists:projects,id',
//            'user_id' => 'nullable|exists:users,id',
//            'from_date' => 'nullable|date',
//            'to_date' => 'nullable|date|after:from_date',
//        ]);
//
//        if ($validator->fails()) {
//            return $this->resError($validator->messages());
//        }


//        $data = Fund::select([
//            'funds.id',
//        ])
//            ->latest()
//            ->paginate(request('per_page') ?? 50)
//            ->appends(request()->all());
//        return $this->res($data);
    }

//    /**
//     * Show the form for creating a new resource.
//     *
//     * @return Response
//     */
//    public function create()
//    {
//        //
//    }

//    /**
//     * Store a newly created resource in storage.
//     *
//     * @param StoreFundRequest $request
//     * @return Response
//     */
//    public function store(StoreFundRequest $request)
//    {
//        //[
//            "amount" => "required|numeric|min:1",
//            "date" => "date|before:tomorrow|after:2010-01-01",
//            "user_id" => "required|exists:users,id",
//            "transaction_id" => "required|exists:transactions,id",
//            "project_id" => "nullable|exists:projects,id",
//        ]
//    }
//
//    /**
//     * Display the specified resource.
//     *
//     * @param Fund $fund
//     * @return Response
//     */
//    public function show(Fund $fund)
//    {
//        //
//    }
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
}
