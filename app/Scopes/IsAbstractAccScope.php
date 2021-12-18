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
//        static::addGlobalScope(new IsActive());
//        User::observe(new UserObserver());
//    }
//}

///// Query Get Active/inActive users
//// User::withoutGlobalScope(IsActive::class)->get();

class IsAbstractAccScope implements Scope
{
    /**
     * @var string
     * Column name where isActive apply
     */
    protected $is_abstract;

    /**
     * IsAbstractAccScope constructor.
     */
    public function __construct($is_abstract = 0)
    {
        $this->is_abstract = $is_abstract;
    }

    /**
     * Apply the scope to a given Eloquent query builder.
     *
     * @param Builder $builder
     * @param Model $model
     *
     * @return void
     */
    public function apply(Builder $builder, Model $model)
    {
        $builder->where($this->is_abstract, 0);
    }
}