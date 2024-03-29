<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Dealer;
use App\Models\Project;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Role;
use Throwable;

class StaticDataApiController extends Controller
{
    public function empty(): JsonResponse
    {
        return $this->res("");
    }

    public function getRoles(): JsonResponse
    {
        $roles = Role::get();
        return $this->res($roles);
    }

    public function getPropertyTypes(): JsonResponse
    {

        try {

            $roles = [
                'Apartment',
                'Residential',
                'Commercial',
                'Penthouse',
//            "2bhk",
                'Other'
            ];
            return $this->res($roles);
        } catch (Throwable $th) {
            //throw $th;
            $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
            Log::error($log_msg);
            return $this->resError($th->getMessage());
        }

    }


    /**
     * @return JsonResponse
     */
    public function getExpenseCategories(): JsonResponse
    {
        try {
            $date = [
                ['value' => 'project', 'label' => 'Project',],
                ['value' => 'office', 'label' => 'Office',],
                ['value' => 'personal', 'label' => 'Personal',],
                ['value' => 'other', 'label' => 'Other',],
            ];
            return $this->res($date);

        } catch (Throwable $th) {
            //throw $th;
            $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
            Log::error($log_msg);
            return $this->resError($th->getMessage());
        }

    }

//    public function getTransactionFormats(): JsonResponse
//    {
//        $roles = [
//            "Apartment",
//        ];
//        return $this->res($roles);
//    }

    public function getUsers(): JsonResponse
    {
        try {
            /*$request->validate(["role" => "nullable|sometimes|min:1",]);*/
            $data = User::select([
                'users.id',
                'users.id as value',
                'users.name as label',
            ])
                ->get();
            return $this->res($data);
        } catch (Throwable $th) {
            //throw $th;
            $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
            Log::error($log_msg);
            return $this->resError($th->getMessage());
        }
    }

    public function getProjects(): JsonResponse
    {
        try {
            /*$request->validate(["role" => "nullable|sometimes|min:1",]);*/
            $data = Project::select([
                "projects.id",
                "projects.id as value",
                "projects.title as label",
                "projects.title as title",
                "projects.client as client",
            ])
                ->get()
                ->transform(function ($project, $key) {
                    /// remove mr,mrs,Mr etc (sanitize client name)
                    $client_name_sanitized = trim(preg_replace('/^(mr|mr.|mrs|miss)[.|\s]/i', '', $project->client));
                    $client_name_array = preg_split('/[\s,]+/', $client_name_sanitized) ?? [];
                    $first_name = $client_name_array[0] ?? ' ';
                    $project->label = $project->title . ', ' . $first_name;
                    return $project;
                });
            return $this->res($data);
        } catch (Throwable $th) {
            //throw $th;
            $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
            Log::error($log_msg);
            return $this->resError($th->getMessage());
        }
    }

    public function getTransactions(): JsonResponse
    {
        try {
            /*$request->validate(["role" => "nullable|sometimes|min:1",]);*/
            $data = Transaction::select([
                "transactions.id",
                "transactions.id as value",
                "transactions.type as label",
            ])
                ->get();
            return $this->res($data);
        } catch (Throwable $th) {
            //throw $th;
            $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
            Log::error($log_msg);
            return $this->resError($th->getMessage());
        }
    }

    public function getDealers(): JsonResponse
    {
        try {

            /*$request->validate(["role" => "nullable|sometimes|min:1",]);*/
            $data = Dealer::select([
                'dealers.id',
                'dealers.id as value',
                'dealers.firm as label',
            ])
                ->get();
            return $this->res($data);
        } catch (Throwable $th) {
            //throw $th;
            $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
            Log::error($log_msg);
            return $this->resError($th->getMessage());
        }

    }
}
