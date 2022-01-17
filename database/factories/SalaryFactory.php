<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class SalaryFactory extends Factory
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
            'user_id' => User::orderByRaw('RAND()')->first()->id,
            'amount' => $this->faker->numberBetween(1000, 5000),
            'month_year' => $date,
//            'settled' => $this->faker->boolean(),
//            'created_by' => User::orderByRaw('RAND()')->first()->id,
        ];
    }
}
