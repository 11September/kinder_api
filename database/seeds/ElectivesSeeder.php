<?php

use Illuminate\Database\Seeder;

class ElectivesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Electivy::class, 2)->create();
    }
}
