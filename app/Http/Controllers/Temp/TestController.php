<?php

namespace App\Http\Controllers\Temp;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Scopes\IsActiveScope;
use Spatie\Permission\Models\Permission;

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

    public function get(): \Illuminate\Http\JsonResponse
    {
        $data = Permission::get();
        return $this->res($data);
    }

    public function paginateGet(): \Illuminate\Http\JsonResponse
    {
        $data = User::paginate(request('per_page') ?? 3)
            ->appends(request()->all());
        return $this->res($data);
    }

}
