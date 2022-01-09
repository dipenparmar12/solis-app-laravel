<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectsTable extends Migration
{
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('id');
            $table->string('client')->default('Compnay Client');
            $table->string('title')->nullable(false)->unique(); // SiteName LakeSide Habitet
            $table->bigInteger('budget')->default(0);// 300k

            $table->date('s_date')->nullable(false); // Project Initial Date
            $table->date('e_date')->nullable();  // Estimated end date, Finish
            $table->string('location')->default('Whitefield');// Sarjapur, HSR, WhiteField
            $table->string('p_type')->nullable("Villa"); // Apa, Villa, Penthouse, 1BHK, 2BHK 3BHK, 4BHK, Villa
            $table->string('sqft')->default(0)->nullable(); // 500 Sqft
            $table->boolean('wip')->default(1);  // Project is Compaleted or Work in Progress
            $table->text('address')->nullable();

            $table->bigInteger('income')->default(0);
            $table->bigInteger('expense')->default(0);

            //// Created,Updated,Deleted By
            $table->unsignedInteger('updated_by')->nullable();
//            $table->foreign('updated_by')->references('id')->on('users');
            $table->unsignedInteger('created_by')->nullable();
//            $table->foreign('created_by')->references('id')->on('users');
            $table->unsignedInteger('deleted_by')->nullable();
//            $table->foreign('deleted_by')->references('id')->on('users');

            $table->softDeletes();
            $table->integer('status')->nullable()->default(1);
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
        Schema::dropIfExists('projects');
    }
}
