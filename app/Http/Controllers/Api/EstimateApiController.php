<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreEstimateRequest;
use App\Http\Requests\UpdateEstimateRequest;
use Facades\App\Services\QueryStrService;
use App\Models\Estimate;
use Illuminate\Http\JsonResponse;
use Throwable;


class EstimateApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index()
    {
        try {
            $dealers = Estimate::
            // select([ '*', ])->
            with([
                'project', 'dealer'
            ])->
            latest()
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

            return $this->res($dealers, 'Dealers resource.');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreEstimateRequest $request
     * @return JsonResponse
     */
    public function store(StoreEstimateRequest $request): JsonResponse
    {
        try {
            return $this->res($request->all(), 'Success');
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
//
//    /**
//     * Display the specified resource.
//     *
//     * @param  \App\Models\Estimate  $estimate
//     * @return \Illuminate\Http\Response
//     */
//    public function show(Estimate $estimate)
//    {
//        //
//    }
//
//    /**
//     * Show the form for editing the specified resource.
//     *
//     * @param  \App\Models\Estimate  $estimate
//     * @return \Illuminate\Http\Response
//     */
//    public function edit(Estimate $estimate)
//    {
//        //
//    }
//
//    /**
//     * Update the specified resource in storage.
//     *
//     * @param  \App\Http\Requests\UpdateEstimateRequest  $request
//     * @param  \App\Models\Estimate  $estimate
//     * @return \Illuminate\Http\Response
//     */
//    public function update(UpdateEstimateRequest $request, Estimate $estimate)
//    {
//        //
//    }
//
//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  \App\Models\Estimate  $estimate
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy(Estimate $estimate)
//    {
//        //
//    }
}
