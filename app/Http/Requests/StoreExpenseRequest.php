<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreExpenseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        /**
         * By default it returns false, change it to
         * something like this if u are checking authentication
         */
        return auth()->check(); // <------------------

        /**
         * You could also use something more granular, like
         * a policy rule or an admin validation like this:
         * return auth()->user()->isAdmin();
         *
         * Or just return true if you handle the authorization
         * anywhere else:
         * return true;
         */
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'dealer_id' => 'nullable|required_if:category,project|exists:dealers,id',
            'project_id' => 'nullable|required_if:category,project|exists:projects,id', /// if Category is project then,
            'transaction_id' => 'required|exists:transactions,id',

            'amount' => 'required|numeric|min:1|max:1000000',
             // TODO::Expense Date should not be too much old (1,2 week max)
            'date' => 'required|date|after:2010-01-01',  /*date_format:Y-m-d|*/  // before:tomorrow
            'particular' => 'required|string',
            'category' => 'required|string|in:project,office,personal,other',
            'is_approved' => 'nullable|boolean',
            'desc' => 'nullable|string|required_if:category,other,personal,office',
//            'date' => 'required|date|before:tomorrow|after:2010-01-01',

        ];
    }
}
