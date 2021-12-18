<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;

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

// Auth
Route::post('/sanctum/login', [LoginController::class, 'login'])->name('login');
Route::any('/sanctum/logout', [LogoutController::class, 'logout'])->name('logout')->middleware('auth:sanctum');
Route::post('/me', [LoginController::class, 'me'])->name('me')->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
  
});