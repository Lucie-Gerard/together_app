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
        Schema::create('locations', function (Blueprint $table) {
            $table->id();
            $table->float('coord_x')->nullable();
            $table->float('coord_y')->nullable();
            $table->unsignedInteger('postal_code');
            $table->string('locality_fr');
            $table->string('locality_nl');
            $table->string('locality_de');
            $table->string('locality_lu');
            $table->string('locality_en');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('locations');
    }
};
