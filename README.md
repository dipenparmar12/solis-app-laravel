## PHP Laravel Backend application

### Start application 

1. open `.env` edit environments variables 
2. `php artisan migrate`
3. `php artisan db:state:update` update production database state
4. `npm run start` or `php -S 127.0.0.1:8000 -t public/` or `php artisan serve`

## Development 
- make api controller `php artisan make:controller AuthApiController --api`
- create db seed `php artisan make:seeder UserSeeder`

### Wamp config
1. Wamp -> `Localhost`
2. `Add a Virtual Host`
3. Name of the Virtual Host (No space - No underscore)
4. Complete absolute path of the VirtualHost folder ex. `C:/projects/solis_app/solis_laravel/public`
5. Right click wamp tray -> `Tools` -> `Restart DNS`

### Setup Laravel API
- In `.env` I have set **SESSION_DRIVER=cookie** and **SESSION_DOMAIN=localhost:8000**
- In `config/sanctum` I have added **localhost:8000** to the stateful domains
- In `config/cors` I have set **supports_credentials = true** and allowed all paths, headers and origins (using ‘*’ value)


## Temp
- Create Everything `php artisan make:modal Temp -a`

## sources
- https://laravel-news.com/using-sanctum-to-authenticate-a-react-spa
- https://laravelquestions.com/2020/05/01/csrf-cookies-not-set-for-cross-domain-requests-using-laravel-sanctum-and-angular
