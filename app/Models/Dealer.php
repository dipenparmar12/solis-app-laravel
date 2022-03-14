<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Dealer extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name', 'mobile', 'firm', 'desc',
        'status',
    ];

    protected $hidden = [
        'deleted_at', 'created_at', 'updated_at',
    ];

//    public const ORDERS_BY_ALLOWED = [
//        'name', 'mobile', 'firm', 'desc',
//        'status',
//        'deleted_at', 'created_at', 'updated_at',
//    ];


    /**
     * Dealer -> Estimates
     */
    public function estimates(): HasMany
    {
        return $this
            ->hasMany(Estimate::class, 'dealer_id', 'id');
    }

    /**
     * Dealer -> Estimates
     */
    public function expenses(): HasMany
    {
        return $this
            ->hasMany(Expense::class, 'dealer_id', 'id');
    }

    /**
     * Dealer -> Estimates
     */
    public function payments(): HasMany
    {
        return $this
            ->hasMany(Payment::class, 'dealer_id','id');
    }

}
