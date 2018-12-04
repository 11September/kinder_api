<?php

use Illuminate\Database\Seeder;

class ElectivyPhotoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\ElectivyPhoto::class, 2)->create();
    }
}
