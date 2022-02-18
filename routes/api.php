<?php

use App\Http\Controllers\Api\AdvanceApiController;
use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\FundApiController;
use App\Http\Controllers\Api\IncomeApiController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\SalaryApiController;
use App\Http\Controllers\Api\StaticDataApiController;
use App\Http\Controllers\Api\TransactionApiController;
use App\Http\Controllers\Api\UserApiController;
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
    Route::get('/static/empty', [StaticDataApiController::class, 'empty'])->name('api.static.empty');
    Route::get('/static/roles', [StaticDataApiController::class, 'getRoles'])->name('api.static.roles');
    Route::get('/static/property_types', [StaticDataApiController::class, 'getPropertyTypes'])->name('api.static.property_types');
    Route::get('/static/users', [StaticDataApiController::class, 'getUsers'])->name('api.static.users');
    Route::get('/static/transactions', [StaticDataApiController::class, 'getTransactions'])->name('api.static.transactions');

    // Funds
    Route::get('/funds', [FundApiController::class, 'index'])->name('funds.index');
//    Route::get('/funds/{fund}', [FundApiController::class, 'show'])->name('funds.show');
//    Route::post('/funds', [FundApiController::class, 'store'])->name('funds.store');
//    Route::put('/funds/{funds}', [FundApiController::class, 'update'])->name('funds.update');

    // Users
    Route::get('/users', [UserApiController::class, 'index'])->name('users.index');
    Route::get('/users/{user}', [UserApiController::class, 'show'])->name('users.show');
    Route::post('/users', [UserApiController::class, 'store'])->name('users.store');
    Route::put('/users/{any_user}', [UserApiController::class, 'update'])->name('users.update');

    /* User Advances */
    Route::get('/users/{user}/advances', [UserApiController::class, 'advances'])->name('api.users.advances');


    // Projects
    Route::get('/projects', [ProjectApiController::class, 'index'])->name('projects.index');
    Route::post('/projects', [ProjectApiController::class, 'store'])->name('projects.store');
    Route::put('/projects/{project}', [ProjectApiController::class, 'update'])->name('projects.update');
//    Route::get('/projects/{project}', [ProjectApiController::class, 'show'])->name('projects.show');


    // Transactions
    Route::get('/transactions', [TransactionApiController::class, 'index'])->name('transactions.index');
    Route::post('/transactions', [TransactionApiController::class, 'store'])->name('transactions.store');
    Route::put('/transactions/{transaction}', [TransactionApiController::class, 'update'])->name('transactions.update');
    // Route::get('/transactions/{transaction}', [ProjectApiController::class, 'show'])->name('transactions.show');

    // salaries
    Route::get('/salaries', [SalaryApiController::class, 'index'])->name('api.salaries.get');
    Route::post('/salaries', [SalaryApiController::class, 'store'])->name('api.salaries.store');
    Route::delete('/salaries/{salary}', [SalaryApiController::class, 'destroy'])->name('api.salaries.destroy');


    // advances
    Route::get('/advances', [AdvanceApiController::class, 'index'])->name('api.advances.get');
    Route::get('/advance_summary', [AdvanceApiController::class, 'advance_summary'])->name('api.advances.summary');
    Route::post('/advances', [AdvanceApiController::class, 'store'])->name('api.advances.store');

    // incomes
    Route::get('/incomes', [IncomeApiController::class, 'index'])->name('api.incomes.get');
    Route::post('/incomes', [IncomeApiController::class, 'store'])->name('api.incomes.store');
    Route::get('/incomes/{income}', [IncomeApiController::class, 'show'])->name('api.incomes.store');

    // 
});

// Test routes
Route::group(['prefix' => 'test'], function () {
    return include(base_path('routes/test.php'));
});
