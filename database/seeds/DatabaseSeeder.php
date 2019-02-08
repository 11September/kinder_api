<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);

        $this->call([
            UserSeeder::class,
//            SchoolSeeder::class,
//            GroupSeeder::class,
//            StudentSeeder::class,
//            PostSeeder::class,
//            ElectivesSeeder::class,
//            ScheduleSeeder::class,
//            ClassesSeeder::class,
//            NutritionSeeder::class,
//            FoodsSeeder::class,
        ]);
    }
}
