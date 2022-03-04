<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreDealerRequest;
use App\Http\Requests\UpdateDealerRequest;
use App\Models\Dealer;
use Facades\App\Services\QueryStrService;
use Throwable;

class DealerApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        try {
            $dealers = Dealer::
            // select([ '*', ])->
                latest()
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

            return $this->res($dealers, 'Dealers resource.');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
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
    private function filters($qry)
    {
        return $qry;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Dealer  $dealer
     * @return \Illuminate\Http\Response
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
}
