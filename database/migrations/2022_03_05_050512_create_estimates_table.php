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
        Schema::create('estimates', function (Blueprint $table) {
            $table->id();

            // // FK
            $table->unsignedBigInteger('project_id')->nullable();
            $table->foreign('project_id')->references('id')->on('projects')->onDelete('no action');

            $table->unsignedBigInteger('dealer_id')->nullable();
            $table->foreign('dealer_id')->references('id')->on('dealers')->onDelete('no action');

            // //
            $table->integer('amount')->nullable();
            $table->date('s_date')->nullable();
            $table->date('e_date')->nullable();
            $table->text('desc')->nullable();
            $table->text('group_id')->nullable();

            $table->integer('status')->nullable()->default(1);

            // // created,updated,Delete By
            $table->unsignedInteger('created_by')->nullable();
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedInteger('deleted_by')->nullable();

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
        Schema::dropIfExists('estimates');
    }
};
