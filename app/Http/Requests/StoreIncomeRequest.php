<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreIncomeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // return true;
        return auth()->user()->hasPermissionTo('income-create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        // return [];
        return [
            'received_by' => 'nullable|exists:users,id',
            'project_id' => 'required|exists:projects,id',
            'transaction_id' => 'required|exists:transactions,id',

            'from' => 'required|string|min:2|max:300',
            'particular' => 'required|string|min:2|max:300',
            'desc' => 'required|string',
            'amount' => 'required|numeric|min:10|max:1000000',
            'date' => 'required|date|before:tomorrow', /*date_format:Y-m-d|*/
        ];
    }
}
