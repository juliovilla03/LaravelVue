<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Asignar extends Model
{
    use HasFactory;

    protected $table = 'asignar'; //nombre de la tabla
    protected $fillable = ['iddetalle', 'empleadoid', 'tareaid', 'fecha']; //campos de la tabla
}
