<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFundsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('funds', function (Blueprint $table) {
            $table->id();

            $table->double('amount');
            $table->dateTime('date');
            /*$table->boolean('is_approved')->nullable()->default(1)->comment = 'Deprecated not functional right now';*/

            // FK's
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('no action');
            $table->unsignedBigInteger('transaction_id')->nullable(); // PaymentMethod
            $table->foreign('transaction_id')->references('id')->on('transactions')->onDelete('no action');
            $table->unsignedBigInteger('project_id')->nullable();
            $table->foreign('project_id')->references('id')->on('projects')->onDelete('no action');

            $table->text('desc')->nullable();

            /// created,updated,Delete By
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();
            // $table->foreign('created_by')->references('id')->on('users')->onDelete('no action');
            // $table->foreign('updated_by')->references('id')->on('users');
            // $table->foreign('deleted_by')->references('id')->on('users');

            $table->integer('status')->nullable()->default(1); // Approval by user
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
        Schema::dropIfExists('funds');
    }
}
