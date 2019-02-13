<?php

use Faker\Generator as Faker;

$factory->define(App\Post::class, function (Faker $faker) {
    return [
        'title' => $faker->title . $faker->title,
        'body' => $faker->text,
        'until' => $faker->date(),
        'school_id' => 1,
//        'image' => "/images/uploads/posts/3c5e87306fbd0455-640x485.png",
//        'preview' => "/images/uploads/posts/images.jpg",
        'image' => "null",
        'preview' => "null"
    ];
});
