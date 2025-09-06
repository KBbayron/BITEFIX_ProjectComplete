<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;

use App\Models\Inventario;
use Illuminate\Http\Request;

class InventarioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(Inventario::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|string|max:25',
            'descripcion' => 'required|string|max:255',
            'MARCA' => 'required|string|max:50',
            'MODELO' => 'required|string|max:50',
            'precio' => 'required|numeric|min:0',
            'in_stock' => 'required|integer|min:0'
        ]);

        $articulo = Inventario::create($validated);
        return response()->json($articulo, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(Inventario::findOrFail($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $articulo = Inventario::findOrFail($id);
        
        $validated = $request->validate([
            'nombre' => 'sometimes|string|max:25',
            'descripcion' => 'sometimes|string|max:255',
            'MARCA' => 'sometimes|string|max:50',
            'MODELO' => 'sometimes|string|max:50',
            'precio' => 'sometimes|numeric|min:0',
            'in_stock' => 'sometimes|integer|min:0'
        ]);

        $articulo->update($validated);
        return response()->json($articulo);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Inventario::findOrFail($id)->delete();
        return response()->json(['message' => 'Artículo eliminado correctamente']);
    }
}