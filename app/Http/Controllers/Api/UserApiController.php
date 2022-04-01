<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Advance;
use App\Models\Expense;
use App\Models\Fund;
use App\Models\User;
use App\Scopes\IsActiveScope;
use Facades\App\Services\QueryStrService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Dexpenses;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
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
//            ->with(['advances', 'salaries'])
            ->withSum(['funds', 'expenses',], 'amount')
            ->withSum([
                'expenses as expenses_pending_approval' => function ($query) {
                    return $query->whereNull('is_approved');
                }
            ], 'amount')
            /* Dynamic Order By -amount=desc, amount=acs */
            ->when(count($orderByPairs = QueryStrService::getOrderBy(User::class)) ?? 0, function ($qry) use ($orderByPairs) {
                $orderByPairs->each(function ($pair) use ($qry) {
                    if ($pair && count($pair)) {
                        // Use the 'splat' to turn the pair into two arguments
                        $qry->orderBy(...$pair);
                    }
                });
            })
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all());

        return $this->res($users);
    }


    /**
     * Get details of the specified resource.
     * @param $id // can be used direct implicit modal binding `User $user`
     * @return JsonResponse
     */
    public function show(User $user): JsonResponse
    {
        $user->load(['advances', 'salaries']);
        return $this->res($user);

        //        if (auth()->id() == $id or optional(auth()->user())->hasRole(['team', 'admin'])) {
        //            $data['model_data'] = User::withoutGlobalScope(IsActiveScope::class)->with('expenses', 'incomes')->findOrFail($id);
        //            return view('team.users.show')->with($data);
        //        }
        //        return redirect()->route('team.users.show', auth()->id());
    }

    /**
     * Create new user.
     * @throws ValidationException
     */
    public function store(): JsonResponse
    {
//        Log::info(request(['dob','doj']));
        $this->validate(request(), [
            'name' => "required|min:2|max:100",
            'email' => "email|required|unique:users,email",
            'password' => "nullable", "min:3", // TODO:dev, https://laravel.com/docs/9.x/upgrade#the-password-rule
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
     * @throws ValidationException
     */
    public function update(Request $request, User $user): JsonResponse
    {
        $this->validate(request(), [
            'name' => 'required|min:2|max:100',
            'email' => "email|required|unique:users,email,$user->id",
            'password' => 'nullable', 'min:3', // TODO:dev, https://laravel.com/docs/9.x/upgrade#the-password-rule
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


    /**
     * @param Request $request
     * @param User $user
     * @return JsonResponse
     * @throws ValidationException
     */
    public function advances(Request $request, User $user): JsonResponse
    {
        $advances = Advance::select(['user_id', 'id', 'amount', 'date', 'paid_amount'])
            ->where('user_id', $user->id)
            ->where('settled', 0) // 0 -> Pending amount (outstanding)
            ->orderByDesc('date')

            ->get();

        return $this->res($advances, 'Advance summary');
    }


    /**
     * @param Request $request
     * @param User $user
     * @return JsonResponse
     * @throws ValidationException
     */
    public function expenses(Request $request, User $user): JsonResponse
    {
        $advances = Expense::select([
            'id', 'expense_by', 'amount', 'date',
            'particular', 'category',
            'project_id', 'dealer_id', 'transaction_id',
        ])
            ->where('expense_by', $user->id)
             ->with([
                 'project', 'dealer', 'transaction',
             ])
            ->orderByDesc('date')
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all());

        return $this->res($advances, 'User Expenses.');
    }

    /**
     * @param Request $request
     * @param User $user
     * @return JsonResponse
     * @throws ValidationException
     */
    public function funds(Request $request, User $user): JsonResponse
    {
        $advances = Fund::select([
           'id', 'user_id', 'transaction_id', 'project_id',
            'amount', 'date',
//            'status',
        ])
            ->where('user_id', $user->id)
             ->with([
                 'transaction',
             ])
            ->orderByDesc('date')
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all());

        return $this->res($advances, 'User PettyCash.');
    }

    public function fund_summary(): JsonResponse
    {
        $data = User::select([
            'users.id',
            'users.name',
        ])
//            ->with([
//                'funds','expenses',
//            ])
            ->withSum(['funds', 'expenses',], 'amount')
            ->withSum([
                'expenses as expenses_pending_approval' => function ($query) {
                    return $query->whereNull('is_approved');
                }
            ], 'amount')
            ->get();

        return $this->res($data);
    }

}



/*

        $funds = Fund::select([
            'user_id',
            'amount',
            'date',
            'transaction_id', 'project_id',
            'status',
        ])
            ->when(!auth()->user()->hasAnyPermission(['fund-list-all']), function ($qry) {
                return $qry->where('user_id', auth()->id());
            })
            ->where('funds.user_id', $user->id)
//            ->with([
//                'received_from', 'transaction'
//            ])
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all());

        $expenses = Expense::select([
            'expense_by as user_id',
            'amount',
            'date',
            'project_id', 'dealer_id', 'transaction_id',
            'is_approved', 'particular',
            'desc', 'category',
            'status',
        ])
            ->when(!auth()->user()->hasAnyPermission(['expense-list-all']), function ($qry) {
                return $qry->where('expense_by', auth()->id());
            })
            ->where('expenses.expense_by', $user->id)
//            ->with([
//                'project', 'transaction', 'dealer'
//            ])
            ->paginate(QueryStrService::determinePerPageRows())
            ->appends(request()->all())
            ;

            $data = collect()
                ->merge($funds)
                ->merge($expenses)
                ;
        return $this->res($data);
 */
