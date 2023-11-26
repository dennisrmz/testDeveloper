<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class ClienteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = json_decode(File::get(database_path('datos/clientes.json')), true);

        DB::table('clientes')->insert($data);

        $this->command->info('Clientes data seeded successfully.');
    }
}
