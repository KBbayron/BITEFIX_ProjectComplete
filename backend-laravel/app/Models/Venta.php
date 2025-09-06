<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory;

    protected $table = 'ventas';
    
    protected $fillable = [
        'id_cliente',
        'id_articulo',
        'Unidades',
        'total'
    ];

    public $timestamps = false; 
    protected $casts = [
        'registro' => 'datetime'
    ];

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'id_cliente');
    }

    public function articulo()
    {
        return $this->belongsTo(Inventario::class, 'id_articulo');
    }
}