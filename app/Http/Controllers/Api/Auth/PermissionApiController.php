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
//    /**
//     * PermissionApiController constructor.
//     */
//    public function __construct()
//    {
////        app()->make(\Spatie\Permission\PermissionRegistrar::class)->forgetCachedPermissions();
//        $this->middleware('permission:role-list', ['only' => ['index', 'store']]);
//        $this->middleware('permission:role-create', ['only' => ['create', 'store']]);
//        $this->middleware('permission:role-delete', ['only' => ['destroy']]);
//        $this->middleware('permission:role-edit', ['only' => ['assign_roles']]);
//
//        $this->middleware('permission:permission-list', ['only' => ['index', 'show', 'assign_permissions']]);
//        $this->middleware('permission:permission-show', ['only' => ['show']]);
//        $this->middleware('permission:permission-edit', ['only' => ['edit', 'show', 'assign_permissions']]);
//    }

    /**
     * @param Request $request
     * @param User $user
     * @return JsonResponse
     */
    public function user_permissions(Request $request, User $user): JsonResponse
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

    public function assign(User $user)
    {
        request()->validate([
            "permissions" => "array",
            "permissions.*" => "string|required|exists:permissions,name",
        ]);

        if (request('permissions')) {
            $user->syncPermissions(request('permissions'));
        } else {
            // remove all permissions, request('permissions') is_null
            $user->syncPermissions();
        }

        return $this->res($user, "Permissions updated successfully ({$user->name}).");
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
