<?php

use Faker\Generator as Faker;

$factory->define(App\Post::class, function (Faker $faker) {
    return [
        'title' => $faker->title,
        'body' => $faker->text,
        'until' => $faker->date(),
        'school_id' => 1,
        'image' => $faker->imageUrl(),
        'preview' => $faker->imageUrl()
    ];
});
