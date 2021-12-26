<?php

namespace App\Traits;

use Illuminate\Support\Facades\Response;

trait JsonResponseTrait
{
    public function res($data, $message = 'Success', $subStatus = 200)
    {
        $resData = [
            'success' => true,
            'successMessage' => $message,
            'statusCode' => $subStatus ?? 400,
            'path' => '/' . request()->path(),
            'results' => $data ?? [],
            'metadata' => [
                'auth_id' => auth()->id(),
                'url' => request()->url()
            ],
        ];
        return Response::json($resData);
    }
}
