<?php

use App\Http\Controllers\Api\AdvanceApiController;
use App\Http\Controllers\Api\EstimateApiController;
use App\Http\Controllers\Api\FundApiController;
use App\Http\Controllers\Api\IncomeApiController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\StaticDataApiController;
use App\Http\Controllers\FileAccessController;
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
//
//Route::get('', [TestController::class, 'get']);
//Route::get('/logout', [TestController::class, 'logout']);
//Route::get('/paginate', [TestController::class, 'paginateGet']);
//Route::get('/users/{id}', [TestController::class, 'userGet']);
//Route::get('/advance_emi_info/{user_id}', [TestController::class, 'advance_emi_info']);
//Route::get('/user_seed', [TestController::class, 'user_seed']);
//Route::get('/dealer_seed', [TestController::class, 'dealer_seed']);
//Route::get('/expense_seed', [TestController::class, 'expense_seed']);
//Route::get('/csv_seed', [TestController::class, 'csvImport']);
//Route::any('/file_upload/{id}', [TestController::class, 'fileUpload']);
//Route::get('/media', [TestController::class, 'getMedia']);
Route::get('/remove_permissions/{user}', [TestController::class, 'remove_permissions']);
//
//Route::get('/roles', [StaticDataApiController::class, 'getRoles']);
//Route::get('/projects', [ProjectApiController::class, 'index']);
//Route::post('/projects', [ProjectApiController::class, 'store']);
//Route::get('/transactions', [StaticDataApiController::class, 'getTransactions']);
//Route::get('/funds', [FundApiController::class, 'index']);
//Route::get('/advances', [AdvanceApiController::class, 'index']);
//Route::get('/incomes/store', [IncomeApiController::class, 'store']);
//Route::get('/incomes/{income}', [IncomeApiController::class, 'show']);
//Route::get('/estimates', [EstimateApiController::class, 'store']);
//Route::get('/file/download/{path}', [FileAccessController::class, 'download']);
//
//Route::get('/static/roles', [StaticDataApiController::class, 'getRoles']);
//Route::get('/static/property_types', [StaticDataApiController::class, 'getPropertyTypes']);
//Route::get('/static/users', [StaticDataApiController::class, 'getUsers']);
//Route::get('/static/transactions', [StaticDataApiController::class, 'getTransactions']);
//Route::get('/static/expense_categories', [StaticDataApiController::class, 'getExpenseCategories']);
