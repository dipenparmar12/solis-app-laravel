<?php

namespace Database\Seeders;

use App\Console\Commands\EnsureDatabaseState;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Artisan::call(EnsureDatabaseState::class); // db:state:update

        $this->call([
            RolesSeeder::class,
            UserSeeder::class,
            ProjectSeeder::class,
            TransactionSeeder::class,
            FundSeeder::class,
            // AdvanceSeeder::class, // // included in UsersSeeder
        ]);

//        $permissions = Permission::pluck('name')->toArray();
//        $roles = Role::pluck('name')->toArray();
//        $user = User::findOrFail(1);
//        $user->syncPermissions($permissions);
//        $user->syncRoles($roles);

    }

    // public function run()
    // {
    //     \App\Models\User::factory(5)->create();
    //     $this->call([
    //         UserSeeder::class,
    //     ]);
    // }
}
