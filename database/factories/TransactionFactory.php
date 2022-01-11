<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TransactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition(): array
    {
        $type = $this->faker->creditCardType();
        return [
            'type' => $type,
            'desc' => 'This is Description for Transaction: ' . $type,
            'status' => random_int(0, 1),
        ];
    }
}
