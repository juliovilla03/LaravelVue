<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Empleado extends Model
{
    use HasFactory;

    protected $table = 'empleado'; //nombre de la tabla
    protected $fillable = ['id', 'nombre', 'correo', 'fechaNacimiento']; //campos de la tabla
}
