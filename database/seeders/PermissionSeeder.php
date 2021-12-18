<?php

namespace Database\Seeders;

use Database\State\PermissionsDatabaseState;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = PermissionsDatabaseState::get_local();
        // Reset cached roles and permissions
        app()['cache']->forget('spatie.permission.cache');
        DB::table('permissions')->delete();
        foreach ($permissions as $display_name => $permission) {
            Permission::create([
                'name' => $permission,
                'display_name' => $display_name,
            ]);
        }
    }
}
