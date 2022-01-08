<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Scopes\IsActiveScope;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
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

    public function index(): JsonResponse
    {
        $users = User::withoutGlobalScope(IsActiveScope::class)
            ->latest()
//            ->getMedia(User::PIC_MEDIA_COLLECTION)
            ->paginate(request('per_page') ?? 20)
            ->appends(request()->all());

        return $this->res($users);
    }


    /**
     * Get details of the specified resource.
     * @param $id // can be used direct implicit modal binding `User $user`
     * @return JsonResponse
     */
    public function show($id): JsonResponse
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
    public function store(): JsonResponse
    {
//        Log::info(request(['dob','doj']));
        $this->validate(request(), [
            'name' => "required|min:2|max:100",
            'email' => "email|required|unique:users,email",
            'password' => "nullable", "min:3", // TODO:dev
            'profile_pic' => "image|mimes:jpg,jpeg,png,svg,gif|max:1024",
            'role_id' => "nullable|exists:roles,id",
            'mobile' => "required|numeric|digits_between:10,20",
            'salary' => "required|numeric|min:0",
            'education' => "nullable|string",
            'dob' => 'date|before:tomorrow|nullable|date_format:Y-m-d',
            'doj' => 'date|before:tomorrow|nullable',
            "active" => "nullable|in:0,1",
            'address' => 'nullable|min:5|max:1000',
        ]);

        $user = null;
        try {
            $user = User::create(request([
                "name", "email", "password", "role_id",
                "mobile", "salary", "education", "dob", "doj", "active", "is_abstract",
                'address', // "profile_pic",
            ]));

            if (request()->hasFile('profile_pic')) {
                $user->addMedia(request()->file('profile_pic'))->toMediaCollection(User::PIC_MEDIA_COLLECTION);
            }

            $user->password = Hash::make(request('password'));
            $user->save();

            return $this->res(request()->all(), "User created successfully");
        } catch (\Throwable $th) {
            //throw $th;
            optional($user)->delete();
            return $this->resError($th->getMessage());
        }
    }


    /**
     * Update the specified resource
     *
     * @param Request $request
     * @param User $user
     * @return JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update(Request $request, User $user): JsonResponse
    {
        $this->validate(request(), [
            'name' => 'required|min:2|max:100',
            'email' => "email|required|unique:users,email,$user->id",
            'password' => 'nullable', 'min:3', // TODO:dev
            'profile_pic' => 'image|mimes:jpg,jpeg,png,svg,gif|max:1024',
            'role_id' => 'nullable|exists:roles,id',
            'mobile' => 'required|numeric|digits_between:10,20',
            'salary' => 'required|numeric|min:0',
            'education' => 'nullable|string',
            'dob' => 'date|before:tomorrow|nullable|date_format:Y-m-d',
            'doj' => 'date|before:tomorrow|nullable',
            'active' => 'nullable|in:0,1',
            'address' => 'nullable|min:5|max:1000',
        ]);

        try {
            $update_payload = request([
                'name', 'email', 'role_id',// role_id
                'mobile', 'salary', 'education', 'dob', 'doj', 'active', 'is_abstract',
                "address", // "profile_pic",
            ]);


            if ($user->update($update_payload)) {

                if ($password = request()->get('password')) {
                    $user->password = Hash::make($password);
                    $user->save();
                }

                return $this->res($user, 'User updated successfully');
            }

            return $this->resError($user, 'Something want to wrong, Please try again');

        } catch (\Throwable $th) {
            return $this->resError($th->getMessage());
        }

    }


    /**
     * Remove the specified resource from storage.
     *
     * @param User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user): JsonResponse
    {
        try {
            $user->delete();
            return $this->res($user, 'User deleted successfully');
        } catch (\Throwable $th) {
            return $this->resError($th->getMessage());
        }
    }

}
