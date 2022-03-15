<?php

namespace App\Models;

use App\Scopes\IsActiveScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Expense extends Model
{
    use HasFactory, SoftDeletes;
    use Userstamps;

    protected $fillable = [
        'amount', 'particular', 'date', 'is_approved',
        'desc',  'expense_by',  'category',
        'project_id', 'dealer_id', 'transaction_id',
    ];

    protected $hidden = [
        'updated_by', 'deleted_by',
        'created_at', 'updated_at', 'deleted_at',
    ];

    protected $dates = ['date'];

    public const ORDERS_BY_ALLOWED = [
        'amount', 'particular', 'date', 'is_approved',
        'desc', 'expense_by', 'category',
        'project_id', 'dealer_id', 'transaction_id',
    ];

    /**
     * dealer -> has one fund
     * @return BelongsTo
     */
    public function expense_by_user(): BelongsTo
    {
        return $this
            ->belongsTo(User::class, 'expense_by', 'id')
            ->withoutGlobalScope(IsActiveScope::class)
            ->select([
                'id', 'name',
            ]);
    }

    /**
     * dealer -> has one fund
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
     * dealer -> has one fund
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
