<?php

namespace Database\Seeders;

use App\Models\Payment;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class PaymentSeeder extends Seeder
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
        Payment::truncate();
        $this->importCsv(new Payment(), database_path('csv' . DIRECTORY_SEPARATOR . 'payments.csv'));
        Schema::enableForeignKeyConstraints();
    }
}
