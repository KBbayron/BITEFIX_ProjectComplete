<center><h1> Backend Laravel v.10 </h1></center><br>

<h3> Microservices architecture backend </h3> <br>

# Comands used to create project
## 1. Start Laravel project in terminal
Note: "laravel-backend" is the name of proyect

    laravel new laravel-backend
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

## Install Composer in the machine
    composer install

## Start Laravel Service 

    php artisan serve

## Crear proyecto y acceder 
    composer create-project laravel/laravel backend-laravel
    cd backend-laravel

## Create models, controllers y migrations (en caso de ser necesaria la migracion)
    php artisan make:model Cliente -mcr
    php artisan make:model Inventario -mcr
    php artisan make:model Venta -mcr

## Para correr migraciones
    php artisan migrate

## Endponit base
http://127.0.0.1:8000/api/







## Al clonar
    composer install

## Iniciar el servicio

    php artisan serve

## Crear proyecto y acceder 
    composer create-project laravel/laravel backend-laravel
    cd backend-laravel

## crear modelos, controlador y migracion (en caso de ser necesaria la migracion)
    php artisan make:model Cliente -mcr
    php artisan make:model Inventario -mcr
    php artisan make:model Venta -mcr

## Para correr migraciones
    php artisan migrate

## Endponit base
http://127.0.0.1:8000/api/

