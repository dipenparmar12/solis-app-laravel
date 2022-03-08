<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
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

//
//    /**
//     * Project -> has one fund
//     * @return BelongsTo
//     */
//    public function project(): BelongsTo
//    {
//        return $this
//            ->belongsTo(Project::class, 'project_id', 'id')
//            ->select([
//                'id', 'client', 'title'
//            ]);
//    }
//
//    /**
//     * dealer -> has one fund
//     * @return BelongsTo
//     */
//    public function dealer(): BelongsTo
//    {
//        return $this
//            ->belongsTo(Dealer::class, 'dealer_id', 'id')
//            ->select([
//                'id', 'firm',
//            ]);
//    }
}
