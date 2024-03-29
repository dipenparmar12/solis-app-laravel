<?php

namespace App\Http\Requests;

use App\Helper;
use Illuminate\Foundation\Http\FormRequest;

class StoreEstimateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Helper::AuthHasPermission('estimate-create');
        // return auth()->check() && auth()->user()->hasPermissionTo('estimate-create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'project_id' => 'required|exists:projects,id',
            's_date' => 'required|date|after:2010-01-01',  /*date_format:Y-m-d|*/
            'e_date' => 'required|date|after_or_equal:s_date', // before:tomorrow

            // TODO::validation required_array_keys:foo,bar,...
            'estimates.*.dealer_id' => 'required|exists:dealers,id',
            'estimates.*.amount' => 'required|numeric|min:50|max:1000000',

            'desc' => 'nullable|string',
        ];
    }
}
