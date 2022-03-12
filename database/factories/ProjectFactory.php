<?php

namespace Database\Factories;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProjectFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $starts_at = Carbon::create($this->faker->date());
        $ends_at = Carbon::createFromFormat('Y-m-d H:i:s', $starts_at)->addWeeks($this->faker->numberBetween(1, 10));

        return [
            'title' => $this->faker->domainName . $this->faker->numberBetween(0, 1000)
            , 'budget' => $this->faker->numberBetween(90000, 1000000)
            , 's_date' => $starts_at
            , 'e_date' => $ends_at
            , 'location' => $this->faker->city
            , 'p_type' => $this->faker->randomElement(['Villa', 'Apartment', 'Penthouse', 'Residency' . 'ProType'])
            , 'sqft' => $this->faker->numberBetween(3000, 10000)
            , 'wip' => $this->faker->randomElement([1, 0])
            , 'client' => $this->faker->name
            , 'address' => $this->faker->paragraph
            , 'income' => rand(100, 10000)
            , 'expense' => rand(100, 10000)
        ];
    }
}
