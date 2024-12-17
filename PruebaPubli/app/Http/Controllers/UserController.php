<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function registrar(Request $request) {
        try {
            //validar campos requeridos y unicos
            $validation = Validator::make($request->all(), [
                'name' => 'required',
                'email' => 'required|unique:users',
                'password' => 'required'
            ]);
            if($validation->fails()){
                //si la validacion no se cumple
                return response()->json([
                    'code' => '400',
                    'data' => $validation->messages()
                ], 400);
            }else{
                //si la validacion se cumple
                $usuario = User::create($request->all());
                return response()->json([
                    'code' => '200',
                    'data' => $usuario, 
                    'token' => $usuario->createToken('api-key')->plainTextToken
                ], 200);
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }
    }
    //endpoint para iniciar sesion
    public function login(Request $request){
        try{
            //validar los campos
            $validation = Validator::make($request->all(), [
                'email' => 'required',
                'password' => 'required'
            ]);
            if($validation->fails()){
                //si la validacion no se cumple
                return response()->json([
                    'code' => '400',
                    'data' => $validation->messages()
                ], 400);
            }else{
                //verificar si los datos pertenecen a un usuario
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
                    //extraer los datos del usuario
                    $usuario = User::where('email', $request->email)->first();
                    return response()->json([
                        'code' => 200,
                        'data' => $usuario,
                        'token' => $usuario->createToken('api-key')->plainTextToken
                    ], 200);
                }else{
                    //si el email y password no estan registrados
                    return response()->json([
                        'code' => '401',
                        'data' => 'Usuario no autorizado'
                    ], 401);
                }
            }
        }catch(\Throwable $th){
            return response()->json($th->getMessage(), 500);
        }
    }
}
