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
        Schema::create('follower_following', function (Blueprint $table) {
            $table->foreignId('follower_id')->references('id')->on('users')->onDelete('CASCADE')->onUpdate('CASCADE');
            $table->foreignId('following_id')->references('id')->on('users')->onDelete('CASCADE')->onUpdate('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('follower_following');
    }
};
