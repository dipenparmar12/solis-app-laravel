<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class FileAccessController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum', ['only' => ['download']]);
    }

    public function download()
    {
        $id = request('id');
        $media_file = Media::where('id', $id)
            ->when(!auth()->user()->hasAnyPermission(['estimate-list-all']), function ($query) {
                $query->where('custom_properties->uploaded_by', auth()->id());
            })
            ->firstOrFail();

        return $media_file;
    }


    /**
     * @return never|\Symfony\Component\HttpFoundation\BinaryFileResponse
     * @desc not using it
     */
    public function working_test()
    {
        $file = request('path');
        if(auth()) {
            $path = storage_path("app/uploads/$file");
            $path = str_replace('//', '/', $path);
            if (file_exists($path)) {
                return response()->file($path);
            }
        }
        return abort(403, request('path'));
    }

}
