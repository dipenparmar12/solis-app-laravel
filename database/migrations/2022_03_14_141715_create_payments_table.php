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
        Schema::create('payments', function (Blueprint $table) {

            $table->id();

            $table->string('particular')->nullable();
            $table->bigInteger('amount')->default(2000);
            $table->date('date')->nullable(false);
            $table->text('desc')->nullable();
            $table->bigInteger('payment_by')->nullable();

            // // FK
            $table->foreignId('transaction_id')
                ->nullable()
                ->constrained('transactions', 'id')
                ->onDelete('no action');

            $table->foreignId('dealer_id')
                ->nullable()
                ->constrained('dealers', 'id')
                ->onDelete('no action');

            // // created,updated,Delete By
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();

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
        Schema::dropIfExists('payments');
    }
};
