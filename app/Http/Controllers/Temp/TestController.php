<?php

namespace App\Http\Controllers\Temp;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Permission;
use Throwable;

class TestController extends Controller
{
    /**
     * @return bool
     */
    public function phpinfo(): bool
    {
        $test = 1;
        return phpinfo();
    }

    public function logout(): \Illuminate\Http\JsonResponse
    {
        try {
            $user = User::find(Auth::user()->id);
            Auth::logout();
            return $this->res(['success' => 'Logout success', 'user' => $user]);
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError($error_msg, $t->getMessage());
        }
    }

    public function get(): \Illuminate\Http\JsonResponse
    {
        try {
            $data = Permission::get();
            return $this->res($data);
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError($error_msg, $t->getMessage());
        }
    }

    public function paginateGet(): \Illuminate\Http\JsonResponse
    {
        $data = User::paginate(request('per_page') ?? 3)
            ->appends(request()->all());
        return $this->res($data);
    }

    public function userGet($id): \Illuminate\Http\JsonResponse
    {
        try {
            $data = User::findOrFail($id);
            return $this->res([$data,'Get modal image']);
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError($error_msg, $t->getMessage());
        }
    }
}
