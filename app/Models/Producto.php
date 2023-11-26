<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'productos';
    protected $fillable = ['nombre', 'precio', 'id_unidad', 'descripcion'];

    public function unit()
    {
        return $this->belongsTo(Unidad::class, 'id_unidad');
    }
}
