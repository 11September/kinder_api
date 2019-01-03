<?php

use Faker\Generator as Faker;

$factory->define(App\Clas::class, function (Faker $faker) {
    return [
        'schedule_id' => 1,
        'name' => $faker->name,
        'from' => $faker->time(),
        'to' => $faker->time(),
    ];
});
