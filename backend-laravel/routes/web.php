<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function() {
    return response()->json([
        'message' => 'API test successful',
        'routes' => Route::getRoutes()->getRoutes()
    ]);
});

Route::get('/test-routes', function() {
    return [
        'api_file_exists' => file_exists(base_path('routes/api.php')),
        'routes' => Route::getRoutes()->getRoutesByName()
    ];
});
