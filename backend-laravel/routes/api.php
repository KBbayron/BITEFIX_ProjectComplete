<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\InventarioController;
use App\Http\Controllers\VentaController;

// Elimina el ->prefix('api') de aquí ya que ya está en RouteServiceProvider
Route::middleware('api')->group(function () {
    Route::apiResource('clientes', ClienteController::class);
    Route::apiResource('inventario', InventarioController::class);
    Route::apiResource('ventas', VentaController::class);
});