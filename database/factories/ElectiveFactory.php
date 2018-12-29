<?php

use Faker\Generator as Faker;

$factory->define(App\Electivy::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'school_id' => 1,
        'time_start' => $faker->time(),
        'time_end' => $faker->time(),
    ];
});
