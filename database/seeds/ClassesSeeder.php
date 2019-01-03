<?php

use Illuminate\Database\Seeder;

class ClassesSeeder extends Seeder
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

        DB::table('classes')->insert([
            ['schedule_id' => 1, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 1, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 1, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 1, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],

            ['schedule_id' => 2, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 2, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 2, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 2, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],

            ['schedule_id' => 3, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 3, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 3, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 3, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],

            ['schedule_id' => 4, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 4, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 4, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 4, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],

            ['schedule_id' => 5, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 5, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 5, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 5, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],

            ['schedule_id' => 6, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
            ['schedule_id' => 6, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],

            ['schedule_id' => 7, 'name' => $faker->name, 'from' => $faker->time(), 'to' => $faker->time()],
        ]);
    }
}
