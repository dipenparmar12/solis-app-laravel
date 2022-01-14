<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalariesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('salaries', function (Blueprint $table) {
            $table->id();

            // FK's
            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('no action');

            $table->date('month_year');
            $table->integer('amount'); // ALTER TABLE `salaries` ADD `amount` INT NOT NULL AFTER `month_year`;
            $table->integer('deduction')->default(0)->nullable(); // ALTER TABLE `salaries` ADD `deduction` INT NOT NULL AFTER `amount`;
//            alter table salaries modify deduction int default 0 not null comment 'Just for reference not used logically. this field used for calc installments dynamically ';

            /// Deprecated
            // $table->unsignedBigInteger('advance_id')->nullable();
            // $table->foreign('advance_id')->references('id')->on('advances')->onDelete('no action');

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
        Schema::dropIfExists('salaries');
    }
}
