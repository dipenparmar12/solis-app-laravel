<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Spatie\Permission\Models\Permission;
use function csrf_token;
use function response;

/**
 * Class LoginController
 * @package App\Http\Controllers\Auth
 * @src https://mr-hr.medium.com/how-to-get-headers-in-laravel-41339a889f51
 * @src https://tallpad.com/series/laravel-misc/lessons/authenticate-mobile-applications-with-laravel-sanctum
 */
class PermissionApiController extends Controller
{
    /**
     * @param Request $request
     * @param User $user
     * @return JsonResponse
     */
    public function user_permissions(Request $request, User $user)
    {
        $permissions = Permission::select([
            // "*",
            'permissions.id',
            'permissions.name',
            'permissions.display_name',
        ])
            ->selectRaw('NULL as hsa_access')
            ->get();

        $user_permissions = $user->permissions->map(function ($role) {
            return [
                'id' => $role->id,
                'name' => $role->name,
                'display_name' => $role->display_name,
                'hsa_access' => true,
            ];
        });

        $data = collect($user_permissions)
            ->merge($permissions)
            ->map(function ($item) {
                $group = explode('-',$item['name'])[0];
                $item['group'] = ucfirst($group);
                return $item;
            })
            ->sortBy('name')
            ->unique('id')
            ->values()
            ->all();

        return $this->res($data);
    }

}

//public function index(): JsonResponse
//{
//    $data = Permission::select([
//        // "*",
//        'permissions.id',
//        'permissions.name',
//        'permissions.display_name',
//    ])
//        ->orderBy('permissions.name')
//        ->orderBy('permissions.display_name')
//        ->get();
//
//    return $this->res($data);
//}
