<?php

namespace Database\Seeders;

use App\Models\Fund;
use Illuminate\Database\Seeder;

class FundSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Fund::factory()->count(rand(20,100))->create();
    }
}
