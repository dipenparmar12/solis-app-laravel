<?php

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;


// return $this->res(request()->all(), 'Our Message.');

try {
    //
} catch (Throwable $t) {
    $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
    Log::error($error_msg);
    return $this->resError(request()->all(), $t->getMessage());
}

try {
    DB::beginTransaction();
    //
    DB::commit();
} catch (Throwable $t) {
    DB::rollBack();
    $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
    Log::error($error_msg);
    return $this->resError(request()->all(), $t->getMessage());
}


auth()->check() && auth()->user()->hasPermissionTo('estimate-create');



// $data = User::paginate();
// $data->getCollection()->transform(function ($project) {
//     $project->setAppends(['remaining_days']);
//     return $project;
// });
// https://stackoverflow.com/questions/37102841/laravel-change-pagination-data/39342941#39342941
// https://stackoverflow.com/q/66938121/8592918

/* 
========================================================

public function __construct()
{
    $this->middleware('permission:fund-list-self|fund-list-all', ['only' => 'index', 'show']);
    //        $this->middleware('permission:fund-show-self|fund-show-all', ['only' => ['show']]);
    $this->middleware('permission:fund-create', ['only' => ['create', 'store']]);
    $this->middleware('permission:fund-edit', ['only' => ['edit', 'update']]);
    $this->middleware('permission:fund-delete-self', ['only' => ['destroy']]); //// |fund-delete-all // TODO Delete all
    $this->middleware('permission:fund-approval', ['only' => ['approval']]);
}

======================================================== 
*/