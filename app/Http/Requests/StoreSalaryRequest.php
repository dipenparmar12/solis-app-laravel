<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreSalaryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->user()->hasPermissionTo('salary-create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'user_id' => 'required|exists:users,id',
            'salary_amount' => 'required|numeric|min:10|max:1000000',
            'month_year' => 'required|date|before:tomorrow', /*date_format:Y-m-d|*/
            'deduction' => [
                'nullable', 'sometimes', 'numeric', 'min:100', 'max:1000000',
                // new DeductionAmountRule(request('user_id')), // TODO::make validations
            ],
        ];
    }
}
