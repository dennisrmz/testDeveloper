<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleOrden extends Model
{
    use HasFactory;
    protected $table = 'detalle_ordenes';
    protected $fillable = [
        'id_orden',
        'id_producto',
        'cantidad',
        'created_at',
        'deleted_at'
    ];

    public function ordenCompra()
    {
        return $this->belongsTo(OrdenCompra::class, 'id_orden');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'id_producto');
    }
}
