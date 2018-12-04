<?php

use Faker\Generator as Faker;

$factory->define(App\Post::class, function (Faker $faker) {
    return [
        'author_id' => 1,
        'title' => $faker->title,
        'excerpt' => $faker->text,
        'body' => $faker->text,
        'image' => $faker->imageUrl(),
        'status' => $faker->randomElement(['PUBLISHED' ,'DRAFT', 'PENDING']),
    ];
});
