<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use function request;

class LogoutController extends Controller
{
  public function logout(Request $request)
  {
    return request()->user()->currentAccessToken()->delete();
  }
}
