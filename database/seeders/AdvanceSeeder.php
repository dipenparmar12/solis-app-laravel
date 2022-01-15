<?php

namespace Database\Seeders;

use App\Models\Advance;
use Exception;
use Illuminate\Database\Seeder;

class AdvanceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     * @throws Exception
     */
    public function run()
    {
        Advance::factory()->count(rand(150, 400))->create();
    }
}
