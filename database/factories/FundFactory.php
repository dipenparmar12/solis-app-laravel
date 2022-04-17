<?php

namespace Database\Factories;

use App\Models\Project;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Exception;

class FundFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     * @throws Exception
     * @see https://laracasts.com/discuss/channels/general-discussion/random-startend-date-seeder-problem DateBetween
     */
    public function definition(): array
    {
        $date = $this->faker->dateTimeBetween($startDate = '-6 months', $endDate = 'now');
        return [
            'user_id' => User::inRandomOrder()->first()->id,
            'project_id' => $this->faker->randomElement([Project::inRandomOrder()->first()->id, null]),
            'transaction_id' => Transaction::inRandomOrder()->first()->id,
            'amount' => random_int(4500, 15000),
            'date' => $date,
            'created_by' => User::inRandomOrder()->first()->id,
            // 'is_approved' => 1,
        ];
    }
}
