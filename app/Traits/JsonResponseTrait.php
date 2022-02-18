<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Response;

trait JsonResponseTrait
{
    public function res($data, $message = 'Success'): JsonResponse
    {
        $resData = [
            'success' => true,
            'statusCode' => 200,
            'message' => $message,
            'path' => '/' . request()->path(),
            'results' => $data ?? [],
            'metadata' => [
                'auth_id' => auth()->id(),
                'url' => request()->url()
            ],
        ];
        return Response::json($resData);
    }


    public function resError($data, $message = 'Something went wrong'): JsonResponse
    {
        $resData = [
            'success' => false,
            'statusCode' => 400,
            'message' => $message,
            'path' => '/' . request()->path(),
            'results' => [],
            'data' => $data ?? [],
            'metadata' => [
                'auth_id' => auth()->id(),
                'url' => request()->url()
            ],
        ];
        return Response::json($resData, 400);
    }
}
