<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Throwable;

class TransactionApiController extends Controller
{
    /**
     * Display a listing of the transactions.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        $data = Transaction::select([
            'transactions.id',
            'transactions.id as value',
            'transactions.type as type',
            'transactions.desc as desc',
            'transactions.status as status',
        ])
            ->latest()
            ->get();
        return $this->res($data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return JsonResponse
     * @throws ValidationException
     */
    public function store(Request $request): JsonResponse
    {
        $this->validate(request(), [
            'type' => 'required|string|unique:transactions,type',
            'desc' => 'nullable|string|max:100',
            'status' => 'nullable|boolean|in:0,1,true,false',
        ]);

        try {
            $transaction = Transaction::create(request()->only([
                'type', 'desc', 'status',
            ]));
            return $this->res($transaction, 'Transaction created.');
        } catch (Throwable $th) {
            //throw $th;
            optional($transaction)->delete();
            return $this->resError($th->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Transaction $transaction
     * @return JsonResponse
     * @throws ValidationException
     */
    public function update(Request $request, Transaction $transaction): JsonResponse
    {
        $this->validate(request(), [
            'type' => "nullable|string|unique:transactions,type,$transaction->id",
            'desc' => 'nullable|string|max:100',
            'status' => 'nullable|boolean|in:0,1,true,false',
        ]);

        try {
            $update_payload = request()->only([
                'type', 'desc', 'status',
            ]);

            if ($transaction->update($update_payload)) {
                return $this->res($transaction, "Transaction updated. $transaction->type");
            }

            return $this->resError($transaction, 'Please try again');

        } catch (Throwable $th) {
            return $this->resError($th->getMessage());
        }
    }


//    /**
//     * Display the specified resource.
//     *
//     * @param  \App\Models\Transaction  $transaction
//     * @return \Illuminate\Http\Response
//     */
//    public function show(Transaction $transaction)
//    {
//        //
//    }
//

//    /**
//     * Remove the specified resource from storage.
//     *
//     * @param  \App\Models\Transaction  $transaction
//     * @return \Illuminate\Http\Response
//     */
//    public function destroy(Transaction $transaction)
//    {
//        //
//    }
}
