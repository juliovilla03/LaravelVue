<template>
  <v-app>
    <!--menu de la aplicacion-->
    <v-app-bar class="bg-light-blue-darken-3">
      <v-app-bar-title>Sistema de Registro</v-app-bar-title>
      <template v-if="this.$store.getters.getUsuario == null">
        <v-btn prepend-icon="mdi-login" to="/">Login</v-btn>
      </template>
      <template v-if="this.$store.getters.getUsuario !== null">
        <v-btn prepend-icon="mdi-home" to="/home">Inicio</v-btn>
        <v-btn prepend-icon="mdi-cog">
          Administracion
          <v-menu activator="parent">
            <v-list>
              <v-list-item link to="/tareas" title="Tareas"></v-list-item>
              <!--<v-list-item link to="/empleados" title="Empleados"></v-list-item>-->
            </v-list>
          </v-menu>
        </v-btn> 
        <v-btn prepend-icon="mdi-logout" @click="logout">Cerrar Sesion</v-btn> 
      </template>    
    </v-app-bar>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',
  methods: {
    logout(){
      //vaciar el estado de la aplicacion y el storage
      this.$store.dispatch("logout")
        //redireccionar
        this.$router.push("/")
    },
    validarAcceso(){
      let datos = localStorage.getItem("userData")
      if(datos){
        //si hay data en el storagese valida el acceso
        this.$store.dispatch("login", JSON.parse(datos))
        this.$router.push("/home")
      }else{
        //si no hay data se redirecciona al login
        this.$router.push("/")
      }
    }
  },
  created(){
    this.validarAcceso()
  }
}
</script>
