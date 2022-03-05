<?php

namespace Database\Seeders;

use App\Models\Estimate;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

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
        Estimate::truncate();
        $this->importCsv(New Estimate(), database_path('csv\estimates.csv') );
    }
}
