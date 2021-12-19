<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Scopes\IsActiveScope;
use Illuminate\Http\Request;

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

    public function index()
    {
        return User::withoutGlobalScope(IsActiveScope::class)->paginate(30)->appends(request()->all());
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
}
