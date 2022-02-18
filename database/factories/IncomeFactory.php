<?php

namespace Database\Factories;

use App\Models\Income;
use App\Models\Project;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory
 */
class IncomeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $date = $this->faker->dateTimeBetween($startDate = '-12 months', $endDate = 'now');
        return [
            'received_by' => User::orderByRaw('RAND()')->first()->id,
            'project_id' => Project::orderByRaw('RAND()')->first()->id,
            'transaction_id' => Transaction::orderByRaw('RAND()')->first()->id,

            'from' => $this->faker->firstName(),
            'amount' => $this->faker->randomElement(
                [500, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500, 7000, 7500]
            ),
            'date' => $date,
            'particular' => $this->faker->randomElement(['Booking', 'reminding', 'partial']) . " amount received",
            'desc' => $this->faker->paragraph(2),

            'created_by' => User::orderByRaw('RAND()')->first()->id,
        ];
    }
}

//            'amount' => $this->faker->numberBetween(500, 5000),
