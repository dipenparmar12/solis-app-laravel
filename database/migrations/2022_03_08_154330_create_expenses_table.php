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
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();

            $table->string('particular')->nullable();
            $table->bigInteger('amount')->default(2000);
            $table->date('date')->nullable(false);
            $table->text('desc')->nullable();
            $table->bigInteger('expense_by')->nullable();
            $table->string('category')->nullable(); // office,project,personal,other,fund_transfer // TODO DEV
//            $table->boolean('in_favour')->nullable()->default();

            // // FK
            $table->boolean('is_approved')->nullable();
            $table->foreignId('approval_by')
                ->nullable()
                ->constrained('users', 'id')
                ->onDelete('no action');

            $table->foreignId('project_id')
                ->nullable()
                ->constrained('projects', 'id')
                ->onDelete('no action');

            $table->unsignedBigInteger('dealer_id')->nullable();
            $table->foreign('dealer_id')->references('id')->on('dealers')->onDelete('no action');

            $table->unsignedBigInteger('transaction_id')->nullable();
            $table->foreign('transaction_id')->references('id')->on('transactions')->onDelete('no action');


            // // created,updated,Delete By
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();
            $table->unsignedInteger('created_by_origin')->nullable();

            $table->integer('status')->nullable()->default(1);
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
        Schema::dropIfExists('expenses');
    }
};
