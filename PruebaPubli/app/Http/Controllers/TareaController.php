<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tarea;
use Illuminate\Support\Facades\Validator;

class TareaController extends Controller
{
    public function select(){
        try {
                $tareas = Tarea::all();
            if($tareas->count() > 0){
                return response()->json([
                    'code' => 200,
                    'data' => $tareas
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
                'name' => 'required',
                'descripcion' => 'required',
                'estado' => 'required'
            ]);
            if($validation->fails()){ //Si la validacion no se cumple
                return response()->json([
                    'code' => 400,
                    'data' => $validation->messages()
                ], 400);
            }else{
                $tarea = Tarea::create($request->all());
                return response()->json([
                    'code' => 200,
                    'data' => 'Tarea Registrada'
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
            'name' => 'required',
            'descripcion' => 'required',
            'estado' => 'required'
        ]);
        if($validation->fails()){ //Si la validacion no se cumple
            return response()->json([
                'code' => 400,
                'data' => $validation->messages()
            ], 400);
        }else{
            //Buscar tarea
            $tarea = Tarea::find($id);
            if($tarea){
                //Si la tarea existe se actualiza
                $tarea->update($request->all());
                return response()->json([
                    'code' => 200,
                    'data' => 'Tarea Actualizada'
                ], 200);
            }else{
                return response()->json([
                    'code' => 404,
                    'data' => 'Tarea no encontrada'
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
            $tarea = Tarea::find($id);
            if($tarea){
                $tarea->delete($id);//si existe el registro se elimina
                return response()->json([
                    'code' => 200,
                    'data' => 'Tarea eliminada'
                ], 200);
            }else{
                return response()->json([
                    'code' => 404,
                    'data' => 'Tarea no eliminada'
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
            $tarea = Tarea::find($id);
            if($tarea){
                //si encuentra el registro lo retornamos
                $datos = Tarea::select()
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
                    'data' => 'Tarea no encontrada'
                ], 404);
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }  
    }
}
