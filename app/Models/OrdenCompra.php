<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrdenCompra extends Model
{
    use HasFactory;

    protected $fillable = ['id_cliente'];
    protected $table = 'ordenes_compra';
    public function cliente()
    {
        return $this->belongsTo('App\Cliente', 'id_cliente');
    }

    public function detalleOrdenes()
    {
        return $this->hasMany('App\DetalleOrden', 'id_orden');
    }
}
