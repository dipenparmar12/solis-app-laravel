<?php

namespace App\Http\Controllers\Api;

use App\Helper;
use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\Project;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Psr\Container\NotFoundExceptionInterface;
use Throwable;

class ProjectApiController extends Controller
{
    /**
     * Display a listing of the resource.
     * @see https://stackoverflow.com/a/48091600/8592918
     * @throws NotFoundExceptionInterface
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
            ->withSum([
                'incomes',
                'expenses',
                'estimates',
                // 'estimates' => fn ($qry) => $qry,
            ], 'amount')

            ->when(!Helper::AuthHasPermission('project-list-all'), function ($query) {
                return Helper::AuthHasPermission('project-list-finish') ? $query->whereWip(0) : $query->whereWip(1);
            })
            ->where(function ($qry) {
                return $this->project_filters($qry);
            })
            ->latest()
            ->paginate(request('per_page') ?? 50)
            ->appends(request()->all());

        $data->getCollection()->transform(function ($project) {

            $project['p_and_l'] = $project['budget'] - $project['estimates_sum_amount'] - $project['expenses_sum_amount'];
            $project['collection'] = $project['budget'] - $project['incomes_sum_amount'];

            if (!Helper::AuthHasPermission('project-estimate-show')) {
                $project['estimates_sum_amount'] = null;
                $project['p_and_l'] = null;
            }

            if (!Helper::AuthHasPermission('project-expense-show')) {
                $project['expenses_sum_amount'] = null;
                $project['p_and_l'] = null;
            }

            if (!Helper::AuthHasPermission('project-income-show')) {
                $project['incomes_sum_amount'] = null;
                $project['collection'] = null;
            }

            return $project;
        });

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
     * Get all expenses
     * @param Project $project
     * @return JsonResponse
     */
    public function expenses(Project $project): JsonResponse
    {
        try {
            if (Helper::AuthHasPermission('project-expense-show')) {
                $project->load([
                    'expenses',
                    'expenses.expense_by_user',
                    'expenses.transaction',
                    'expenses.dealer',
                ]);
            }

            return $this->res($project);
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    /**
     * Project estimates
     * @param Project $project
     * @return JsonResponse
     */
    public function estimates(Project $project): JsonResponse
    {
        try {

            if (Helper::AuthHasPermission('project-estimate-show')) {
                $project->load([
                    'estimates',
                    'estimates.dealer',
                ]);
            }
            return $this->res($project);
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }

    /**
     * Project incomes
     * @param Project $project
     * @return JsonResponse
     */
    public function incomes(Project $project): JsonResponse
    {
        try {
            if (Helper::AuthHasPermission('project-income-show')) {
                $project->load([
                    'incomes',
                    'incomes.received_by_user',
                ]);
            }
            return $this->res($project);
        } catch (Throwable $t) {
            return $this->resError(request()->all(), $t->getMessage());
        }
    }


    /**
     * @throws NotFoundExceptionInterface
     */
    private function project_filters($qry)
    {
        return $qry->when(function ($qry) {
            $qry->when(is_numeric(request('wip')), function ($query) {
                $query->where('wip', request('wip') == 0 ? 0 : 1);
            });
        })
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
            });
    }
}


//            $qry->withSum(['expenses' => function ($query) {
//                $query->selectRaw('SUM(amount) as amount_sum');
//            }], 'amount')
//            $qry->withSum(['incomes' => function ($query) {
//                return $query;
//                // $query->selectRaw('SUM(amount) as income_sum');
//            }], 'amount')
