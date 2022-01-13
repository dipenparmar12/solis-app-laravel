<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesSeeder extends Seeder
{
    public function run()
    {
        DB::table('roles')->delete();
        foreach (["admin", "team", "accountant", "executive"] as $item) {
            DB::table('roles')->insert(
                ["name" => $item, 'guard_name' => "web"]
            );
        }
    }
}
