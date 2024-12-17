README 

Se hizo uso de "Laragon" para gestionar todo el tema de los servicios.
Versiones Utilizadas (se recomienda usar esas versiones o superiores)

php: 8.2.26-Win32-vs16-x64
APACHE: httpd-2.4.62-240904-Win64-vs17
MySQL: mysql-8.0.30-winx64
Composer: version 2.8.4
Node.js y npm: si aun no se tiene instalado npm usar el siguiente comando "npm install"

NOTA: Laragon en mi caso trajo por defecto otras versiones de php, APACHE y MySQL y no las que yo utilice
al final. Si tienes un problema con esto puedes ver los siguientes videos donde se explica como cambiar 
las versiones. (si con tus versiones actuales todo funciona correctamente entonces no es necesario hacer cambios)

https://youtu.be/RDOWbUTsL74?si=2njmRSOokBbm_0H2
https://www.youtube.com/watch?v=7yBWpE75_r4
 
CORRER Y LEVANTAR PROYECTO

PubliPrueba (Backend): desde la terminal utilizar "php artisan serve" correra en http://127.0.0.1:8000
appweb (Frontend): desde la terminal utilizar "npm run serve" la app deberia estar corriendo en  http://localhost:8080/
pruebapubli (MySQL): en el phpmyadmin de laragon importar la base de datos 

NOTA: Con las versiones antes mencionadas me basto para correr el proyecto unicamente con los anteriores 2
comandos y con la base de datos importada. si hubiera a haber problemas con el composer puedes usar
"composer install" en el backend. Igualmente si quisieras puedes usar "php artisan migrate" para las migra-
ciones antes de correr el serve (en mi caso no lo necesite para correr el proyecto desde otro equipo)

QUE TECNOLOGIAS SE USARON

Laravel 
Sanctum: para la autenticación de usuarios mediante tokens. 
API RESTful:  endpoints API que Vue.js consume para interactuar con el backend.
Vue.js
Vue Router: para la navegacion.
Vuex: Maneja el estado global de la aplicación o el estado de la autenticacion.
Vuetify
Axios
CSRF Token: Usado para prevenir ataques de falsificación de solicitudes entre sitios.

---------------------------------------------------------------------------
README Postman

Si quieras probar la api y las rutas en postman para comprobar el tema del token simplemente 
basta con irte al request login, poner un user existente y sacar el token, luego para probar 
cualquier otra request para Tarea (select, find, delete, update, store) solo basta con irse headers
y cambiar el token por el que acabas de generar en Authorization con el value de Bearer (token generado).

La coleccion ya esta hecha con sus rutas y body.