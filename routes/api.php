<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\StaticDataApiController;
use App\Http\Controllers\Api\TransactionApiController;
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
    Route::get('/static/roles', [StaticDataApiController::class, 'getRoles'])->name('api.static.roles');
    Route::get('/static/property_types', [StaticDataApiController::class, 'getPropertyTypes'])->name('api.static.property_types');
    Route::get('/static/transactions', [StaticDataApiController::class, 'getTransactions'])->name('api.static.transactions');

    // Users
    Route::get('/users', [UserApiController::class, 'index'])->name('users.index');
    Route::get('/users/{user}', [UserApiController::class, 'show'])->name('users.show');
    Route::post('/users', [UserApiController::class, 'store'])->name('users.store');
    Route::put('/users/{any_user}', [UserApiController::class, 'update'])->name('users.update');


    // Project
    Route::get('/projects', [ProjectApiController::class, 'index'])->name('project.index');
//    Route::get('/projects/{project}', [ProjectApiController::class, 'show'])->name('project.show');
    Route::post('/projects', [ProjectApiController::class, 'store'])->name('project.store');
    Route::put('/projects/{project}', [ProjectApiController::class, 'update'])->name('project.update');


    // Project
    Route::get('/transactions', [TransactionApiController::class, 'index'])->name('project.index');
    Route::post('/transactions', [TransactionApiController::class, 'store'])->name('project.store');
    Route::put('/transactions/{transaction}', [TransactionApiController::class, 'update'])->name('project.update');
//    Route::get('/transactions/{transaction}', [ProjectApiController::class, 'show'])->name('project.show');

});


Route::get('/test', [TestController::class, 'get']);
Route::get('/test/logout', [TestController::class, 'logout']);
Route::get('/test/paginate', [TestController::class, 'paginateGet']);
Route::get('/test/users/{id}', [TestController::class, 'userGet']);
Route::get('/test/roles', [StaticDataApiController::class, 'getRoles'])->name('api.static.roles');


Route::get('/test/projects', [ProjectApiController::class, 'index']);
Route::post('/test/projects', [ProjectApiController::class, 'store']);

Route::get('/test/transactions', [StaticDataApiController::class, 'getTransactions'])->name('api.static.transactions');

