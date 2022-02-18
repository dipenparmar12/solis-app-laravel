<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\InteractsWithMedia;
use Wildside\Userstamps\Userstamps;
use Spatie\MediaLibrary\HasMedia;

class Income extends Model implements HasMedia
{
    use HasFactory, SoftDeletes;
    use InteractsWithMedia;
    use Userstamps;

    public const ORDERS_BY_ALLOWED = [
        'received_by', 'project_id', 'transaction_id',
        'from', 'amount', 'date',
        'particular', 'desc',
    ];

    protected $fillable = [
        'received_by', 'project_id', 'transaction_id',
        'from', 'amount', 'date',
        'particular', 'desc',
    ];

    protected $hidden = [
        'updated_by', 'deleted_by', 'deleted_at', 'created_at', 'updated_at',
    ];

    protected $dates = ['date'];

    /**
     *
     *
     */
    public function received_by_user(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'received_by', 'id')
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
