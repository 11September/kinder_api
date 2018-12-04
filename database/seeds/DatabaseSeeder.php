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
            UsersTableSeeder::class,
            SchoolSeeder::class,
            GroupSeeder::class,
            StudentSeeder::class,
            PostSeeder::class,
            ElectivesSeeder::class,
            ElectivyPhotoSeeder::class,
        ]);
    }
}
