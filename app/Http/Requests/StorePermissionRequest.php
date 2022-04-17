<?php

namespace App\Http\Requests;

use App\Helper;
use Illuminate\Foundation\Http\FormRequest;

class StorePermissionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return Helper::AuthHasPermission('permission-create');
        // return auth()->user()->hasPermissionTo('permission-create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|unique:permissions,name',
            'display_name' => 'required|string',
            'guard_name' => 'nullable|in:web,sanctum,api',
        ];
    }
}
