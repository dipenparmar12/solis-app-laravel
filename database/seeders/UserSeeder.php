<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::factory()->count(rand(20,50))->create();

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
