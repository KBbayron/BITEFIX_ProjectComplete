<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;

class ForceJsonResponse
{
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request);

        // Si la respuesta ya es JSON, la retornamos sin cambios
        if ($response instanceof JsonResponse) {
            return $response;
        }

        // Si es una respuesta normal, la convertimos a JSON
        if ($response instanceof Response) {
            return response()->json([
                'data' => json_decode($response->getContent(), true)
            ], $response->status());
        }

        return $response;
    }
}

