<?php

namespace Database\Seeders;

use App\Models\Dealer;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DealerSeeder extends Seeder
{
    use CsvImportTrait;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Dealer::truncate();
        $this->importCsv(New Dealer(), database_path('csv\dealers.csv') );
    }

}
