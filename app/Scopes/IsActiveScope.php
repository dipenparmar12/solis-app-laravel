<?php

namespace App\Scopes;

use Illuminate\Database\Eloquent\Scope;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


//// How to use it
//class User {
//
//    public static function boot()
//    {
//        parent::boot();
//        static::addGlobalScope(new IsActive());
//        User::observe(new UserObserver());
//    }
//}

///// Query Get Active/inActive users
//// User::withoutGlobalScope(IsActive::class)->get();

class IsActiveScope implements Scope
{
    /**
     * @var string
     * Column name where isActive apply
     */
    protected $column;

    /**
     * IsActiveScope constructor.
     */
    public function __construct($colum = 'active')
    {
        $this->column = $colum;
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
        $builder->where($this->column, 1);
    }
}
