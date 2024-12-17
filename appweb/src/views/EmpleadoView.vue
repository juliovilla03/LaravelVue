<template>
    <v-container fluid>
        <h1>Empleados</h1>
        <v-row>
            <v-col xs="12" sm="3" md="3" lg="3" xxl="3">
                <v-text-field label="Nombre" maxlength="60" counter
                color="indigo" clearable placeholder="Nombre Empleado" variant="outlined" v-model="empleado.nombre">
                </v-text-field>
                <v-text-field label="Correo" maxlength="70" counter
                color="indigo" clearable placeholder="Correo" variant="outlined" v-model="empleado.correo">
                </v-text-field>
                <!-- Usar v-model con formato YYYY-MM-DD -->
                <v-date-input clearable label="Fecha de Nacimiento" color="indigo" prepend-icon="" variant="outlined" v-model="empleado.fechaNacimiento" :format="dateFormat">
                </v-date-input>
                <v-btn prepend-icon="mdi-check" color="indigo" block @click="agregarEmpleado">
                    Agregar
                </v-btn>
            </v-col>
            <v-col cols="9" xs="12" sm="9" md="9" xl="9" xxl="9">
                <v-card>
                    <v-card-text>
                        <v-data-table :headers="headers" :items="empleados" class="elevation-1"
                    :items-per-page="10" :search="search">
                        <template v-slot:top><!--cabecera de la tabla-->
                            <v-toolbar flat>
                                <v-toolbar-title>LISTADO DE EMPLEADOS</v-toolbar-title>
                            </v-toolbar>
                            <v-text-field color="indigo" label="Buscar" clearable v-model="search"></v-text-field>
                        </template>
                        <template v-slot:[`item.actions`]=" { item }"><!--Botones de la tabla-->
                            <div class="text-center">
                                <v-btn-group>
                                    <v-btn icon="mdi-eye" color="indigo" @click="obtenerEmpleado(item.id, 1)"></v-btn>
                                    <v-btn icon="mdi-pencil" color="green" @click="obtenerEmpleado(item.id, 2)"></v-btn>
                                    <v-btn icon="mdi-delete" color="red" @click="eliminarEmpleado(item.id)"></v-btn>
                                </v-btn-group>
                            </div>
                        </template>
                    </v-data-table>
                </v-card-text>
            </v-card>
        </v-col>
    </v-row>
</v-container>

<!--modal para ver el registro-->
<v-dialog v-model="modalOne" transition="dialog-top-transition" width="500">
    <v-card title="Datos del Empleado">
        <v-list>
            <v-list-item title="Codigo" :subtitle="datos.id"></v-list-item>
            <v-list-item title="Nombre" :subtitle="datos.nombre"></v-list-item>
            <v-list-item title="Correo" :subtitle="datos.correo"></v-list-item>
            <v-list-item title="Fecha" :subtitle="datos.fechaNacimiento"></v-list-item>
        </v-list>
    </v-card>
</v-dialog>

<!--modal para editar registro-->
<v-dialog v-model="modalDos" transition="dialog-top-transition" width="500">
    <v-card title="Datos del Empleado">
        <v-card-text>
            <v-text-field label="Nombre" maxlength="50" counter
            color="indigo" clearable placeholder="Nombre Empleado" variant="outlined" v-model="datos.nombre">
            </v-text-field>
            <v-text-field label="Correo" maxlength="70" counter
            color="indigo" clearable placeholder="Correo" variant="outlined" v-model="datos.correo">
            </v-text-field>
            <!-- Usar v-model con formato YYYY-MM-DD -->
            <v-date-input clearable label="Fecha de Nacimiento" color="indigo" prepend-icon="" variant="outlined" v-model="datos.fechaNacimiento" :format="dateFormat">
            </v-date-input>
            <v-btn prepend-icon="mdi-check" color="indigo" block @click="modificarEmpleado(datos.id)">
                Guardar
            </v-btn>
        </v-card-text>
    </v-card>
