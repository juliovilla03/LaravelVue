<template>
<v-container fluid>
    <h1>Tareas</h1>
    <v-row>
        <v-col xs="12" sm="3" md="3" lg="3" xxl="3">
            <v-text-field label="Nombre de la Tarea" maxlength="50" counter
            color="indigo" clearable placeholder="Nombre Tarea" variant="outlined" v-model="tarea.name">

            </v-text-field>
            <v-textarea label="Descripcion" color="indigo" clearable counter variant="outlined" v-model="tarea.descripcion">

            </v-textarea>
            <v-select
                    label="Estado"
                    v-model="tarea.estado"
                    :items="['pendiente', 'completado']"
                    color="indigo"
                    clearable
                    variant="outlined"
                ></v-select>
            <v-btn prepend-icon="mdi-check" color="indigo" block @click="agregarTarea">
                Agregar
            </v-btn>
        </v-col>
        <v-col cols="9" xs="12" sm="9" md="9" xl="9" xxl="9">
            <v-card>
                <v-card-text>
                    <v-data-table :headers="headers" :items="tareas" class="elevation-1"
                    :items-per-page="10" :search="search">
                        <template v-slot:top><!--cabecera de la tabla-->
                            <v-toolbar flat>
                                <v-toolbar-tittle>LISTADO DE TAREAS</v-toolbar-tittle>
                            </v-toolbar>
                            <v-text-field color="indigo" label="Buscar" clearable v-model="search"></v-text-field>
                        </template>
                        <template v-slot:[`item.actions`]=" { item }"><!--Botones de la tabla-->
                            <div class="text-center">
                                <v-btn-group>
                                    <v-btn icon="mdi-eye" color="indigo" @click="obtenerTarea(item.id, 1)"></v-btn>
                                    <v-btn icon="mdi-pencil" color="green" @click="obtenerTarea(item.id, 2)"></v-btn>
                                    <v-btn icon="mdi-delete" color="red" @click="eliminarTarea(item.id)"></v-btn>
                                </v-btn-group>
                            </div>
                        </template>
                    </v-data-table>
                    <!----<v-table>
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Depuracion</td>
                                <td>Descripcion Corta</td>
                                <td>pendiente</td>
                                <td>
                                    <v-btn-group>
                                        <v-btn icon="mdi-eye" color="indigo"></v-btn>
                                        <v-btn icon="mdi-pencil" color="green"></v-btn>
                                        <v-btn icon="mdi-delete" color="red"></v-btn>
                                    </v-btn-group>
                                </td>
                            </tr>
                        </tbody>
                    </v-table>-->
                </v-card-text>
            </v-card>
        </v-col>
    </v-row>
</v-container>
<!--modal para ver el registro-->
<v-dialog v-model="modalOne" transition="dialog-top-transition" width="500">
    <v-card title="Datos de la tarea">
        <v-list>
            <v-list-item title="Codigo" :subtitle="datos.id"></v-list-item>
            <v-list-item title="Nombre" :subtitle="datos.name"></v-list-item>
            <v-list-item title="Descripcion" :subtitle="datos.descripcion"></v-list-item>
            <v-list-item title="Estado" :subtitle="datos.estado"></v-list-item>
        </v-list>
    </v-card>
</v-dialog>
<!--modal para editar registro-->
<v-dialog v-model="modalDos" transition="dialog-top-transition" width="500">
    <v-card title="Datos de la tarea">
        <v-card-text>
            <v-text-field label="Nombre" maxlength="50" counter
            color="indigo" clearable placeholder="Nombre Tarea" variant="outlined" v-model="datos.name">

            </v-text-field>
            <v-textarea label="Descripcion" color="indigo" clearable counter variant="outlined" v-model="datos.descripcion">

            </v-textarea>
            <v-select
                    label="Estado"
                    v-model="datos.estado"
                    :items="['pendiente', 'completado']"
                    color="indigo"
                    clearable
                    variant="outlined"
                ></v-select>
            <v-btn prepend-icon="mdi-check" color="indigo" block @click="modificarTarea(datos.id)">
                Guardar
            </v-btn>
        </v-card-text>
    </v-card>
</v-dialog>
</template>
<script>
import Swal from 'sweetalert2'//para los mensajes especiales
import axios  from 'axios'
const ruta = 'http://127.0.0.1:8000/api/'
    export default {
        name: 'TareaView',
        data(){
            return {
                tarea: {}, //para almacenar la tarea
                tareas: [],//almacenar todos los registros obtenidos desde la api
                headers: [
                    { title: 'ID', value: 'id'},
                    { title: 'Nombre', value: 'name'},
                    { title: 'Estado', value: 'estado'},
                    { title: 'Acciones', value: 'actions', sortable:false, align: 'center'}
                ],//Este header es para el v-data-table
                search: '',
                modalOne: false,
                modalDos: false,
                datos: {},
                config:{//configuracion de header para todas las peticiones
                    headers: {
                        'Authorization': 'Bearer '+this.$store.getters.getToken
                    }
                }
            }
        }, 
        methods: {
            //metodo para mostrar mensajes
            getAlert(message){
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: message,
                    showConfirmButton: 'false',
                    timer: 2000
                })
            },
            agregarTarea(){
                axios.post(ruta+'tarea/store', this.tarea, this.config)
                .then(response => {
                    if(response.data.code == 200){
                        //mostrar mensaje
                        this.getAlert(response.data.data)
                        this.tarea = {}//vaciar objeto
                        this.obtenerTareas()//recargar la tabla
                    }
                })
                .catch(error => console.log('Ha ocurrido un error '+error))
            },
            obtenerTareas(){
                this.tareas = []
                axios.get(ruta+'tarea/select', this.config)
                .then(response => {
                    if(response.data.code == 200){
                        let res = response.data
                        this.tareas = res.data
                        //console.log(res.data)
                    }
                })
                .catch(error => console.log('Ha ocurrido un error '+error))
            },
            obtenerTarea(id, accion){//obtener datos de un registro
                if(accion == 1){
                    this.modalOne = true
                }else{
                    this.modalDos = true
                }
                axios.get(ruta+`tarea/find/${id}`, this.config)
                .then(response => {
                    if(response.data.code == 200){
                        let res = response.data
                        this.datos = res.data
                    }
                })
                .catch(error => console.log("Ha ocurrido un error "+ error))
            },
            modificarTarea(id){//metodo para actualizar registros
                axios.put(ruta+`tarea/update/${id}`, this.datos, this.config)
                .then(response => {
                    this.getAlert(response.data.data)
                    this.modalDos = false//ocultar modal
                    this.obtenerTareas()
                })
                .catch(error => console.log('Ha ocurrido un error '+ error))
            },
            eliminarTarea(id){
            Swal.fire({
                title: "Estas Seguro?",
                text: "Si continuas no podras revertir la accion",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Si, eliminar!"
                }).then((result) => {
                if (result.isConfirmed) {
                    axios.delete(ruta+`tarea/delete/${id}`, this.config)
                    .then(response => {
                        if(response.data.code == 200){
                            this.getAlert(response.data.data)
                            this.obtenerTareas()
                        }
                    })
                    .catch(error => console.log('Ha ocurrido un error '+ error))
                }
            });
        }
        },
        created(){
            this.obtenerTareas()
        }

    }
</script>
<style scoped>
    
</style>