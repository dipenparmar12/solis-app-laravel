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
        Schema::create('incomes', function (Blueprint $table) {
            $table->id();

            // // FK
            $table->unsignedBigInteger('project_id')->nullable();
            $table->foreign('project_id')->references('id')->on('projects')->onDelete('no action');

            $table->unsignedBigInteger('transaction_id')->nullable(); /// currently not used
            $table->foreign('transaction_id')->references('id')->on('transactions')->onDelete('no action');

            $table->unsignedBigInteger('received_by')->nullable();
            $table->foreign('received_by')->references('id')->on('users')->onDelete('no action');

            // //
            $table->string('from')->nullable(); // from whom give you money
            $table->integer('amount')->nullable();
            $table->date('date')->nullable();
            $table->string('particular')->nullable(); // Shows in receipt template
            $table->text('desc')->nullable(); // internal information

            // // created,updated,Delete By
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
        Schema::dropIfExists('incomes');
    }
};