</v-dialog>

</template>

<script>
import Swal from 'sweetalert2' //para los mensajes especiales
import axios from 'axios'

const ruta = 'http://127.0.0.1:8000/api/'

export default {
    name: 'EmpleadoView',
    data() {
        return {
            empleado: {}, //para almacenar la tarea
            empleados: [],//almacenar todos los registros obtenidos desde la api
            headers: [
                { title: 'ID', value: 'id' },
                { title: 'Nombre', value: 'nombre' },
                { title: 'Correo', value: 'correo' },
                { title: 'Acciones', value: 'actions', sortable: false, align: 'center' }
            ], //Este header es para el v-data-table
            search: '',
            modalOne: false,
            modalDos: false,
            datos: {},
            // Definir un formato de fecha
            dateFormat: 'yyyy-MM-dd',
        }
    },
    methods: {
        // Método para mostrar mensajes
        getAlert(message) {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: message,
                showConfirmButton: 'false',
                timer: 2000
            })
        },
        // Método para agregar empleado
        agregarEmpleado() {
            // Asegurarse de que la fecha esté en formato correcto
            if (this.empleado.fechaNacimiento) {
                this.empleado.fechaNacimiento = this.convertirFecha(this.empleado.fechaNacimiento);
            }

            axios.post(ruta + 'empleado/store', this.empleado)
                .then(response => {
                    if (response.data.code == 200) {
                        // Mostrar mensaje
                        this.getAlert(response.data.data)
                        this.empleado = {} // Vaciar objeto
                        this.obtenerEmpleados() // Recargar la tabla
                    }
                })
                .catch(error => console.log('Ha ocurrido un error ' + error))
        },
        // Obtener empleados
        obtenerEmpleados() {
            this.empleados = []
            axios.get(ruta + 'empleado/select')
                .then(response => {
                    if (response.data.code == 200) {
                        let res = response.data
                        this.empleados = res.data
                    }
                })
                .catch(error => console.log('Ha ocurrido un error ' + error))
        },
        // Obtener un empleado específico
        obtenerEmpleado(id, accion) {
            if (accion == 1) {
                this.modalOne = true
            } else {
                this.modalDos = true
            }
            axios.get(ruta + `empleado/find/${id}`)
                .then(response => {
                    if (response.data.code == 200) {
                        let res = response.data
                        this.datos = res.data
                    }
                })
                .catch(error => console.log("Ha ocurrido un error " + error))
        },
        // Modificar empleado
        modificarEmpleado(id) {
            // Asegurarse de que la fecha esté en formato correcto
            if (this.datos.fechaNacimiento) {
                this.datos.fechaNacimiento = this.convertirFecha(this.datos.fechaNacimiento);
            }

            axios.put(ruta + `empleado/update/${id}`, this.datos)
                .then(response => {
                    this.getAlert(response.data.data)
                    this.modalDos = false // Ocultar modal
                    this.obtenerEmpleados()
                })
                .catch(error => console.log('Ha ocurrido un error ' + error))
        },
        // Eliminar empleado
        eliminarEmpleado(id) {
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
                    axios.delete(ruta + `empleado/delete/${id}`)
                        .then(response => {
                            if (response.data.code == 200) {
                                this.getAlert(response.data.data)
                                this.obtenerEmpleados()
                            }
                        })
                        .catch(error => console.log('Ha ocurrido un error ' + error))
                }
            })
        },
        // Método para convertir la fecha
        convertirFecha(fecha) {
            let date = new Date(fecha);
            let yyyy = date.getFullYear();
            let mm = (date.getMonth() + 1).toString().padStart(2, '0');
            let dd = date.getDate().toString().padStart(2, '0');
            return `${yyyy}-${mm}-${dd}`;
        }
    },
    mounted() {
        this.obtenerEmpleados()
    }
}
</script>

