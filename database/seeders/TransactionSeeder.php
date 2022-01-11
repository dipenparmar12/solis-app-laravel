<?php

namespace Database\Seeders;

use App\Models\Transaction;
use Illuminate\Database\Seeder;

class TransactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Transaction::query()->delete();

        $transactionsTypes = [
            'Cash', 'Google pay', 'Phone Pay', 'Paytm',
            'Account Transfer', 'Cheque', 'Card payment', 'Current Account Transfer',
            'Deduction/Penalty',
            'Other'
        ];

        foreach ($transactionsTypes as $type) {
            Transaction::create([
                'type' => $type,
                'desc' => 'This is Description FOR ' . $type,
                'status' => random_int(0, 1),
            ]);
        }
    }
}
