<?php

namespace App\Models;

use App\Scopes\IsActiveScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Wildside\Userstamps\Userstamps;
// 
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;


// use App\Observers\AuthUserCacheObserver;
// use DateTimeInterface;
// use Eloquent;
// use Illuminate\Auth\Passwords\CanResetPassword;
// use Illuminate\Database\Eloquent\Collection;
// use Illuminate\Database\Query\Builder;
// use Illuminate\Notifications\DatabaseNotification;
// use Illuminate\Notifications\DatabaseNotificationCollection;
// use Illuminate\Support\Carbon;
// use Laravel\Sanctum\PersonalAccessToken;
// use Spatie\Permission\Models\Permission;
// use Spatie\Permission\Models\Role;

class User extends Authenticatable implements HasMedia
{
    use HasApiTokens, HasFactory, Notifiable;
    use
        Notifiable,
        SoftDeletes,
        Userstamps,
        HasRoles;
    use InteractsWithMedia;

    const PIC_MEDIA_COLLECTION = 'avatars';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name', 'email', 'password',
        'mobile', 'dob', 'pic', 'address', 'salary', 'role_id', 'doj', 'link', "user_type",
        'active',
        'is_abstract'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_secret',
        'two_factor_recovery_codes',
        "email_verified_at", "updated_by", "deleted_by", "deleted_at", "created_at", "updated_at",
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $dates = ['deleted_at', 'dob', 'doj'];

    public const ORDERS_BY_ALLOWED = [
        'name', 'email', 'password',
        'mobile', 'dob', 'pic', 'address', 'salary', 'role_id', 'doj', 'link', 'user_type',
        'active',
        'is_abstract'
    ];

    public static function boot()
    {
        parent::boot();
        static::addGlobalScope(new IsActiveScope('users.active'));
    }

    public function advances(): HasMany
    {
        return $this->hasMany(Advance::class, 'user_id', 'id');
    }

    public function salaries(): HasMany
    {
        return $this->hasMany(Salary::class, 'user_id', 'id');
    }

    public function funds(): HasMany
    {
        return $this
            ->hasMany(Fund::class, 'user_id', 'id')
            ->orderByDesc('date');
    }

    public function expenses(): HasMany
    {
        return $this
            ->hasMany(Expense::class, 'expense_by', 'id')
            ->orderByDesc('date');
    }
}
