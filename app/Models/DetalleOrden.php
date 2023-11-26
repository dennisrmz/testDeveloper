<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleOrden extends Model
{
    use HasFactory;
    protected $table = 'detalle_ordenes';
    protected $fillable = ['id_orden', 'id_producto', 'cantidad'];

    public function ordenCompra()
    {
        return $this->belongsTo('App\OrdenCompra', 'id_orden');
    }

    public function producto()
    {
        return $this->belongsTo('App\Producto', 'id_producto');
    }
}
