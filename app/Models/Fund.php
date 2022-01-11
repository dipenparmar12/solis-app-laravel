<?php

namespace App\Models;

use App\Scopes\IsActiveScope;
use App\Scopes\OrderByScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Fund extends Model
{
    use HasFactory, SoftDeletes;
    use Userstamps;

    public const DAYS = 2;
    public const CACHE_TTL = self::DAYS * (24 * 60 * 60); // Cache time-to-live

    protected $fillable = [
        'user_id', 'transaction_id', 'project_id',
        'amount', 'date',
        'status',
        'pic',
    ];

    protected $hidden = [
        'updated_by', 'deleted_by', 'deleted_at', 'created_at', 'updated_at',
    ];

    protected $dates = ['date'];


    // TODO::Enable latter, queries orderBy DESC by default
    public static function boot()
    {
        parent::boot();
        static::addGlobalScope(new OrderByScope('funds.date', 'DESC'));
    }

    /**
     *
     * @return BelongsTo
     */
    public function given_to(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'user_id', 'id')
            ->select('id', 'name', 'fund')
            ->withoutGlobalScope(IsActiveScope::class);
    }

    /**
     *
     *
     */
    public function received_from(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'created_by', 'id')
            ->select('id', 'name');
    }

    /**
     * Project -> has one fund
     * @return BelongsTo
     */
    public function project(): BelongsTo
    {
        return $this
            ->belongsTo(Project::class, 'project_id', 'id')
            ->select([
                'id', 'client', 'title'
            ]);
    }

    /**
     * @return BelongsTo
     */
    public function transaction(): BelongsTo
    {
        return $this
            ->belongsTo(Transaction::class)
            ->select([
                'id', 'type',
                // 'active', 'desc'
            ]);
    }
}
