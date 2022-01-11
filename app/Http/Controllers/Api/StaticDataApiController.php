<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\JsonResponse;
use Spatie\Permission\Models\Role;

class StaticDataApiController extends Controller
{
    public function getRoles(): JsonResponse
    {
        $roles = Role::get();
        return $this->res($roles);
    }

    public function getPropertyTypes(): JsonResponse
    {
        $roles = [
            'Apartment',
            'Residential',
            'Commercial',
            '2bhk',
            '3bhk',
            'Other'
        ];
        return $this->res($roles);
    }

    public function getTransactions(): JsonResponse
    {
        /*$request->validate(["role" => "nullable|sometimes|min:1",]);*/
        $data = Transaction::select([
            'transactions.id',
            'transactions.id as value',
            'transactions.type as label',
        ])
            ->get();
        return $this->res($data);
    }
}
