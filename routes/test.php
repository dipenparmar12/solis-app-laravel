<?php

use App\Http\Controllers\Api\FundApiController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\StaticDataApiController;
use App\Http\Controllers\Temp\TestController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

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

// TODO::REMOVE DEV ONLY
if (app()->environment() === 'local' &&  env('AUTH_AUTO_LOGIN')) {
    Auth::loginUsingId(env('AUTH_AUTO_LOGIN'));
}

Route::get('', [TestController::class, 'get']);
Route::get('/logout', [TestController::class, 'logout']);
Route::get('/paginate', [TestController::class, 'paginateGet']);
Route::get('/users/{id}', [TestController::class, 'userGet']);
Route::get('/roles', [StaticDataApiController::class, 'getRoles']);
Route::get('/projects', [ProjectApiController::class, 'index']);
Route::post('/projects', [ProjectApiController::class, 'store']);
Route::get('/transactions', [StaticDataApiController::class, 'getTransactions']);
Route::get('/funds', [FundApiController::class, 'index']);

