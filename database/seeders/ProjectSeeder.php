<?php

namespace Database\Seeders;

use App\Models\Project;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
//        $this->importCsv(new Expense(), database_path('csv\expenses.csv'));
        Project::truncate();
        Project::factory(50)->create();
        Schema::enableForeignKeyConstraints();
    }
}
