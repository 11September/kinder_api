<?php

use Faker\Generator as Faker;

$factory->define(App\Group::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'user_id' => 1,
        'moderator_id' => 1,
    ];
});
