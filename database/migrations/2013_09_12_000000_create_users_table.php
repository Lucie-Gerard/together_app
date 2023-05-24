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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->foreignId('current_team_id')->nullable();
            $table->string('profile_photo_path', 2048)->nullable();
            $table->date('birthdate');
            $table->string('short_description', 255);
            $table->longText('long_description');
            $table->unsignedBigInteger('location_id')->nullable();
            $table->unsignedInteger('country_id')->nullable();
            $table->timestamps();

            $table->foreign('location_id')->references('id')->on('locations')->onDelete('SET NULL')->onUpdate('SET NULL');
            $table->foreign('country_id')->references('iso_code')->on('countries')->onDelete('SET NULL')->onUpdate('SET NULL');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
