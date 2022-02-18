<?php

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

