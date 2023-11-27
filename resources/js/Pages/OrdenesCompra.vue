<template>
    <AppLayout title="Ordenes de compra">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Ordenes de compra
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-4">
                    <div class="flex flex-col">
                        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
                                <div class="overflow-hidden">
                                    <div>
                                        <NavLink class="mb-5" :href="route('crear.orden.compra')"
                                            :active="route().current('crear.orden.compra')">
                                            Crear orden de compra
                                        </NavLink>
                                    </div>
                                    <table class="min-w-full text-center text-sm font-light">
                                        <thead
                                            class="border-b bg-neutral-800 font-medium text-white dark:border-neutral-500 dark:bg-neutral-900">
                                            <tr>
                                                <th scope="col" class=" px-6 py-4">#</th>
                                                <th scope="col" class=" px-6 py-4">Fecha</th>
                                                <th scope="col" class=" px-6 py-4">Cliente</th>
                                                <th scope="col" class=" px-6 py-4">Cantidad de Productos</th>
                                                <th scope="col" class=" px-6 py-4">Precio Total</th>
                                                <th scope="col" class=" px-6 py-4">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(item, index) in ordenesCompra" :key="item.order_id"
                                                class="border-b dark:border-neutral-500">
                                                <td class="whitespace-nowrap  px-6 py-4 font-medium">{{ item.order_id }}
                                                </td>
                                                <td class="whitespace-nowrap  px-6 py-4">{{ item.fecha }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">{{ item.cliente_nombre }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">{{ item.cantidad }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">$ {{ item.precio_total }}</td>
                                                <td class="whitespace-nowrap  px-6 py-4">
                                                    <NavLink :href="route('ver.orden.compra', item.order_id)"
                                                        :active="route().current('ver.orden.compra')">
                                                        Ver detalle
                                                    </NavLink>
                                                </td>
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
        ordenesCompra: {
            type: Array,
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
}
</script>

<style></style>
