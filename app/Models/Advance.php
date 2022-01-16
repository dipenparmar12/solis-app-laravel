<?php

namespace App\Models;

use App\Scopes\IsActiveScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Advance extends Model
{
    use HasFactory, SoftDeletes;
    use Userstamps;

    public const PENDING = 0;
    public const PAYED = 1;
    public const ORDERS_BY_ALLOWED = [
        'id', 'user_id', 'amount', 'date', 'settled', 'created_by', 'created_at'
    ];
    protected $fillable = [
        'user_id', 'amount', 'date', 'paid_amount', 'settled', 'emi_info'
    ];
    protected $dates = ['date'];
    protected $hidden = [
        'updated_by', 'deleted_by', 'deleted_at', 'created_at', 'updated_at',
    ];
    protected $casts = [
        'emi_info' => 'object',
    ];

//    public const FILTERS_ALLOWED = [
//        'id', 'user_id', 'amount', 'month_year', 'deduction', 'created_by',
//    ];

    public function user(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'user_id', 'id')
            ->select('id', 'name')
            ->withoutGlobalScope(IsActiveScope::class);
    }
}
