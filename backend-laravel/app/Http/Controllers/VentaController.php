<?php

namespace App\Http\Controllers;

use App\Models\Venta;
use App\Models\Cliente;
use App\Models\Inventario;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(Venta::with(['cliente', 'articulo'])->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_cliente' => 'required|exists:clientes,id',
            'id_articulo' => 'required|exists:inventario,id',
            'Unidades' => 'required|integer|min:1',
            'total' => 'required|numeric|min:0'
        ]);

        // Verificar stock y actualizar
        $articulo = Inventario::find($validated['id_articulo']);
        if ($articulo->in_stock < $validated['Unidades']) {
            return response()->json(['message' => 'Stock insuficiente'], 400);
        }

        $articulo->decrement('in_stock', $validated['Unidades']);
        $venta = Venta::create($validated);
        
        return response()->json($venta, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return response()->json(Venta::with(['cliente', 'articulo'])->findOrFail($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $venta = Venta::findOrFail($id);
        
        $validated = $request->validate([
            'id_cliente' => 'sometimes|exists:clientes,id',
            'id_articulo' => 'sometimes|exists:inventario,id',
            'Unidades' => 'sometimes|integer|min:1',
            'total' => 'sometimes|numeric|min:0'
        ]);

        $venta->update($validated);
        return response()->json($venta);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Venta::findOrFail($id)->delete();
        return response()->json(['message' => 'Venta eliminada correctamente']);
    }
}