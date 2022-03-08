<?php

namespace App\Http\Controllers\Temp;

use App\Http\Controllers\Controller;
use App\Http\Middleware\MediaHeadersMiddleware;
use App\Models\Advance;
use App\Models\Dealer;
use App\Models\Estimate;
use App\Models\Expense;
use App\Models\User;
use App\Traits\CsvImportTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Permission;
use Throwable;

class TestController extends Controller
{
    use CsvImportTrait;

    /**
     * @return bool
     */
    public function phpinfo(): bool
    {
        $test = 1;
        return phpinfo();
    }

    public function logout(): \Illuminate\Http\JsonResponse
    {
        try {
            $user = User::find(Auth::user()->id);
            Auth::logout();
            return $this->res(['success' => 'Logout success', 'user' => $user]);
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError($error_msg, $t->getMessage());
        }
    }

    public function get(): \Illuminate\Http\JsonResponse
    {
        try {
            $data = Permission::get();
            return $this->res($data);
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError($error_msg, $t->getMessage());
        }
    }

    public function paginateGet(): \Illuminate\Http\JsonResponse
    {
        $data = User::paginate(request('per_page') ?? 3)
            ->appends(request()->all());
        return $this->res($data);
    }

    public function userGet($id): \Illuminate\Http\JsonResponse
    {
        try {
            $data = User::findOrFail($id);
            return $this->res([$data,'Get modal image']);
        } catch (Throwable $t) {
            $error_msg = ['Line:' => $t->getLine(), 'Message:' => $t->getMessage(), 'Code:' => $t->getCode()];
            Log::error($error_msg);
            return $this->resError($error_msg, $t->getMessage());
        }
    }

    public function advance_emi_info($user_id)
    {
        return Advance::where('user_id', $user_id)->get();
    }

    public function user_seed()
    {
        return User::whereId(1)->first();
//        $user = User::whereId(1)->first();
//        $user->has(Salary::factory()->count(1));
//        return $user;
    }

    public function expense_seed()
    {
        Expense::truncate();
        $this->importCsv(new Expense(), database_path('csv\expenses.csv'));
    }

    public function csvImport()
    {
        $this->importCsv(new Dealer(), database_path('csv\dealers.csv'));
    }

    /**
     * @param Request $request
     * @return void
     * @see https://spatie.be/docs/laravel-medialibrary/v10/api/adding-files#content-addallmediafromrequest
     */
    public function fileUpload(Request $request)
    {
        $estimate = Estimate::find(request('id'));
        if (request()->hasFile('files')) {
//            $estimate->clearMediaCollection('estimates'); // default, estimates collection
            $files = reset(request()->files);
            $estimate
                ->addAllMediaFromRequest($files)
                ->each(function ($fileAdder) {
                    $fileAdder
                        ->withCustomProperties([
                            'uploaded_by' => auth()->id(),
                        ])
                        ->toMediaCollection('estimates', 'private');
                });
        }
        $media = $estimate->getMedia('estimates');
        return $media;
    }

    public function getMedia()
    {
        $id = (request('id'));
        $media = Estimate::findOrFail($id);
        return $media->getMedia('estimates');
    }

    public function downloadFile()
    {
        $file = request('path') ?: 'test.png';
        $path = storage_path("app/uploads/$file");
        $path = str_replace('//', '/', $path);
//      $path = 'C:/projects/solis_app/solis_laravel/storage/app\uploads\test.png';
//      dd($path);
        if (file_exists($path)) {
            return response()->file($path);
        }
        return abort(404, request('path'));
    }
}

