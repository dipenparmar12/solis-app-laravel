<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreFundRequest extends FormRequest
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

    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'user_id' => 'required|exists:users,id', // TODO::validation status=1
            'amount' => 'required|numeric|min:1|max:1000000',
            'transaction_id' => 'required|exists:transactions,id',

            // TODO::Expense Date should not be too much old (1,2 week max)
            'date' => 'required|date|before:tomorrow|after:2010-01-01',  /*date_format:Y-m-d|*/  // before:tomorrow

            'project_id' => 'nullable|exists:projects,id',
            'desc' => 'nullable|string',
        ];
    }
}
