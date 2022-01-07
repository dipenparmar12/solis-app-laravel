<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Illuminate\Http\Request;

class StaticDataApiController extends Controller
{
    public function getRoles(): \Illuminate\Http\JsonResponse
    {
        $roles = Role::get();
        return $this->res($roles);
    }
}
