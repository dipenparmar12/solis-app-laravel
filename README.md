## PHP Laravel Backend application

### Start application 

1. `php artisan migrate`
2. `npm run start` or `php -S 127.0.0.1:8000 -t public/` or `php artisan serve`

## Development 
- make api controller `php artisan make:controller AuthApiController --api`
- create db seed `php artisan make:seeder UserSeeder`

### Setup Laravel API
- In `.env` I have set **SESSION_DRIVER=cookie** and **SESSION_DOMAIN=localhost:8000**
- In `config/sanctum` I have added **localhost:8000** to the stateful domains
- In `config/cors` I have set **supports_credentials = true** and allowed all paths, headers and origins (using ‘*’ value)


## Temp
- Create Everything `php artisan make:modal Temp -a`

## sources
- https://laravel-news.com/using-sanctum-to-authenticate-a-react-spa
- https://laravelquestions.com/2020/05/01/csrf-cookies-not-set-for-cross-domain-requests-using-laravel-sanctum-and-angular
