<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TareaController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\UserController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function() {
        //rutas para tareas
        Route::get('tarea/select', [TareaController::class, 'select']);
        Route::post('tarea/store', [TareaController::class, 'store']);
        Route::put('tarea/update/{id}', [TareaController::class, 'update']);
        Route::delete('tarea/delete/{id}', [TareaController::class, 'delete']);
        Route::get('tarea/find/{id}', [TareaController::class, 'find']);
    
        //rutas para empleados
        Route::get('empleado/select', [EmpleadoController::class, 'select']);
        Route::post('empleado/store', [EmpleadoController::class, 'store']);
        Route::put('empleado/update/{id}', [EmpleadoController::class, 'update']);
        Route::delete('empleado/delete/{id}', [EmpleadoController::class, 'delete']);
        Route::get('empleado/find/{id}', [EmpleadoController::class, 'find']);
});

//rutas para usuario
Route::post('usuario/register', [UserController::class, 'registrar']);
Route::post('usuario/login', [UserController::class, 'login']);