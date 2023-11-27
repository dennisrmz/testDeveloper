<template>
    <AppLayout title="Orden de compra">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Orden de compra
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-4">
                    <form @submit.prevent="submit">
                        <div class="grid grid-cols-2 gap-6">
                            <div>
                                <div class="my-7">
                                    <label for="cliente">Seleccionar cliente:</label>
                                    <select v-model="clienteSeleccionado" id="cliente">
                                        <option disabled value="">Por favor selecciona uno</option>
                                        <option v-for="cliente in clientes" :key="cliente.id" :value="cliente.id">
                                            {{ cliente.nombre }} {{ cliente.apellido }}
                                        </option>
                                    </select>
                                </div>
                                <div class="my-7">
                                    <!-- Contenido para la primera columna -->


                                    <label for="producto">Seleccione producto a agregar:</label>
                                    <select v-model="productoSeleccionado" id="producto">
                                        <option disabled value="">Por favor selecciona uno</option>
                                        <option v-for="producto in productos" :key="producto.id" :value="producto.id">
                                            {{ producto.nombre }}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <div class="my-7">
                                    <!-- Contenido para la segunda columna -->
                                    <label for="fechaCompra">Fecha de compra:</label>
                                    <input type="date" id="fechaCompra" v-model="fechaCompraSeleccionada" />
                                </div>
                                <div class="my-7">
                                    <!-- Contenido para la segunda columna -->
                                    <label for="cantidad">Cantidad de productos:</label>
                                    <input type="number" id="cantidad" v-model="cantidad" />
                                </div>
                            </div>
                        </div>
                        <div class="my-7">
                            <button type="button" @click="agregarProductoAOrden"
                                class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Agregar
                                producto a orden</button>
                        </div>

                        <div class="my-7">
                            <table class="min-w-full text-center text-sm font-light">
                                <thead
                                    class="border-b bg-neutral-800 font-medium text-white dark:border-neutral-500 dark:bg-neutral-900">
                                    <tr>
                                        <th scope="col" class="px-6 py-4" v-for="(column, index) in columns" :key="index">
                                            {{ column }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in productosOrden" :key="index"
                                        class="border-b dark:border-neutral-500">
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            {{ item.nombre }}
                                        </td>
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            {{ item.descripcion }}
                                        </td>
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            $ {{ item.precio }}
                                        </td>
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            {{ item.cantidad }}
                                        </td>
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            $ {{ item.preciototal }}
                                        </td>
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            {{ item.unit.abreviatura }}
                                        </td>
                                        <td class="whitespace-nowrap  px-6 py-4 font-medium">
                                            <button :key="item.id" type="button" @click="eliminarProducto(item.id)">Eliminar
                                                producto</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="flex justify-end">
                            <button type="submit"
                                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Guardar orden
                                de compra</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </AppLayout>
</template>


<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
import { router } from '@inertiajs/vue3'
import { Head, Link } from '@inertiajs/vue3'
export default {

    components: {
        Head,
        Link,
        AppLayout,
        Welcome
    },
    props: {
        productos: {
            type: Array,
            required: true
        },
        clientes: {
            type: Array,
            required: true
        }
    },
    data() {
        return {
            form: {
                fecha: null,
                productos: [],
                cliente: null
            },
            clienteSeleccionado: null,
            fechaCompraSeleccionada: null,
            productoSeleccionado: null,
            productosOrden: [],
            cantidad: null,
            columns: [
                'Nombre',
                'Descripción',
                'Precio',
                'Cantidad',
                'Precio total',
                'Unidad de medida',
                'Acccion'
            ]
        }
    },
    methods: {
        submit() {
            this.form.fecha = this.fechaCompraSeleccionada;
            this.form.productos = this.productosOrden;
            this.form.cliente = this.clienteSeleccionado;

            router.post('/guardar-orden-compra', this.form)
        },
        agregarProductoAOrden() {
            // Verifica si hay un producto seleccionado
            if (this.productoSeleccionado) {
                // Encuentra el objeto del producto seleccionado
                const productoSeleccionado = this.productos.find(producto => producto.id === this.productoSeleccionado);

                // Si se encontró el producto, agrégalo a la lista productosOrden
                if (productoSeleccionado) {
                    productoSeleccionado.cantidad = this.cantidad;
                    productoSeleccionado.preciototal = parseInt(this.cantidad) * parseFloat(productoSeleccionado.precio);
                    this.productosOrden.push(productoSeleccionado);
                }
            }
            console.log(this.productosOrden)
        },
        eliminarProducto(idProducto) {
            const indiceProducto = this.productosOrden.findIndex(producto => producto.id === idProducto);

            if (indiceProducto !== -1) {
                this.productosOrden.splice(indiceProducto, 1);
            }
        }
    },
}
</script>

<style></style>
