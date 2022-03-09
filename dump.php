<?php
$modal = new Modal();

/*
-------------------
----- Laravel media
-------------------
*/

#______ Delete media
$modal->clearMediaCollection('estimates'); // default, estimates collection

#______ Upload media from request
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

#______ Test
#______ Test
#______ Test
#______ Test
#______ Test
#______ Test




class Modal {
    public function clearMediaCollection(string $string){}
    public function addAllMediaFromRequest(mixed $files): static {return $this;}
    public function each(Closure $param) { }
}