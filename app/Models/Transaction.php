<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Transaction extends Model
{
    use HasFactory, SoftDeletes;
    use Userstamps;

    const CACHE_REMEMBER_TTL = 7 * 24 * 60 * 60; // 7 Days

    protected $fillable = [
        'type', 'desc', 'status'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'deleted_by', 'deleted_at',
    ];

}
