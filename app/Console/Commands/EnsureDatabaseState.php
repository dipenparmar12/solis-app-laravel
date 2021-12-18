<?php

namespace App\Console\Commands;

use App\DatabaseState\DatabaseState;
use Database\State\PermissionsDatabaseState;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Permission;

class EnsureDatabaseState extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:state:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update database static data (Permissions, etc) in production env';


    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(): int
    {
        $permissions_seed = (DatabaseState::permissions());
        foreach ($permissions_seed as $display_name => $permission) {
            $permission_exist = Permission::select(['name', 'display_name'])
                ->where(['name' => $permission])
                ->first();

            if (!$permission_exist) {
                Permission::Create([
                    'name' => $permission,
                    'display_name' => $display_name
                ]);
            }
        }
        Log::info('New Permissions updated in Database...');
        dump("New Permissions updated in Database...");

        return 1;
    }
}
