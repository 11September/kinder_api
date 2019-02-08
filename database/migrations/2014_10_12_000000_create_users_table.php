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
            $table->enum('type', ['admin', 'moderator', 'default'])->default('default');
            $table->string('token')->unique();

            $table->integer('school_id')->nullable();
            $table->integer('group_id')->nullable();

            $table->string('parent_name')->nullable();
            $table->string('parent_phone')->nullable()->unique();
            $table->enum('parents', ['father', 'mother'])->nullable();
            $table->string('address')->nullable();
            $table->date('birthday')->nullable();
            $table->string('avatar')->nullable();

            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');

            $table->enum('push', ['enabled', 'disabled']);
            $table->string('player_id', 36)->nullable();
            $table->enum('push_chat', ['true', 'false'])->default('true');
            $table->enum('status', ['active', 'disable'])->default('active');

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
