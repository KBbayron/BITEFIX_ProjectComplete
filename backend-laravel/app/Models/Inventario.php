<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inventario extends Model
{
    use HasFactory;

    protected $table = 'inventario';
    
    protected $fillable = [
        'nombre',
        'descripcion',
        'MARCA',
        'MODELO',
        'precio',
        'in_stock'
    ];
    public $timestamps = false;
    public function ventas()
    {
        return $this->hasMany(Venta::class, 'id_articulo');
    }
}