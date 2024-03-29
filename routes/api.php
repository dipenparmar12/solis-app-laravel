<?php

use App\Http\Controllers\Api\AdvanceApiController;
use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\Auth\PermissionApiController;
use App\Http\Controllers\Api\DealerApiController;
use App\Http\Controllers\Api\EstimateApiController;
use App\Http\Controllers\Api\ExpenseApiController;
use App\Http\Controllers\Api\FundApiController;
use App\Http\Controllers\Api\IncomeApiController;
use App\Http\Controllers\Api\PaymentApiController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\SalaryApiController;
use App\Http\Controllers\Api\StaticDataApiController;
use App\Http\Controllers\Api\TransactionApiController;
use App\Http\Controllers\Api\UserApiController;
use App\Http\Controllers\FileAccessController;
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
Route::get('/sanctum/login', [LoginController::class, 'redirect']); // NOT FOUND redirected
Route::any('/sanctum/logout', [LogoutController::class, 'logout'])->name('logout')->middleware('auth:sanctum');
Route::any('/me', [LoginController::class, 'me'])->name('me')->middleware('auth:sanctum');

// App routes
Route::middleware('auth:sanctum')->group(function () {


    // // Expenses
    Route::controller(StaticDataApiController::class)->group(function () {
        Route::get('/static/empty', 'empty')->name('api.static.empty');
        Route::get('/static/roles', 'getRoles')->name('api.static.roles');
        Route::get('/static/property_types', 'getPropertyTypes')->name('api.static.property_types');
        Route::get('/static/users', 'getUsers')->name('api.static.users');
        Route::get('/static/transactions', 'getTransactions')->name('api.static.transactions');
        Route::get('/static/projects', 'getProjects')->name('api.static.projects');
        Route::get('/static/dealers', 'getDealers')->name('api.static.dealers');
        Route::get('/static/expense_categories', 'getExpenseCategories')->name('api.static.expense_categories');
    });

    // Funds
    Route::get('/funds', [FundApiController::class, 'index'])->name('api.funds.index');
    Route::post('/funds', [FundApiController::class, 'store'])->name('api.funds.store');
    //    Route::get('/funds/{fund}', [FundApiController::class, 'show'])->name('fapi.unds.show');
    //    Route::put('/funds/{funds}', [FundApiController::class, 'update'])->name('fapi.unds.update');

    // Users
    Route::get('/users', [UserApiController::class, 'index'])->name('users.index');
    Route::get('/users/{user}', [UserApiController::class, 'show'])->name('users.show');
    Route::post('/users', [UserApiController::class, 'store'])->name('users.store');
    Route::put('/users/{any_user}', [UserApiController::class, 'update'])->name('users.update');
    Route::get('/users/fund/summary', [UserApiController::class, 'fund_summary'])->name('users.update');

    /* User Relations  */
    Route::get('/users/{user}/advances', [UserApiController::class, 'advances'])->name('api.users.advances');
    Route::get('/users/{user}/expenses', [UserApiController::class, 'expenses'])->name('api.users.expenses');
    Route::get('/users/{user}/funds', [UserApiController::class, 'funds'])->name('api.users.funds');


    // Projects
    Route::get('/projects', [ProjectApiController::class, 'index'])->name('api.projects.index');
    Route::post('/projects', [ProjectApiController::class, 'store'])->name('api.projects.store');
    Route::put('/projects/{project}', [ProjectApiController::class, 'update'])->name('api.projects.update');
    Route::get('/projects/{project}/expenses', [ProjectApiController::class, 'expenses'])->name('api.projects.expenses');
    Route::get('/projects/{project}/estimates', [ProjectApiController::class, 'estimates'])->name('api.projects.estimates');
    Route::get('/projects/{project}/incomes', [ProjectApiController::class, 'incomes'])->name('api.projects.incomes');
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
    Route::controller(IncomeApiController::class)->group(function () {
        Route::get('/incomes', 'index')->name('api.incomes.get');
        Route::post('/incomes', 'store')->name('api.incomes.store');
        Route::get('/incomes/{income}', 'show')->name('api.incomes.show');
    });

    // // Dealers
    Route::controller(DealerApiController::class)->group(function () {
        Route::get('/dealers', 'index')->name('api.dealers.get');
        Route::get('/dealers/{dealer}/balance_sheet', 'balance_sheet')->name('api.dealers.balance_sheet');
        // Route::post('/dealers', 'store')->name('api.dealers.store');
    });

    // // Estimate
    Route::controller(EstimateApiController::class)->group(function () {
        Route::get('/estimates', 'index')->name('api.estimates.get');
        Route::post('/estimates', 'store')->name('api.estimates.store');
    });

    // // Expenses
    Route::controller(ExpenseApiController::class)->group(function () {
        Route::get('/expenses', 'index')->name('api.expenses.get');
        Route::post('/expenses', 'store')->name('api.expenses.store');
        Route::post('/expenses/{expense}/approval', 'approval')->name('api.expenses.verdict');
    });

    // // Payments
    Route::controller(PaymentApiController::class)->group(function () {
        Route::get('/payments', 'index')->name('api.payments.get');
        Route::post('/payments', 'store')->name('api.payments.store');
    });


    // // Permissions
    Route::controller(PermissionApiController::class)->group(function () {
        Route::post('/permissions', 'store')->name('api.permissions.store');

        Route::get('/users/{user?}/permissions', 'user_permissions')->name('api.permissions.user');
        Route::post('/users/{user?}/assign_permissions', 'assign')->name('api.permissions.assign');
    });
});

// Test routes
Route::group(['prefix' => 'test'], function () {
    return include(base_path('routes/test.php'));
});




//    Route::get('/static/empty', [StaticDataApiController::class, 'empty'])->name('api.static.empty');
//    Route::get('/static/roles', [StaticDataApiController::class, 'getRoles'])->name('api.static.roles');
//    Route::get('/static/property_types', [StaticDataApiController::class, 'getPropertyTypes'])->name('api.static.property_types');
//    Route::get('/static/users', [StaticDataApiController::class, 'getUsers'])->name('api.static.users');
//    Route::get('/static/transactions', [StaticDataApiController::class, 'getTransactions'])->name('api.static.transactions');
//    Route::get('/static/projects', [StaticDataApiController::class, 'getProjects'])->name('api.static.projects');
//    Route::get('/static/dealers', [StaticDataApiController::class, 'getDealers'])->name('api.static.dealers');
//    Route::get('/static/expense_categories', [StaticDataApiController::class, 'getExpenseCategories'])->name('api.static.expense_categories');
