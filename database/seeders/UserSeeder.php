<?php

namespace Database\Seeders;

use App\Models\Advance;
use App\Models\Salary;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = Permission::pluck('name')->toArray();
        $roles = Role::pluck('name')->toArray();
        $users = ['dipensavji', 'amar'];
        foreach ($users as $user) {
            $user = User::create([
                'name' => $user,
                'email' => $user . '@gmail.com',
                'password' => Hash::make('Admin@123'),
                // 'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
                'mobile' => 9725722434 + rand(100,1000),
                'salary' => 5000 * rand(2, 8),
                'dob' => now()->subMonth(rand(1, 24)),
                'doj' => now()->subMonth(rand(1, 24)),
                'address' => 'Permanent Address of Users is ...',
                'pic' => 'img/profile_pic.png',
                'role_id' => random_int(0, 3),
                'link' => 'www.facebook.com/dipen.parmar.186'
            ]);
            $user->syncPermissions($permissions);
            $user->syncRoles($roles);
            // for ($i = 0, $iMax = random_int(1, 4); $i <= $iMax; $i++) {
            //     $user->assignRole(['team', Role::orderByRaw('RAND()')->first()->name]);
            // }
        }

        User::factory()
            ->has(Advance::factory()->count(rand(1, 4)), 'advances')
            ->has(Salary::factory()->count(1), 'salaries')
            ->count(rand(5, 20))
            ->create();

//        DB::table('users')->insert([
//            'name' => Str::random(10),
//            'email' => 'dipen@gmail.com',
//            'password' => Hash::make('Admin@123'),
//            'mobile' => 9898989 * rand(3, 8),
//            'salary' => 2000 * rand(2, 10),
//            'role_id' => random_int(0, 3),
//        ]);
//         User::factory()->count(20)->hasPosts(1)->create();
    }
}
