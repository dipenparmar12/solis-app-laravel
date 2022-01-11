<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();

            $table->string('type')->nullable(false)->unique();
            $table->string('desc')->nullable();
            $table->tinyInteger('active')->nullable()->default(1);

            /// created,updated,Delete By
            $table->unsignedInteger('updated_by')->nullable();
//            $table->foreign('updated_by')->references('id')->on('users');
            $table->unsignedInteger('created_by')->nullable();
//            $table->foreign('created_by')->references('id')->on('users');
            $table->unsignedInteger('deleted_by')->nullable();
//            $table->foreign('deleted_by')->references('id')->on('users');

            $table->integer('status')->nullable()->default(1);
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
        Schema::dropIfExists('transactions');
    }
}
