<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Project;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Throwable;

class ProjectApiController extends Controller
{
    /**
     * Display a listing of the resource.
     * @see https://stackoverflow.com/a/48091600/8592918
     */
    public function index(): JsonResponse
    {
        $data = Project::select([
            'projects.id',
            'projects.title',
            'projects.budget',
            'projects.income',
            'projects.expense',
            'projects.s_date',
            'projects.e_date',
            'projects.location',
            'projects.p_type',
            'projects.sqft',
            'projects.wip',
            'projects.client',
            'projects.address',
        ])
//            ->when(!auth()->user()->hasPermissionTo('project-list-all'), function ($query) {
//                return auth()->user()->hasPermissionTo('project-list-finish') ? $query->whereWip(0) : $query->whereWip(1);
//            })

            // /* filters & search queries */
            ->where(function ($qry) {
                $qry->when(is_numeric(request('wip')), function ($query) {
                    $query->where('wip', request('wip') == 0 ? 0 : 1);
                });
                $qry->when(request('title'), function ($qry, $v) {
                    $qry->where('title', 'like', '%' . request('title') . '%');
                });
                $qry->when(request('client'), function ($qry, $v) {
                    $qry->where('client', 'like', '%' . request('client') . '%');
                });
            })
            ->latest()
            ->paginate(request('per_page') ?? 50)
            ->appends(request()->all());

//        $data->getCollection()->transform(function ($project) {
//            $project->setAppends(['remaining_days']);
//            return $project;
//        });
        // https://stackoverflow.com/questions/37102841/laravel-change-pagination-data/39342941#39342941
        // https://stackoverflow.com/q/66938121/8592918

        return $this->res($data);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return JsonResponse
     * @throws ValidationException
     */
    public function store(Request $request): JsonResponse
    {
        $this->validate(request(), [
            'client' => 'required|string',
            'title' => 'required|string|unique:projects,title',
            'budget' => 'required|integer',
            'sqft' => 'nullable|integer',
            's_date' => 'required|date|after:2010-01-01',
            'e_date' => 'required|date|after_or_equal:s_date',
            'location' => 'required|string',
            'p_type' => 'required|string',
            'wip' => 'nullable|in:0,1',
            'address' => 'nullable|string'
        ]);

        $project = null;
        try {
            $project = Project::create(request()->only([
                'client', 'title',
                's_date', 'e_date',
                'budget', 'sqft',
                'location', 'p_type', 'address'
            ]));

            return $this->res($project, 'Project created.');
        } catch (Throwable $th) {
            //throw $th;
            optional($project)->delete();
            return $this->resError($th->getMessage());
        }
    }

    /**
     * Update the specified resource .
     *
     * @param Request $request
     * @return JsonResponse
     * @throws ValidationException
     */
    public function update(Request $request, Project $project): JsonResponse
    {
        $this->validate(request(), [
            'client' => 'nullable|string',
            'title' => "nullable|string|unique:projects,title,$project->id",
            'budget' => 'nullable|integer',
            'sqft' => 'nullable|integer',
            's_date' => 'nullable|date|after:2010-01-01',
            'e_date' => 'nullable|date|after_or_equal:s_date',
            'location' => 'nullable|string',
            'p_type' => 'nullable|string',
            'wip' => 'nullable|in:0,1',
            'address' => 'nullable|string'
        ]);

        try {
            $update_payload = request()->only([
                "client", "title",
                "budget", "sqft",
                "s_date", "e_date",
                "location", "p_type", "address",
                "wip",
            ]);

            if ($project->update($update_payload)) {
                return $this->res($project, "Project updated. $project->title");
            }

            return $this->resError($project, 'Please try again');

        } catch (Throwable $th) {
            return $this->resError($th->getMessage());
        }

    }


    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function expenses(Project $project): JsonResponse
    {
        $project->load([
            'expenses',
            'expenses.expense_by_user',
            'expenses.transaction',
//            'expenses.dealer',
        ]);
        return $this->res($project);
//
//        try {
//            $expenses = Expense::
//            // select([ '*', ])->
//            with([
//                'project', 'dealer', 'transaction',
//                'expense_by_user',
//            ])
//                ->latest()
//                /* User Permission filter */
//                ->when(!auth()->user()->hasAnyPermission('expense-list-all'), function ($qry) {
//                    return $qry->where('expenses.expense_by', auth()->id());
//                })
//                /* Dynamic Order By -amount=desc, amount=acs */
//                ->when(count($orderByPairs = QueryStrService::getOrderBy(Expense::class)) ?? 0, function ($qry) use ($orderByPairs) {
//                    $orderByPairs->each(function ($pair) use ($qry) {
//                        if ($pair && count($pair)) {
//                            // Use the 'splat' to turn the pair into two arguments
//                            $qry->orderBy(...$pair);
//                        }
//                    });
//                })
//                /* Filters */
//                ->where(function ($qry) {
//                    return $this->income_filters($qry);
//                })
//                /* Filters END */
//                ->paginate(QueryStrService::determinePerPageRows())
//                ->appends(request()->all());
//
////            $expenses->getCollection()->transform(function ($item) {
////                $item->subRows = $item->emi_info;
////                return $item;
////            });
//
//            return $this->res($expenses, 'Expenses list.');
//        } catch (Throwable $t) {
//            return $this->resError(request()->all(), $t->getMessage());
//        }
    }

//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  int  $id
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy($id)
//    {
//        //
//    }

//    /**
//     * Display the specified resource.
//     *
//     * @param  int  $id
//     * @return \Illuminate\Http\Response
//     */
//    public function show($id)
//    {
//        //
//    }

}
