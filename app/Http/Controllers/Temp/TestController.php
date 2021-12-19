<?php

namespace App\Http\Controllers\Temp;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

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
}
