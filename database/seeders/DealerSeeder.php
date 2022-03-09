<?php

namespace Database\Seeders;

use App\Models\Dealer;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

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
        Schema::disableForeignKeyConstraints();
        Dealer::truncate();
        $this->importCsv(New Dealer(), database_path('csv\dealers.csv') );
        Schema::enableForeignKeyConstraints();
    }

}
