import { createRouter, createWebHistory } from 'vue-router'
import InicioView from '../views/InicioView.vue'
import TareaView from '../views/TareaView.vue'
import EmpleadoView from '../views/EmpleadoView.vue'
import LoginView from '../views/LoginView.vue'

const routes = [
  {
    path: '/',
    name: 'login',
    component: LoginView
  },
  {
    path: '/home',
    name: 'home',
    component: InicioView
  },
  {
    path: '/tareas',
    name: 'tareas',
    component: TareaView
  },
  {
    path: '/empleados',
    name: 'empleados',
    component: EmpleadoView
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
