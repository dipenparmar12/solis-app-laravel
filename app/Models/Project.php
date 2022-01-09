<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Project extends Model
{
    use HasFactory;
    use SoftDeletes,
        Userstamps;

    const DAYS = 1;
    const HOURS = 24;
    const SECONDS = 60;
    const MINUTES = 60;
    const CACHE_REMEMBER_TTL = self::SECONDS * self::MINUTES * self::HOURS * self::DAYS;

    const PIC_MEDIA_COLLECTION = 'project_image';

    protected $fillable = [
        'title', 'budget', 's_date', 'e_date', 'location', 'p_type', 'sqft', 'wip', 'client', 'address',
    ];

    protected $dates = ['s_date', 'e_date'];

    protected $hidden = [
        'updated_by', 'deleted_by', 'deleted_at', 'created_at', 'updated_at',
    ];

}
