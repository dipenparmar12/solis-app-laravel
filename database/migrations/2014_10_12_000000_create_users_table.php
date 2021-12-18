<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
            $table->integer('salary')->nullable();
            $table->bigInteger('fund')->default(0);
            $table->integer('role_id')->nullable();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('mobile')->nullable();
            $table->date('dob')->nullable();
            $table->date('doj')->nullable();
            $table->text('address')->nullable();
            $table->string('education')->nullable();
            $table->string('user_type')->default('executive');
            $table->string('link')->nullable();
            $table->tinyInteger('active')->nullable()->default(1);

            $table->tinyInteger('is_abstract')->nullable()->default(0);

            //// Created,Updated,Deleted By
            $table->unsignedInteger('updated_by')->nullable();
            //            $table->foreign('updated_by')->references('id')->on('users');
            $table->unsignedInteger('created_by')->nullable();
            //            $table->foreign('created_by')->references('id')->on('users');
            $table->unsignedInteger('deleted_by')->nullable();
            //            $table->foreign('deleted_by')->references('id')->on('users');

            $table->string('pic')->default('profile_pic.png');
            $table->rememberToken();
            $table->softDeletes();
            $table->timestamps();
            $table->integer('status')->default(1);
            $table->timestamp('email_verified_at')->nullable();
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
