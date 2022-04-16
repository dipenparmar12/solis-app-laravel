<?php

namespace App;

class Helpers
{
  public static function AuthHasPermission($permissionName)
  {
    return auth()->check() && auth()->user()->hasPermissionTo($permissionName);
  }

  /**
   * Reset cached roles and permissions
   * @return void
   */
  public static function flushPermissionCache()
  {
    app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
  }
}
