<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use function csrf_token;
use function response;

/**
 * Class LoginController
 * @package App\Http\Controllers\Auth
 * @src https://mr-hr.medium.com/how-to-get-headers-in-laravel-41339a889f51
 * @src https://tallpad.com/series/laravel-misc/lessons/authenticate-mobile-applications-with-laravel-sanctum
 */
class LoginController extends Controller
{
  public function login(Request $request)
  {
    $request->validate([
      'email' => 'required|string|email',
      'password' => 'required|string|min:6',
      'device_name' => 'string|nullable',
    ]);

    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
      throw ValidationException::withMessages([
        'email' => ['The provided credentials are incorrect.'],
      ]);
    }
    $token = $user->createToken($request->device_name ?? 'auth_token')->plainTextToken;

    return response()->json([
      'token' => $token,
        'token_type' => 'Bearer',
        'data' => $user,
    ]);
  }

    public function me(Request $request)
    {
        return $request->user();
    }

    public function csrfCookie()
    {
        return response()->json([
            'csrf_token' => csrf_token(),
        ]);
    }

    public function redirect(): JsonResponse
    {
        return response()->json('NOT FOUND', 403);
        // return redirect('/');
    }
}
