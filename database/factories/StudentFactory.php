<?php

use App\Student;
use Faker\Generator as Faker;

$factory->define(Student::class, function (Faker $faker) {
    return [
        'FIO' => $faker->title,
        'group_id' => 1,
        'birthday' => $faker->title,
        'status' => $faker->randomElement(['active' ,'inactive']),
    ];
});