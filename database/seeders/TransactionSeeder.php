<?php

namespace Database\Seeders;

use App\Models\Transaction;
use App\Traits\CsvImportTrait;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class TransactionSeeder extends Seeder
{
    use CsvImportTrait;
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Transaction::query()->delete();
        Schema::disableForeignKeyConstraints();
        Transaction::truncate();
        $this->importCsv(new Transaction(), database_path('csv' . DIRECTORY_SEPARATOR . 'transactions.csv'));
        Schema::enableForeignKeyConstraints();

        // Transaction::query()->delete();
        // $transactionsTypes = [
        //     'Cash', 'Google pay', 'Phone Pay', 'Paytm',
        //     'Account Transfer', 'Cheque', 'Card payment', 'Current Account Transfer',
        //     'Deduction/Penalty',
        //     'Other'
        // ];
        // foreach ($transactionsTypes as $type) {
        //     Transaction::create([
        //         'type' => $type,
        //         'desc' => 'This is Description FOR ' . $type,
        //         'status' => random_int(0, 1),
        //     ]);
        //     // $exists = !Transaction::where('type', $type)->first();
        //     // if (!$exists) {}
        // }
    }
}
