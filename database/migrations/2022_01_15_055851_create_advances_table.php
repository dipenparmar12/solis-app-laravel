<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdvancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('advances', function (Blueprint $table) {
            $table->id();

            // FK's
            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('no action');

            //
            $table->integer('amount')->nullable();
            $table->integer('paid_amount')->default(0)->nullable();
            $table->date('date');
            $table->boolean('settled')->default(0)->comment('advance is paid by salary, or direct cash'); // advance is paid by salary, or direct cash
            $table->json('emi_info')->nullable();
            /* alter table advances add emi_info json default null null; */

            /// created,updated,Delete By
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();
            $table->foreign('created_by')->references('id')->on('users')->onDelete('no action');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('advances');
    }
}
