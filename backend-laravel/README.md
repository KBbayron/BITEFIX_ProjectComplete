<center><h1> Backend Laravel v.1 </h1></center>

<h3> Microservices architecture backend <br>
Base endponit <br>
http://127.0.0.1:8000/api/</h3><br>


# Comands used to create project
## 1. Start Laravel project in terminal
Note: "laravel-backend" is the name of proyect

    laravel new laravel-backend
If not work try install in terminal

    composer create-project laravel/laravel laravel-backend
## 2. Select "none" option, only for backend <br>
Which starter kit would you like to install? <br>
[none ] None <br>
[react ] React <br>
[vue ] Vue <br>
[livewire] Livewire<br>
select "none" option, only for backend <br>

    none

## 3. PHPUnit was selected for this project. Select 1
Which testing framework do you prefer? <br>
[Pest]: [0] <br>
Pest [1] PHPUnit<br>

    1
## 4. In this project PosgreSql in the engine data
Which database will your application use? <br>
[SQLite]: [sqlite ] <br>
[mysql ] MySQL <br>
[mariadb] MariaDB <br>
[pgsql ] PostgreSQL <br>
[sqlsrv ] SQL Server (Missing PDO extension)<br>

    pgsql
## 5. The database was created using a script, so migrations won’t be executed.
Default database updated. Would you like to run the default database migrations? <br>
(yes/no)<br>

    no
## 6. For preference for this project npm is useful
Would you like to run npm install and npm run build?<br> 
(yes/no)<br> 

    yes
# Run Laravel service

## To read Composer files
    composer install

## Start Laravel Service 

    php artisan serve

After, enter in project created

    cd backend-laravel

## Create models, controllers y migrations (en caso de ser necesaria la migracion)
    php artisan make:model Cliente -mcr
    php artisan make:model Inventario -mcr
    php artisan make:model Venta -mcr

## Execute migrations
    php artisan migrate

## Base endpoint
http://127.0.0.1:8000/api/




