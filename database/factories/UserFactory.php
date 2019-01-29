<?php

use Faker\Generator as Faker;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', // secret
        'token' => str_random(5),
        'remember_token' => str_random(10),
        'push' => $faker->randomElement(['enabled', 'disabled']),

        'parent_name' => $faker->name,
        'parent_phone' => $faker->phoneNumber,
        'parents' => $faker->randomElement(['father', 'mother']),
        'address' => $faker->address,
        'birthday' => $faker->date(),
        'school_id' => 1,
        'group_id' => 1,
        'status' => "active",
    ];
});

$faker = \Faker\Factory::create();

DB::table('users')->insert([
    'name' => "Станислав",
    'email' => "admin@admin.com",
    'email_verified_at' => now(),
    'password' => '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', // secret
    'token' => str_random(5),
    'remember_token' => str_random(10),
    'push' => $faker->randomElement(['enabled', 'disabled']),

    'parent_name' => $faker->name,
    'parent_phone' => $faker->phoneNumber,
    'parents' => $faker->randomElement(['father', 'mother']),
    'address' => $faker->address,
    'birthday' => $faker->date(),
    'school_id' => null,
    'group_id' => null,
    'status' => "active",
    'type' => "admin"
]);

DB::table('users')->insert([
    'name' => "Вихователь",
    'email' => "moderator@admin.com",
    'email_verified_at' => now(),
    'password' => '$2y$10$GlmMdEEq9DXG3lGnj2PrU.TeRy88/TXl7ZQFUcaF0hYpgJJwxwiS2', // password
    'token' => str_random(5),
    'remember_token' => str_random(10),
    'push' => $faker->randomElement(['enabled', 'disabled']),

    'parent_name' => $faker->name,
    'parent_phone' => $faker->phoneNumber,
    'parents' => $faker->randomElement(['father', 'mother']),
    'address' => $faker->address,
    'birthday' => $faker->date(),
    'school_id' => null,
    'group_id' => null,
    'status' => "active",
    'type' => "moderator"
]);
