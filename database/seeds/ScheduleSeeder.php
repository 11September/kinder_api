<?php

use Illuminate\Database\Seeder;

class ScheduleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('schedules')->insert([
            ['school_id' => 1, 'group_id' => 1, 'day' => "Monday"],
            ['school_id' => 1, 'group_id' => 1, 'day' => "Tuesday"],
            ['school_id' => 1, 'group_id' => 1, 'day' => "Wednesday"],
            ['school_id' => 1, 'group_id' => 1, 'day' => "Thursday"],
            ['school_id' => 1, 'group_id' => 1, 'day' => "Friday"],
            ['school_id' => 1, 'group_id' => 1, 'day' => "Saturday"],
            ['school_id' => 1, 'group_id' => 1, 'day' => "Sunday"]
        ]);
    }
}
