<?php

use App\Http\Controllers\Api\FundApiController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\StaticDataApiController;
use App\Http\Controllers\FileAccessController;
use App\Http\Controllers\Temp\TestController;
use App\Http\Controllers\Utils\DatabaseStateController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/api/download', [FileAccessController::class, 'download']);
Route::get('/phpinfo', [TestController::class, 'phpinfo']);
Route::get('/db-state-update', DatabaseStateController::class);
