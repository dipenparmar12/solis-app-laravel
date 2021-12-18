<?php

namespace App\Http\Controllers\Utils;

use App\Console\Commands\EnsureDatabaseState;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Http\Response;

class DatabaseStateController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param Request $request
     * @return int
     */
    public function __invoke(Request $request)
    {
        return Artisan::call(EnsureDatabaseState::class);
    }
}
