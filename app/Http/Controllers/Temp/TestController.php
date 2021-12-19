<?php

namespace App\Http\Controllers\Temp;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Permission;

class TestController extends Controller
{
    /**
     * @return bool
     */
    public function phpinfo()
    {
        $test = 1;
        return phpinfo();
    }

    public function get()
    {
        $data = Permission::paginate(request('per_page') ?? 5)->appends(request()->all());
        return $data;
    }
}
