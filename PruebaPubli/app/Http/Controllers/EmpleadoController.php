<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Empleado;
use Illuminate\Support\Facades\Validator;

class EmpleadoController extends Controller
{
    public function select(){
        try {
                $empleados = Empleado::all();
            if($empleados->count() > 0){
                return response()->json([
                    'code' => 200,
                    'data' => $empleados
                ], 200);

            }else{
                return response()->json([
                    'code' => 404,
                    'data' => 'No hay tareas registradas'
                ], 404);
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }
    }
    //endpoint para insertar registros
    public function store(Request $request){
        try{
            //validar que los datos sean requeridos
            $validation = validator::make($request->all(), [
                'nombre' => 'required',
                'correo' => 'required',
                'fechaNacimiento' => 'required'
            ]);
            if($validation->fails()){ //Si la validacion no se cumple
                return response()->json([
                    'code' => 400,
                    'data' => $validation->messages()
                ], 400);
            }else{
                $empleado = Empleado::create($request->all());
                return response()->json([
                    'code' => 200,
                    'data' => 'Empleado Registrado'
                ], 200);
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }
    }
    //endpoint para modificar o actualizar registros
    public function update(Request $request, $id){
        try{
            //validar que los datos sean requeridos
        $validation = validator::make($request->all(), [
            'nombre' => 'required',
            'correo' => 'required',
            'fechaNacimiento' => 'required'
        ]);
        if($validation->fails()){ //Si la validacion no se cumple
            return response()->json([
                'code' => 400,
                'data' => $validation->messages()
            ], 400);
        }else{
            //Buscar tarea
            $empleado = Empleado::find($id);
            if($empleado){
                //Si la tarea existe se actualiza
                $empleado->update($request->all());
                return response()->json([
                    'code' => 200,
                    'data' => 'Empleado Actualizado'
                ], 200);
            }else{
                return response()->json([
                    'code' => 404,
                    'data' => 'Empleado no encontrado'
                ], 404);
            }
        }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }  
    }
    //endpoint para eliminar registro
    public function delete($id) {
        try{
            //realizar la busqueda del registro
            $empleado = Empleado::find($id);
            if($empleado){
                $empleado->delete($id);//si existe el registro se elimina
                return response()->json([
                    'code' => 200,
                    'data' => 'Empleado eliminado'
                ], 200);
            }else{
                return response()->json([
                    'code' => 404,
                    'data' => 'Empleado no eliminado'
                ], 404);
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }  
    }
    //endpoint para buscar registro
    public function find($id) {
        try{
            //Buscar tarea
            $empleado = Empleado::find($id);
            if($empleado){
                //si encuentra el registro lo retornamos
                $datos = Empleado::select()
                ->where('id', $id)
                ->get();
                return response()->json([
                    'code' => 200,
                    'data' => $datos[0]
                ], 200);
            }else{
                //si no lo encontro
                return response()->json([
                    'code' => 404,
                    'data' => 'Empleado no encontrado'
                ], 404);
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }  
    }
}
