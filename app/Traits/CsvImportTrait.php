<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Response;

/**
 * @src https://stackoverflow.com/a/35223390/8592918
 * @example
 *
   use CsvImportTrait;
   $this->importCsv(New User(), database_path('csv\users.csv') );
 */
trait CsvImportTrait
{
    /**
     * @param $filename
     * @param $delimiter
     * @return bool|array
     */
    public function csvToArray($filename = '', $delimiter = ','): bool|array
    {
        if (!file_exists($filename) || !is_readable($filename))
            dump("File not exists $filename");
            return false;

        $header = null;
        $data = [];
        if (($handle = fopen($filename, 'r')) !== false) {
            while (($row = fgetcsv($handle, 1000, $delimiter)) !== false) {
                if (!$header)
                    $header = $row;
                else
                    // NULL -> ''
                    $row = array_map(function ($v) {
                        return (is_null($v) || $v === 'NULL' || $v === '') ? null : $v;
                    }, $row);

                    $data[] = array_combine($header, $row);
            }
            fclose($handle);
        }

        return $data;
    }

    /**
     * @param $csvFilePath
     * @return string
     * @param Model $modal
     */
    public function importCsv(Model $modal, $csvFilePath): string
    {
        $customerArr = $this->csvToArray($csvFilePath);
        for ($i = 1; $i < count($customerArr); $i ++)
        {
            $modal::firstOrCreate($customerArr[$i]);
        }
        return 'Jobi done or what ever';

//        $data = [];
//        for ($i = 0; $i < count($customerArr); $i ++)
//        {
//            $data[] = [
//                    'column_name1' => 'value',
//                    'column_name2' => 'value2',
//                ];
//               //User::firstOrCreate($customerArr[$i]);
//       }
//        DB::table('table_name')->insert($data);
    }

}
