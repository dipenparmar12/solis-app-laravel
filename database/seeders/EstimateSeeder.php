<?php

namespace Database\Seeders;

use App\Models\Estimate;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class EstimateSeeder extends Seeder
{
    use CsvImportTrait;
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
        Estimate::truncate();
        $this->importCsv(new Estimate(), database_path('csv' . DIRECTORY_SEPARATOR . 'estimates.csv'));
        Schema::enableForeignKeyConstraints();
    }
}
