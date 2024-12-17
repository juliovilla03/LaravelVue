<template>
    <v-container fluid>
        <v-row justify="center">
            <v-col xs="12" sm="4" md="4" lg="4" xl="4">
                <v-card>
                    <v-img height="200" src="../assets/login.jpg"></v-img>
                    <v-card-text>
                        <h2 class="text-blue-grey-darken-2" style="text-align: center;">Registro</h2>
                        <p class="text-blue-grey-darken" style="text-align: center;">Login</p>
                        <v-form>
                            <v-text-field label="Correo" counter maxlength="70"
                            color="indigo" clearable prepend-inner-icon="mdi-email" v-model="usuario.email">
                            </v-text-field>
                            <v-text-field label="Contraseña" counter maxlength="15" placeholder="**********"
                            color="indigo" clearable type="password" prepend-inner-icon="mdi-key" v-model="usuario.password">
                            </v-text-field>
                            <v-btn color="indigo" block @click="login">Iniciar Sesion</v-btn>
                            <!-- Botón para abrir el modal de registro -->
                            <v-btn color="green" block @click="openRegisterModal">Registrar Usuario</v-btn>
                        </v-form>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
        
        <!-- Modal de Registro -->
        <v-dialog v-model="modalRegistro" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Registrar Nuevo Usuario</span>
                </v-card-title>
                <v-card-text>
                    <v-form ref="formRegistro" v-model="validFormRegistro">
                        <v-text-field v-model="nuevoUsuario.name" label="Nombre" :rules="[rules.required]" outlined></v-text-field>
                        <v-text-field v-model="nuevoUsuario.email" label="Correo Electrónico" :rules="[rules.required, rules.email]" outlined></v-text-field>
                        <v-text-field v-model="nuevoUsuario.password" label="Contraseña" type="password" :rules="[rules.required]" outlined></v-text-field>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-btn color="green" @click="registrarUsuario" :disabled="!validFormRegistro">Registrar</v-btn>
                    <v-btn color="red" @click="modalRegistro = false">Cancelar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <!-- Snackbar de alertas -->
        <v-snackbar :timeout="1500" color="red-darken-4" v-model="alertEstado">
            {{ alertaMensaje }}
        </v-snackbar>
    </v-container>
</template>

<script>
import axios from 'axios';

export default {
    name: 'LoginView',
    data() {
        return {
            // Usuario para el login
            usuario: {
                email: "",
                password: ""
            },
            // Variables para el modal de registro
            modalRegistro: false,
            nuevoUsuario: {
                name: "",
                email: "",
                password: ""
            },
            validFormRegistro: false,
            rules: {
                required: value => !!value || 'Este campo es obligatorio',
                email: value => /.+@.+\..+/.test(value) || 'Debe ser un correo válido'
            },
            alertEstado: false,
            alertaMensaje: ""
        }
    },
    methods: {
        // Método para iniciar sesión
        login() {
            axios.post('http://127.0.0.1:8000/api/usuario/login', this.usuario)
                .then((response) => {
                    if (response.status == 200) {
                        let datos = {
                            usuario: response.data.data.name,
                            token: response.data.token
                        }
                        // Guardar los datos en el store
                        this.$store.dispatch("login", datos)
                        // Redireccionar a la página home
                        this.$router.push("/home")
                    }
                })
                .catch((error) => {
                    this.alertEstado = true
                    if (error.response.status == 401) {
                        this.alertaMensaje = error.response.data.data
                    } else {
                        this.alertaMensaje = "!Ups¡ Algo salió mal"
                    }
                })
        },
        
        // Abrir modal de registro
        openRegisterModal() {
            this.modalRegistro = true;
        },

        // Registrar un nuevo usuario
        registrarUsuario() {
            axios.post('http://127.0.0.1:8000/api/usuario/register', this.nuevoUsuario)
                .then((response) => {
                    if (response.status === 200) {
                        this.alertaMensaje = "Usuario registrado exitosamente!";
                        this.alertEstado = true;
                        this.modalRegistro = false; // Cerrar modal
                        this.nuevoUsuario = { name: "", email: "", password: "" }; // Limpiar formulario
                    }
                })
                .catch((error) => {
                    this.alertaMensaje = "Error al registrar usuario: " + error.response.data.data;
                    this.alertEstado = true;
                });
        }
    }
}
</script>

<style scoped>
/* Puedes agregar estilos personalizados aquí si es necesario */
</style>
