<template>
    <AppLayout title="Detalle de orden">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Orden de compra  #{{ ordenCompra.id }}
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-4">
                    <div class="flex flex-col">
                        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
                                <div class="overflow-hidden">
                                    <div class="mb-4">
                                        <div class="space-y-12">
                                            <div class=" pb-6">
                                                <h2 class="text-base font-semibold leading-7 text-gray-900">Cliente</h2>
                                                <p class="mt-1 text-sm leading-6 text-gray-600">
                                                    {{ ordenCompra.cliente.nombre }} {{ ordenCompra.cliente.apellido }}
                                                </p>
                                            </div>
                                        </div>

                                        <div class="space-y-12">
                                            <div class="pb-6">
                                                <h2 class="text-base font-semibold leading-7 text-gray-900">Fecha</h2>
                                                <p class="mt-1 text-sm leading-6 text-gray-600">
                                                    {{ formattedFecha }}
                                                </p>
                                            </div>
                                        </div>

                                    </div>
                                    <table class="min-w-full text-center text-sm font-light">
                                        <thead
                                            class="border-b bg-neutral-800 font-medium text-white dark:border-neutral-500 dark:bg-neutral-900">
                                            <tr>
                                                <th scope="col" class=" px-6 py-4">#</th>
                                                <th scope="col" class=" px-6 py-4">Producto</th>
                                                <th scope="col" class=" px-6 py-4">Precio</th>
                                                <th scope="col" class=" px-6 py-4">Cantidad de Productos</th>
                                                <th scope="col" class=" px-6 py-4">Precio Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(item, index) in ordenCompra.detalle_ordenes" :key="item.id" class="border-b dark:border-neutral-500">
                                                <td class="whitespace-nowrap  px-6 py-4 font-medium">{{ item.id }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">{{ item.producto.nombre }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">${{ item.producto.precio }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">{{ item.cantidad }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">$ {{ item.producto.precio * item.cantidad }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
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
import NavLink from '@/Components/NavLink.vue';
export default {

    components: {
        Head,
        Link,
        AppLayout,
        Welcome,
        NavLink
    },
    props: {
        ordenCompra: {
            type: Object,
            required: true
        }

    },
    data() {
        return {
            href: '/crear-orden-compra'
        }
    },
    methods: {


    },
    computed: {
        formattedFecha() {
            // Obtener la fecha y dividirla en año, mes y día
            const [year, month, day] = this.ordenCompra.fecha.split('-');

            // Crear una nueva fecha en el formato deseado (dd-mm-yyyy)
            const formattedDate = `${day}-${month}-${year}`;

            return formattedDate;
        }
    }
}
</script>

<style></style>
