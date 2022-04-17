<?php

namespace App\Console\Commands;

use App\Helper;
use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Permission;
use Throwable;

/**
 * Class AssignAllPermission
 * @package App\Console\Commands
 * @example 
 * php artisan permission:assign <USER_ID>
 */
class AssignAllPermission extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'permission:assign {user_id}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Assign all available permissions to specified user';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try {
            Helper::flushPermissionCache();

            $user_id = $this->argument('user_id');
            $user = User::find($user_id);
            $permissions = Permission::pluck('name')->toArray();
            $user->syncPermissions($permissions);
            Log::info("ALL Permissions assigned to {$user->name} (id: {$user->id})");
            dump("ALL Permissions assigned to {$user->name} (id: {$user->id})");

            return 1;
        } catch (Throwable $th) {
            (config('app.env') === 'local') ? dd($th) : null;

            Log::error(/*"ERROR EmailSendJob:::",*/[
                "ERROR_NAME:" => "Internal server error " . get_class($this) . "::::",
                "LINE:" => $th->getLine(),
                "MESSAGE:" => $th->getMessage(),
                "CODE:" => $th->getCode()
            ]);
            return 0;
        }
    }
}
