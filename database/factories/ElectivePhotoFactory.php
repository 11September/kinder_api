<?php

use Faker\Generator as Faker;

$factory->define(App\ElectivyPhoto::class, function (Faker $faker) {
    return [
        'electivy_id' => 1,
        'image' => $faker->imageUrl(),
    ];
});
