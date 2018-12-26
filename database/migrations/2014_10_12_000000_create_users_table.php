<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');

            $table->string('parent_name')->nullable();
            $table->string('parent_phone')->nullable();
            $table->enum('parents', ['father', 'mother'])->nullable();
            $table->string('address')->nullable();
            $table->date('birthday')->nullable();

            $table->integer('school_id')->nullable();
            $table->integer('group_id')->nullable();
            $table->enum('status', ['active', 'disable'])->default('active');

            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('token')->unique();
            $table->enum('push', ['enabled', 'disabled']);
            $table->string('type')->default('default');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
