<template>
    <v-container fluid class="d-flex justify-center align-center" style="height: 100vh; background-color: #f4f7fa;">
        <v-row justify="center" align="center">
            <v-col cols="12" sm="8" md="6" lg="5">
                <v-card class="pa-6" elevation="10" max-width="600px" style="background-color: #ffffff; border-radius: 12px;">
                    <v-card-title class="text-center" style="color: #1976D2; font-weight: bold; font-size: 2.5rem;">
                        ¡Bienvenido!
                    </v-card-title>
                    <v-card-subtitle class="text-center" style="font-size: 1.2rem; color: #607d8b; line-height: 1.6;">
                        Presionar en Administracion para registrar Tareas
                    </v-card-subtitle>
                    <v-card-subtitle class="text-center" style="font-size: 1.2rem; color: #607d8b; line-height: 1.6;">
                        Tambien podras modificar y eliminar tareas
                    </v-card-subtitle>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
export default {
    name: 'InicioView'
}
</script>

<style scoped>
/* Estilos adicionales */
.v-card {
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.v-card-title {
    font-family: 'Roboto', sans-serif;
}
</style>
