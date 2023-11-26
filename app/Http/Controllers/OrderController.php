<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function guardarOrdenCompra(Request $request)
    {
        dd($request);
        $data = $request->validate([
            'name' => 'required|string|max:255',
        ]);



        return redirect()->route('schools.index')->with('success', 'Escuela creada correctamente.');
    }
}
