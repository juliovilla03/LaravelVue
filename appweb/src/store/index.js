import { createStore } from 'vuex'

export default createStore({
  state: {
    //variables de estado global de la aplicacion
    usuario: null,
    token: null
  },
  getters: {
    getUsuario(state){ //retorna usuario
      return state.usuario
    },
    getToken(state){ //retorna token
      return state.token
    }
  },
  mutations: {
    //modificar el valor del usuaruio
    setUsuario(state, user){
      state.usuario = user
    },
    //modificar el valor del token
    setToken(state, token){
      state.token = token
    }
  },
  actions: {
    //accion para realizar el login
    login(context, data){
      //llenar las variables de estado
      context.commit('setUsuario', data.usuario)
      context.commit('setToken', data.token)
      //guardar la data en el local storage
      localStorage.setItem('userData', JSON.stringify(data))
    },
    logout(context){
      //vaciar variables de estado
      context.commit('setUsuario', null)
      context.commit('setToken', null)
      //eliminar data de localstorage
      localStorage.removeItem('userData')
    }
  },
  modules: {
  }
})
