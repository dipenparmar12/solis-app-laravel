<?php

namespace Database\Seeders;

use App\Console\Commands\EnsureDatabaseState;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
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

        foreach (['dipensavji'] as $user) {
            $user = User::create([
                'name' => $user,
                'email' => $user . '@gmail.com',
                'password' => Hash::make('Admin@123'),
                // 'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
                'mobile' => 9898989 * rand(3, 8),
                'salary' => 4000 * rand(2, 5),
                'dob' => now(),
                'doj' => now(),
                'address' => 'Permanent Address of Users is ...',
                'pic' => 'img/profile_pic.png',
                'role_id' => random_int(0, 3),
                'link' => "www.facebook.com/dipen.parmar.186"
            ]);
            // for ($i = 0, $iMax = random_int(1, 4); $i <= $iMax; $i++) {
            //     $user->assignRole(['team', Role::orderByRaw('RAND()')->first()->name]);
            // }
        }

        $permissions = Permission::pluck('name')->toArray();
        $roles = Role::pluck('name')->toArray();

        $dipen = User::findOrFail(1);
        $dipen->syncPermissions($permissions);
        $dipen->syncRoles($roles);

    }

    // public function run()
    // {
    //     \App\Models\User::factory(5)->create();
    //     $this->call([
    //         UserSeeder::class,
    //     ]);
    // }
}
