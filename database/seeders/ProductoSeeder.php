<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class ProductoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = json_decode(File::get(database_path('datos/productos.json')), true);

        DB::table('productos')->insert($data);

        $this->command->info('Productos data seeded successfully.');
    }
}
