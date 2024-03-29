



## PHP Laravel Backend application

## Start application

1. open `.env` edit environments variables
2. `php artisan migrate`
3. `php artisan db:state:update` update production database state
4. `npm run start` or `php -S 127.0.0.1:8000 -t public/`\*\*\*\* or `php artisan serve`

## Production Heroku

-   Git **CLONE** or **LINK** repo
    -   Clone remove account `heroku git:clone -a herkou-app-name`
    -   Link local git account: `heroku git:remote -a herkou-app-name`
-   Push Updates: `git push heroku main:main` localBranch:herokuBranch
-   Heroku remove log: `heroku logs --tail --app heroku-app-name`
-   set config variables & generate key (using **.env.stating** example) :
    -   `php artisan key:generate`
    -   `heroku config:set DB_DATABASE=dbName APP_KEY=appKey --app heroku-app-name`
-   Heroku remote bash/terminal: `heroku run bash`

## Production to Hostinger

-   Make sure **php8.0** version default is set
    in [php configuration](https://hpanel.hostinger.com/hosting/solis-interiors.tk/advanced/php-configuration)

-   Installation via SSH

    -   `ssh -p 65002 u454350797@156.67.222.43` & entry password your `***`
    -   `cd domains/solis-interiors.tk/public_html/` & upload project source code
    -   `/opt/alt/php80/usr/bin/php composer.phar install` (here upload composer.phar file to current
        directory if not exits)
    -   Set `.env` variables.
    -   Setup is done

-   Installation free SSL certificate & configure DNS (zerossl.com or sslforfree.com or shieldsigned.com)
    zone [Doc step by ste guid](https://support.hostinger.com/en/articles/3220627-how-to-install-free-ssl-from-sslforfree-com)
    -   To Generate Free Goto ZeroSsl [Website](https://manage.sslforfree.com/dashboard)
    -   Goto New certification [link](https://manage.sslforfree.com/certificate/new) & follow the
        steps
-   install free SSL from sslforfree.com
    -   open your hPanel, **Hosting → Manage → DNS Zone Editor**, and insert **sectigo** in the search
        field. The record we are looking for is a CAA record with values:
    -   | Name | Flag | Tag   | CA domain   | TTL   |
        | ---- | ---- | ----- | ----------- | ----- |
        | @    | 0    | issue | sectigo.com | 14400 |
    -   If you don’t see such a record - create it:
    -   Wait a few minutes and go back to the certificate validation page. Click on Verify.
-   Install SSL in Hostinger panel [SSL installation](https://hpanel.hostinger.com/hosting/solis-interiors.tk/advanced/ssl),
    -   You will see 3 files there:
        -   private.key
        -   certificate.crt
        -   ca_bundle.crt
    -   Open Hosting → Manage → SSL:
    -   And install the SSL manually one by one (copy and paste)
        -You can verify caa records here [Google site](https://toolbox.googleapps.com/apps/dig/#CAA/)
        or [Other tool](https://caatest.co.uk/solis-interiors.tk)
-   SSL for solis-interiors.tk has been generated by [Website](https://app.zerossl.com/certificates)
    using `d..ji@gmail.com` account.

## Development

-   make api controller `php artisan make:controller AuthApiController --api`
-   create db seed `php artisan make:seeder UserSeeder`

### Wamp config

1. Wamp -> `Localhost`
2. `Add a Virtual Host`
3. Name of the Virtual Host (No space - No underscore)
4. Complete absolute path of the VirtualHost folder ex. `C:/projects/solis_app/solis_laravel/public`
5. Right click wamp tray -> `Tools` -> `Restart DNS`

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
;xdebug.start_with_request = yes ; if you want to start with request 
```

3. PhpStorm config
    1. Run and Debug configuration
    2. Add new connection
    3. PHP Built-in Web Server
    4. Host -> `localhost`
    5. Port -> `8000`
    6. Document Root -> `C:\projects\solis_app\solis_laravel`
    7. Command
       Line [Php CLI document](https://www.php.net/manual/en/features.commandline.options.php)
        1. Interpreter Options -> `-c C:\wamp64\bin\apache\apache2.4.51\bin\php.ini -t public/`
        2. Save
    8. Restart Wamp Server
4. enable `Xdebug-helper` extension, set break point on PhpStorm

## Temp

### Setup Laravel API

-   In `.env` I have set **SESSION_DRIVER=cookie** and **SESSION_DOMAIN=localhost:8000**
-   In `config/sanctum` I have added **localhost:8000** to the stateful domains
-   In `config/cors` I have set **supports_credentials = true** and allowed all paths, headers and
    origins (using ‘\*’ value)

#### Docs

-   Create Everything `php artisan make:modal Temp -a`


## Official docs
- Laravel-Permissions https://spatie.be/docs/laravel-permission/v5/introduction

## sources

- markdown.md [cheat-sheet](https://www.markdownguide.org/cheat-sheet/)
- https://laravel-news.com/using-sanctum-to-authenticate-a-react-spa
- https://laravelquestions.com/2020/05/01/csrf-cookies-not-set-for-cross-domain-requests-using-laravel-sanctum-and-angular
- Heroku Accounts https://github.com/heroku/heroku-accounts
- pagination not working in method chain: https://stackoverflow.com/questions/66938121/laravel-7-0-pagination-not-working-in-method-chain
- File access: https://dev.to/fractalbit/tips-for-working-with-private-files-in-laravel-1g08
- JSON to Query string convert online: https://www.convertonline.io/convert/json-to-query-string#
