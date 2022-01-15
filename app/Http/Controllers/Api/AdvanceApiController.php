<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreAdvanceRequest;
use App\Http\Requests\UpdateAdvanceRequest;
use App\Models\Advance;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;
use Throwable;

class AdvanceApiController extends Controller
{

    public function __construct()
    {
        //    $this->middleware(['role:team']);
        $this->middleware('permission:advance-list-all|advance-list-self', ['only' => ['index', 'advance_summary']]);
        // $this->middleware('permission:advance-create', ['only' => ['create', 'store']]);
        // $this->middleware('permission:advance-edit|advance-edit-self', ['only' => ['edit', 'update']]);
        // $this->middleware('permission:advance-list-self|advance-show-self', ['only' => ['show']]);
        // $this->middleware('permission:advance-delete-self', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     * @throws ValidationException
     */
    public function index(): JsonResponse
    {
        $this->validate(request(), [
            'user_ids' => 'sometimes',
            'user_ids.*' => 'sometimes|integer|exists:users,id',
            'amount_min' => 'nullable|sometimes|numeric|min:0|max:1000000',
            'amount_max' => 'nullable|sometimes|numeric|min:0|max:1000000',
            'from_date' => 'nullable|sometimes|date|date_format:Y-m-d',
            'to_date' => 'nullable|sometimes|date|date_format:Y-m-d|before:tomorrow',
            // 'to_date' => 'nullable|sometimes|date|date_format:Y-m-d|before:tomorrow|after_or_equal:from_date', // TODO
        ]);

        try {
            $advances = Advance::with(['user'])
                ->select([
                    '*',
                    // "user_id", "amount", "date", "paid_amount", "settled", 'emi_info'
                ])
                /* User Permission filter */
                ->when(!auth()->user()->hasAnyPermission('advance-list-all'), function ($qry) {
                    return $qry->where('advances.user_id', auth()->id());
                })
                /* Dynamic Order By -amount=desc, amount=acs */
                ->when(count($orderByPairs = QueryStrService::getOrderBy(Advance::class)) ?? 0, function ($qry) use ($orderByPairs) {
                    $orderByPairs->each(function ($pair) use ($qry) {
                        if ($pair && count($pair)) {
                            // Use the 'splat' to turn the pair into two arguments
                            $qry->orderBy(...$pair);
                        }
                    });
                })
                /* Filters */
                ->where(function ($qry) {
                    $qry
                        ->when(request()->has('user_ids'), function ($qry) {
                            $qry->whereIn('advances.user_id', request()->get('user_ids'));
                        })
                        ->when(request('from_date'), function ($query) {
                            $query->whereDate('advances.date', '>=', request('from_date'));
                        })
                        ->when(request('to_date'), function ($query) {
                            $query->whereDate('advances.date', '<=', request('to_date'));
                        })
                        ->when(request('amount_min'), function ($query) {
                            $query->where('advances.amount', '>=', request('amount_min'));
                        })
                        ->when(request('amount_max'), function ($query) {
                            $query->where('advances.amount', '<=', request('amount_max'));
                        });
                })
                /* Filters END */
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

            return $this->res($advances, 'Your request processed successfully.');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }

    }

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
//     * @param  \App\Http\Requests\StoreAdvanceRequest  $request
//     * @return \Illuminate\Http\Response
//     */
//    public function store(StoreAdvanceRequest $request)
//    {
//        //
//    }
//
//    /**
//     * Display the specified resource.
//     *
//     * @param  \App\Models\Advance  $advance
//     * @return \Illuminate\Http\Response
//     */
//    public function show(Advance $advance)
//    {
//        //
//    }
//
//    /**
//     * Show the form for editing the specified resource.
//     *
//     * @param  \App\Models\Advance  $advance
//     * @return \Illuminate\Http\Response
//     */
//    public function edit(Advance $advance)
//    {
//        //
//    }
//
//    /**
//     * Update the specified resource in storage.
//     *
//     * @param  \App\Http\Requests\UpdateAdvanceRequest  $request
//     * @param  \App\Models\Advance  $advance
//     * @return \Illuminate\Http\Response
//     */
//    public function update(UpdateAdvanceRequest $request, Advance $advance)
//    {
//        //
//    }
//
//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  \App\Models\Advance  $advance
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy(Advance $advance)
//    {
//        //
//    }
}
