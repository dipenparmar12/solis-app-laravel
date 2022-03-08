<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreEstimateRequest;
use App\Http\Requests\UpdateEstimateRequest;
use Facades\App\Services\QueryStrService;
use App\Models\Estimate;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Throwable;


class EstimateApiController extends Controller
{
    /**
     * Display a listing of the resource.
     * TODO:IMP remove media fields columns
     * @return JsonResponse
     */
    public function index()
    {
        try {
            $estimates = Estimate::
            // select([ '*', ])->
            with([
                'project', 'dealer', 'media'
            ])->
            latest()
                ->paginate(QueryStrService::determinePerPageRows())
                ->appends(request()->all());

//           $estimates = $estimates->getCollection()->transform(function ($item) {
//                return $item;
//            });

            return $this->res($estimates, 'Dealers resource.');
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
    public function store(StoreEstimateRequest $request)
    {
        try {
//            return request()->all();
            $groupId = Str::random(7);
            $estimates = collect(json_decode(request('estimates'), true));

            $estimates = $estimates->map(function ($item) use ($groupId) {
                $estimate = new Estimate();
                $estimate->amount = $item['amount'];
                $estimate->dealer_id = $item['dealer_id'];
                $estimate->project_id = request('project_id');
                $estimate->s_date = request('s_date');
                $estimate->e_date = request('e_date');
                $estimate->created_by = auth()->id();
                $estimate->updated_by = auth()->id();
                $estimate->created_at = now();
                $estimate->updated_at = now();
                $estimate->group_id = $groupId;
                $estimate->save();

                return $estimate;
            });


            if (request()->hasFile('files')) {
                // $estimate->clearMediaCollection('estimates'); // default, estimates collection
                $files = reset(request()->files); // 1st item
                $estimates->first()
                    ->addAllMediaFromRequest($files)
                    ->each(function ($fileAdder) use ($estimates) {
                        $fileAdder
                            ->withCustomProperties([
                                'uploaded_by' => auth()->id(),
                                'estimates' => $estimates->values()->toJson()
                            ])
                            ->toMediaCollection('estimates', 'private');
                    });
            }

            return $this->res($estimates->toArray(), 'Success');
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

//    /**
//     * Show the form for creating a new resource.
//     *desc = 'Desc'
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
