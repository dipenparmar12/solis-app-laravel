<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealers', function (Blueprint $table) {
            $table->id();

            // // Fields
            $table->string('name');
            $table->string('mobile')->nullable();
            $table->string('firm')->nullable();
            $table->text('desc')->nullable();

            // // created,updated,Delete By
            $table->integer('status')->nullable()->default(1);
//            $table->unsignedInteger('created_by')->nullable();
//            $table->unsignedInteger('updated_by')->nullable();
//            $table->unsignedInteger('deleted_by')->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('dealers');
    }
};
