<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
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
}
