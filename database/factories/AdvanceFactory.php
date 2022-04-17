<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class AdvanceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition(): array
    {
        $date = $this->faker->dateTimeBetween($startDate = '-12 months', $endDate = 'now');
        return [
            'user_id' => User::inRandomOrder()->first()->id,
            'amount' => $this->faker->numberBetween(1000, 25000),
            'date' => $date,
            'settled' => $this->faker->boolean(),
            'created_by' => User::inRandomOrder()->first()->id,
        ];
    }
}
