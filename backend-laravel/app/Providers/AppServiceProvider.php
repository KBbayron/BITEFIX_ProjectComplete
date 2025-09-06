<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Registra los servicios de la aplicación.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Realiza cualquier trabajo de inicialización.
     *
     * @return void
     */
    public function boot()
    {
        try {
            // Intentar realizar una consulta simple para verificar la conexión a la base de datos
            DB::connection()->getPdo();
            Log::info('Conexión a la base de datos exitosa');
        } catch (\Exception $e) {
            // Si la conexión falla, lanza una excepción y no se puede levantar el servidor
            Log::error('No se pudo conectar a la base de datos: ' . $e->getMessage());
            echo 'No se pudo conectar a la base de datos. El servicio no puede iniciarse.';
            exit(1); // Finaliza el proceso con un error
        }
    }
}

