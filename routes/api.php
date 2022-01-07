<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\UserApiController;
use App\Http\Controllers\Temp\TestController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Auth routes
Route::get('/sanctum/csrf-cookie', [LoginController::class, 'csrfCookie'])->name('csrf-cookie');
Route::post('/sanctum/login', [LoginController::class, 'login'])->name('login');
Route::any('/sanctum/logout', [LogoutController::class, 'logout'])->name('logout')->middleware('auth:sanctum');
Route::any('/me', [LoginController::class, 'me'])->name('me')->middleware('auth:sanctum');

// App routes
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/users', [UserApiController::class, 'index'])->name('users.index');
    Route::get('/users/{id}', [UserApiController::class, 'show'])->name('users.show');
    Route::post('/users', [UserApiController::class, 'store'])->name('users.store');
});


Route::get('/test', [TestController::class, 'get']);
Route::get('/test/logout', [TestController::class, 'logout']);
Route::get('/test/paginate', [TestController::class, 'paginateGet']);
Route::get('/test/users/{id}', [TestController::class, 'userGet']);


