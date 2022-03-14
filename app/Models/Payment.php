<?php

namespace App\Models;

use App\Scopes\IsActiveScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Payment extends Model
{
    use HasFactory, SoftDeletes;
    use Userstamps;

    protected $fillable = [
        'amount', 'particular', 'date',
        'desc',  'payment_by',
        'dealer_id', 'transaction_id',
    ];

    protected $hidden = [
        'updated_by', 'deleted_by',
        'created_at', 'updated_at', 'deleted_at',
    ];

    protected $dates = ['date'];

    public const ORDERS_BY_ALLOWED = [
        'amount', 'particular', 'date',
        'desc',  'payment_by',
        'dealer_id', 'transaction_id',
    ];

    /**
     * Model -> has one fund
     * @return BelongsTo
     */
    public function payment_by_user(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'payment_by', 'id')
            ->withoutGlobalScope(IsActiveScope::class)
            ->select([
                'id', 'name',
            ]);
    }

    /**
     * Model -> has one fund
     * @return BelongsTo
     */
    public function transaction(): BelongsTo
    {
        return $this
            ->belongsTo(Transaction::class, 'transaction_id', 'id')
            ->select([
                'id', 'type',
            ]);
    }

    /**
     * Model -> has one fund
     * @return BelongsTo
     */
    public function dealer(): BelongsTo
    {
        return $this
            ->belongsTo(Dealer::class, 'dealer_id', 'id')
            ->select([
                'id', 'firm',
            ]);
    }

}
