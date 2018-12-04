<?php

use Faker\Generator as Faker;

$factory->define(App\Electivy::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'title' => $faker->title(),
        'description' => $faker->text(160),
        'time' => $faker->time(),
    ];
});
