<?php

namespace App\Http\Controllers;

use App\Models\OrdenCompra;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class OrderController extends Controller
{
    public function guardarOrdenCompra(Request $request)
    {
        $requestData = $request->validate([
            'fecha'     => 'required|date',
            'productos' => 'required|array',
            'cliente'   => 'required|integer'
        ]);

        // Suponiendo que tienes un modelo llamado OrdenCompra
        $ordenCompra                = new OrdenCompra();
        $ordenCompra->fecha         = $requestData['fecha'];
        $ordenCompra->id_cliente    = $requestData['cliente'];
        $ordenCompra->save();

        $arrayDetalle = array();
        foreach ($requestData['productos'] as $productoData) {
            $timestamp = Carbon::now()->toDateTimeString();
            $item = array(
                'id_orden'      => $ordenCompra->id,
                'id_producto'   => $productoData['id'],
                'cantidad'      => $productoData['cantidad'],
                'created_at'    => $timestamp,
                'updated_at'    => $timestamp,
            );
            // Guardar el producto asociado a la orden de compra
            $arrayDetalle[] = $item;
        }
        DB::table('detalle_ordenes')->insert($arrayDetalle);

        return redirect()->route('ordenes.compra')->with('success', 'Orden creada correctamente.');
    }


    public function ordenesCompra()
    {
        $ordenesCompra = OrdenCompra::with('detalleOrdenes.producto', 'cliente')->get();
        $ordenDatos = array();
        foreach ($ordenesCompra as $orden) {

            $item = array(
                'order_id'          => $orden->id,
                'cliente_nombre'    => $orden->cliente->nombre . ' ' . $orden->cliente->apellido,
                'fecha'             => $orden->fecha,
                'cantidad'          => $orden->getTotalAmount(),
                'precio_total'      => $orden->getTotalPriceAttribute(),
            );

            $ordenDatos[] = $item;
        }
        return Inertia::render(
            'OrdenesCompra',
            [
                'ordenesCompra' => $ordenDatos
            ]
        );
    }

    public function verOrdenCompra(OrdenCompra $orden)
    {
        $ordenCompra = $orden::where('id', $orden->id)->with('detalleOrdenes.producto', 'cliente')->first();
        // dd($ordenCompra);
        return Inertia::render(
            'VerOrden',
            [
                'ordenCompra' => $ordenCompra
            ]
        );
    }



    /**
     *
     * Para orden api
     */

    public function insertarOrden(Request $request)
    {
        try {
            $requestData = $request->json()->all();
            $jsonRequestData = json_encode($requestData);
            // Suponiendo que tienes un modelo llamado OrdenCompra
            DB::select('CALL InsertarOrdenCompra(?)', [$jsonRequestData]);

            return response()->json(
                [
                    'error'     => false,
                    'mensaje'   => "Datos insertados."
                ],
                200
            );
        } catch (Exception $th  ) {
            return response()->json(
                [
                    'error'     => true,
                    'mensaje'   => $th->getMessage()
                ],
                200
            );
        }
    }
}
