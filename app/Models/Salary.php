<?php

namespace App\Models;

use App\Scopes\IsActiveScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Salary extends Model
{
    use HasFactory, SoftDeletes;
    use Userstamps;

    protected $fillable = [
        'user_id', 'month_year', 'amount', 'deduction',
    ];

    protected $dates = ['month_year'];

    protected $hidden = [
        'updated_by', 'deleted_by', 'deleted_at', 'updated_at',
    ];

//    public const FILTERS_ALLOWED = [
//        'id', 'user_id', 'amount', 'month_year', 'deduction', 'created_by',
//    ];

    public const ORDERS_BY_ALLOWED = [
        'id', 'user_id', 'amount', 'month_year', 'deduction', 'created_at', 'updated_at', 'created_by', 'updated_by'
    ];

    //// TODO:IMP BUG, DB
    public function user(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'user_id', 'id')
            ->select('id', 'name')
            ->withoutGlobalScope(IsActiveScope::class);
    }

    public function created_by_user(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'created_by')
            ->withoutGlobalScope(IsActiveScope::class)
            ->select([
                'id', 'name',
            ]);
    }

    public static function getTableName(): string
    {
        return Salary::query()->getQuery()->from;
    }
}
