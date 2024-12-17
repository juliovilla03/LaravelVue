<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Tarea extends Model
{
    use HasFactory;

    protected $table = 'tareas'; //nombre de la tabla
    protected $fillable = ['id', 'name', 'descripcion', 'estado']; //campos de la tabla
}
