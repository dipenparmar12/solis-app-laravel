# Put in below to access globly
# /usr/local/bin
# OR create symbolink
#1st time for creating symbolic file
#bash_name=`basename $0`
#file_path=$PWD/$bash_name
## sudo ln -s  $file_path /usr/local/bin/$bash_name

if [ $1 ] 
then
    php artisan clear-compiled && composer dumpauto 
else
   echo "without composer dumpauto"
fi


php artisan optimize:clear
php artisan config:clear 
php artisan cache:clear
php artisan view:clear
php artisan route:clear
# php artisan serve



echo "Task completed... everything is clean now"

#php -d memory_limit=4096M C:\Users\Dell\AppData\Local\ComposerSetup\bin\composer install -vvv --profile --prefer-dist
#php -d memory_limit=4096M composer.phar install -vvv --profile --prefer-dist