<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrdenCompra extends Model
{
    use HasFactory;

    protected $fillable = ['id_cliente','fecha'];
    protected $table = 'ordenes_compra';
    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'id_cliente');
    }

    public function detalleOrdenes()
    {
        return $this->hasMany(DetalleOrden::class, 'id_orden');
    }

    public function getTotalPriceAttribute()
    {
        return $this->detalleOrdenes->sum(function ($detalleOrden) {
            return $detalleOrden->cantidad * $detalleOrden->producto->precio;
        });
    }

    public function getTotalAmount()
    {
        return $this->detalleOrdenes->sum(function ($detalleOrden) {
            return $detalleOrden->cantidad;
        });
    }
}
