<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Scopes\IsActiveScope;
use Illuminate\Support\Facades\Log;
use function request;

class UserApiController extends Controller
{
    public function __construct()
    {
        //        $this->middleware(['role:team|admin'])->except('show');
        $this->middleware('permission:user-list-all', ['only' => ['index']]);
        //        $this->middleware('permission:user-show', ['only' => ['show']]);
        $this->middleware('permission:user-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:user-edit-all|user-edit-self', ['only' => ['edit', 'update']]);
        $this->middleware('role:team|admin', ['only' => ['fund_expense_diff']]);
    }

    public function index(): \Illuminate\Http\JsonResponse
    {
        $users = User::withoutGlobalScope(IsActiveScope::class)
            ->latest()
//            ->getMedia(User::PIC_MEDIA_COLLECTION)
            ->paginate(request('per_page') ?? 20)
            ->appends(request()->all());

        return $this->res($users);
    }


    public function show($id)
    {
        $user = User::withoutGlobalScope(IsActiveScope::class)->findOrFail($id);
        return $user;

        //        if (auth()->id() == $id or optional(auth()->user())->hasRole(['team', 'admin'])) {
        //            $data['model_data'] = User::withoutGlobalScope(IsActiveScope::class)->with('expenses', 'incomes')->findOrFail($id);
        //            return view('team.users.show')->with($data);
        //        }
        //        return redirect()->route('team.users.show', auth()->id());
    }

    /**
     * Create new user.
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(): \Illuminate\Http\JsonResponse
    {
//        Log::info(request(['dob','doj']));
        $this->validate(request(), [
            'name' => "required|min:2|max:100",
            'email' => "email|required|unique:users,email",
            'password' => "nullable",  "min:3", // TODO:dev 
            'profile_pic' => "image|mimes:jpg,jpeg,png,svg,gif|max:1024",
            'role_id' => "nullable|exists:roles,id",
            'mobile' => "required|numeric|digits_between:10,20",
            'salary' => "required|numeric|min:0",
            'education' => "nullable|string",
            'dob' => 'date|before:tomorrow|nullable|date_format:Y-m-d',
            'doj' => 'date|before:tomorrow|nullable',
            "active" => "nullable|in:0,1",
        ]);

        try {
            $user = User::create(request([
                "name", "email", "password", "role_id",// role_id
                "mobile", "salary", "education", "dob", "doj", "active", "is_abstract",
                // "profile_pic",
            ]));

            if (request()->hasFile('profile_pic')) {
                $user->addMedia(request()->file('profile_pic'))->toMediaCollection(User::PIC_MEDIA_COLLECTION);
            }

            return $this->res(request()->all(), "User created successfully");
        } catch (\Throwable $th) {
            $user->delete();
            //throw $th;
            return $this->resError($th->getMessage());
        }
    }
}
