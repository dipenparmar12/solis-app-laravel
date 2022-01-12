<?php

namespace App\Services;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Throwable;

/**
 * TODO::Required Trait for reusable logic
 * @example  http://localhost/dev/api/salaries?sort_by[]=-id&sort_by[]=-id&user_id=2&per_page=2&user_id=2
 */
class QueryStrService
{
    public $request = null;

    /**
     * AdvanceApiController constructor.
     * @param Request|null $request
     */
    public function __construct(Request $request = null)
    {
        $this->request = $request ?: request();
    }


    /**
     * @param $model
     * @return Collection
     * @example
     * $qry->when(count($this->makeOrderBy()), function ($qry) use ($orderByPairs) {
     * $orderByPairs->each(function ($pair) use ($qry) {
     *      if ($pair && count($pair)) {
     *          // Use the 'splat' to turn the pair into two arguments
     *           $qry->orderBy(...$pair);
     *          }
     *      });
     * })
     */
    public function getOrderBy($model): Collection
    {
        try {
            if (!$model instanceof Model) {
                $model = new $model();
            }

            $sort_by = $this->request->get('sort_by') ?: $this->request->get('sortBy') ?: null;

            $sort_by_arr = is_array($sort_by) ? $sort_by : explode(',', $sort_by);
            //dd($sort_by, $sort_by_arr);
            $data = collect($sort_by_arr)->map(function ($el) use ($model) {
                $pair = explode('-', $el);
                $array = array_values($pair);
                $order_by_key = array_pop($array);
                if (!empty($model::ORDERS_BY_ALLOWED)) {
                    if ($order_by_key && in_array($order_by_key, $model::ORDERS_BY_ALLOWED, true)) {
                        /*dump($order_by_key);*/
                        return Str::startsWith($el, '-') ? [$order_by_key, 'DESC'] : [$order_by_key, 'ASC'];
                    }
                }
                return [];
            });

            return collect($data);
        } catch (Throwable $throwable) {
            Log::error(get_called_class() . '::makeOrderBy: ', $throwable);
            return collect([]);
        }
        //// valid query string should be
        //// 1. http://localhost/api/advances?page=1&per_page=100&sort_by[1]=-amount&sort_by[0]=-created_at
        //// 2. http://localhost/api/advances?page=1&per_page=100&sort_by=-amount,created_at
        //// // Example
        ///
        /* Dynamic Order By -amount=desc, amount=acs */
        /*
         * use Facades\App\Services\QueryStr;
         * $qry->when(count($orderByPairs), function ($qry) use ($orderByPairs) {
            $orderByPairs->each(function ($pair) use ($qry) {
                if ($pair && count($pair)) {
                    // Use the 'splat' to turn the pair into two arguments
                    $qry->orderBy(...$pair);
                }
            });
        })
        */
    }


    /**
     * @param array $filters_allowed
     * @return Collection
     * @example
     * $query->when(count($this->whereConditions()) > 0, function ($qry) use ($whereConditions) {
     *    $whereConditions->each(function ($val, $field) use ($qry) {
     *    $qry->where($field, $val);
     * });
     * })
     */
    public function getWhereConditions(array $filters_allowed = []): Collection
    {
        $req = $this->request->all();
        $data = [];
        foreach (collect($req) as $key => $value) {
            //            if (Str::endsWith($key, '_between')){ } // TODO::
            $table__filed = explode('__', $key); // tableName
            $temp = array_values($table__filed);
            if (in_array(array_pop($temp), $filters_allowed, true)) {
                $condition_key = implode('.', $table__filed); // table field
                $data[$condition_key] = $value;
            }
        }
        return collect($data);
    }

    /**
     * @return int
     */
    public function determinePerPageRows($per_page_default = 10): int
    {
        $this->request->validate([
            'per_page' => 'nullable|sometimes|numeric',
            'perPage' => 'nullable|sometimes|numeric',
            'page' => 'nullable|sometimes|numeric',
        ]);
        return $this->request->get('per_page') ?: $this->request->get('perPage') ?: $per_page_default;
    }

    public function test()
    {
        return get_called_class() . ':: test()';
    }
} /// http://localhost/dev/api/salaries?sort_by[]=-id&sort_by[]=-id&user_id=2&per_page=2&user_id=2
