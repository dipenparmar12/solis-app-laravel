<?php

use Illuminate\Support\Facades\Log;

$modal = new Modal();

/*
-------------------
----- Laravel media
-------------------
*/
# Delete media
$modal->clearMediaCollection('estimates'); // default, estimates collection

# Upload media from request
if (request()->hasFile('files')) {
    $files = reset(request()->files);
    $modal
        ->addAllMediaFromRequest($files)
        ->each(function ($fileAdder) {
            $fileAdder
                ->withCustomProperties([
                    'uploaded_by' => auth()->id() ?: null,
                    'primaryColor' => 'red'
                ])
                ->toMediaCollection('estimates');
        });
}

/**
 *
 */
#______ Eloquent transform

$modal->transform(function ($item, $i) {
    return $item;
});

$modal->getCollection()->transform(function ($item) {
    $item->subRows = $item->emi_info;
    return $item;
});


/**
 * Laravel permissions & role
 */
auth()->user()->hasPermissionTo('permission_name');

#______ Test
#______ Test
#______ Test
#______ Test




class Modal {
    public function clearMediaCollection(string $string){}
    public function addAllMediaFromRequest(mixed $files): static {return $this;}
    public function each(Closure $param) { }
    public function getCollection() {}
    public function transform(Closure $param): static {return $this;}

}



try {

} catch (Throwable $th) {
    //throw $th;
    $log_msg = ['Line:' => $th->getLine(), 'Message:' => $th->getMessage(), 'Code:' => $th->getCode()];
    Log::error($log_msg);
    return $this->resError($th->getMessage());
}
