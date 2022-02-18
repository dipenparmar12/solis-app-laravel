<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class FileAccessController extends Controller
{
    public function download($file)
    {
        return $file;
        // We should do our authentication/authorization checks here
        // We assume you have a FileModel with a defined belongs to User relationship.
        if(Auth::user() && Auth::id() === $file->user->id) {
            // filename should be a relative path inside storage/app to your file like 'userfiles/report1253.pdf'
            return Storage::download($file->filename);
        }else{
            return abort('403');
        }
    }
}
