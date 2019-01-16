<?php

use Illuminate\Database\Seeder;

class FoodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        factory(App\Clas::class, 5)->create();

        $faker = \Faker\Factory::create();

        DB::table('foods')->insert([
            ['nutrition_id' => 1, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 1, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 1, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 1, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],

            ['nutrition_id' => 2, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 2, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 2, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 2, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],

            ['nutrition_id' => 3, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 3, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 3, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 3, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],

            ['nutrition_id' => 4, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 4, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 4, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 4, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],

            ['nutrition_id' => 5, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 5, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 5, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 5, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],

            ['nutrition_id' => 6, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
            ['nutrition_id' => 6, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],

            ['nutrition_id' => 7, 'name' => $faker->name, 'type' => $faker->randomElement(['breakfast' ,'lunch', 'afternoon-tea', 'dinner'])],
        ]);
    }
}
