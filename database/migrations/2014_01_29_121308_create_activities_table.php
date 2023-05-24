<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('activities', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->dateTime('start_datetime');
            $table->integer('duration');
            $table->longText('description');
            $table->integer('max_nb_participants');
            $table->unsignedBigInteger('location_id')->nullable();
            $table->timestamps();

            $table->foreignId('orga_id')->references('id')->on('users')->onDelete('CASCADE')->onUpdate('CASCADE');
            $table->foreign('location_id')->references('id')->on('locations')->onDelete('SET NULL')->onUpdate('SET NULL');
            $table->foreignId('category_id')->nullable()->references('id')->on('categories')->onDelete('SET NULL')->onUpdate('SET NULL');
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('activities');
    }
};
