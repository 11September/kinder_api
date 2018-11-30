<?php

use Faker\Generator as Faker;

$factory->define(App\Group::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'number' => $faker->randomNumber(),
        'school_id' => 1,
    ];
});