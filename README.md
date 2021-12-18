## PHP Laravel Backend application

### Start application 

1. open `.env` edit environments variables 
2. `php artisan migrate`
3. `php artisan db:state:update` update production database state
4. `npm run start` or `php -S 127.0.0.1:8000 -t public/` or `php artisan serve`

## Development 
- make api controller `php artisan make:controller AuthApiController --api`
- create db seed `php artisan make:seeder UserSeeder`

### Setup Laravel API
- In `.env` I have set **SESSION_DRIVER=cookie** and **SESSION_DOMAIN=localhost:8000**
- In `config/sanctum` I have added **localhost:8000** to the stateful domains
- In `config/cors` I have set **supports_credentials = true** and allowed all paths, headers and origins (using ‘*’ value)

### Wamp config
1. Wamp -> `Localhost`
2. `Add a Virtual Host`
3. Name of the Virtual Host (No space - No underscore)
4. Complete absolute path of the VirtualHost folder ex. `C:/projects/solis_app/solis_laravel/public`
5. Right click wamp tray -> `Tools` -> `Restart DNS`

### X-debug PhpStorm 
1. Install `Xdebug helper` extension (its available for all browser)
2. Wamp configuration for xdebug `Wamp -> php -> php.ini`
```
;XDEBUG Extension
[xdebug]
zend_extension="c:/wamp64/bin/php/php8.1.0/zend_ext/php_xdebug-3.1.1-8.1-vs16-x86_64.dll"
;xdebug.mode allowed are : off develop coverage debug gcstats profile trace
xdebug.mode = debug
xdebug.output_dir ="c:/wamp64/tmp"
xdebug.show_local_vars=0
xdebug.log="c:/wamp64/logs/xdebug.log"
;xdebug.log_level : 0 Criticals, 1 Connection, 3 Warnings, 5 Communication, 7 Information, 10 Debug	Breakpoint
xdebug.log_level=10
```
3. PhpStorm config
   1. Run and Debug configuration
   2. Add new connection 
   3. PHP Built-in Web Server
   4. Host -> `localhost` 
   5. Port -> `8000`
   6. Document Root -> `C:\projects\solis_app\solis_laravel`
   7. Command Line 
      1. Interpreter Options -> `-c C:\wamp64\bin\apache\apache2.4.51\bin\php.ini -t public/`
      2. Save 
   8. Restart Wamp Server
4. enable `Xdebug-helper` extension, set break point on PhpStorm 

## Temp
- Create Everything `php artisan make:modal Temp -a`

## sources
- https://laravel-news.com/using-sanctum-to-authenticate-a-react-spa
- https://laravelquestions.com/2020/05/01/csrf-cookies-not-set-for-cross-domain-requests-using-laravel-sanctum-and-angular
