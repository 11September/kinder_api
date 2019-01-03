<?php

use Faker\Generator as Faker;
use Illuminate\Support\Facades\DB;

$factory->define(App\Schedule::class, function (Faker $faker) {
    return [
        'school_id' => 1,
        'day' => "Monday",
    ];
});
