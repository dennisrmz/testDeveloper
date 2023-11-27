<?php

use App\Http\Controllers\OrderController;
use App\Models\Cliente;
use App\Models\Producto;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin'          => Route::has('login'),
        'canRegister'       => Route::has('register'),
        'laravelVersion'    => Application::VERSION,
        'phpVersion'        => PHP_VERSION,

    ]);
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {

    Route::get('/crear-orden-compra', function () {
        return Inertia::render(
            'Dashboard', [
                'productos'         => Producto::with('unit')->get(),
                'clientes'          => Cliente::all()
            ]
        );
    })->name('crear.orden.compra');

    Route::post('/guardar-orden-compra', [OrderController::class, 'guardarOrdenCompra'])->name('guardar.orden.compra');
    Route::get('/ordenes-compra', [OrderController::class, 'ordenesCompra'])->name('ordenes.compra');Route::get('/ordenes-compra', [OrderController::class, 'ordenesCompra'])->name('ordenes.compra');
    Route::get('/ver-orden-compra/{orden}', [OrderController::class, 'verOrdenCompra'])->name('ver.orden.compra');
});
