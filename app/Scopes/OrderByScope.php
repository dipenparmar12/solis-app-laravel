<?php

namespace App\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;

//// How to use it
//class User {
//
//    public static function boot()
//    {
//        parent::boot();
//        static::addGlobalScope(new OrderByScope());
//        User::observe(new UserObserver());
//    }
//}
///// Query Get Active/inActive users
//// User::withoutGlobalScope(IsActive::class)->get();

class OrderByScope implements Scope
{
    /**
     * @var string
     * Column name where isActive apply
     */
    protected $column_name;

    /**
     * @var mixed|string
     */
    protected $order_by;

    /**
     * IsActiveScope constructor.
     */
    public function __construct($colum_name = 'id', $order_by = 'DESC')
    {
        $this->column_name = $colum_name;
        $this->order_by = $order_by;
    }

    /**
     * Apply the scope to a given Eloquent query builder.
     *
     * @param Builder $builder
     * @param Model $model
     * @return void
     */
    public function apply(Builder $builder, Model $model)
    {
        $builder->orderBy($this->column_name, $this->order_by);
    }
}
