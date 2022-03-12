<?php

namespace Database\Seeders;

use App\Models\Expense;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class ExpenseSeeder extends Seeder
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
        Expense::truncate();
        $this->importCsv(new Expense(), database_path('csv' . DIRECTORY_SEPARATOR . 'expenses.csv'));
        Schema::enableForeignKeyConstraints();
    }
}
