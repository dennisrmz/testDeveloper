<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class UnidadSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = json_decode(File::get(database_path('datos/unidades.json')), true);

        DB::table('unidades')->insert($data);

        $this->command->info('Unidades data seeded successfully.');
    }
}
