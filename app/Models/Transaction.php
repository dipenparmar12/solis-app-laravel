<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaction extends Model
{
    use HasFactory,SoftDeletes;

    const CACHE_REMEMBER_TTL = 7 * 24 * 60 * 60; // 7 Days

    protected $fillable = [
        'type', 'desc', 'status'
    ];

}
