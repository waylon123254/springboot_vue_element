import { createStore } from 'vuex'

const store = createStore({
    state: {
        currentPathName: ''
    },
    mutations: {
        setPath(state) {
            state.currentPathName = localStorage.getItem('currentPathName') || ''
        }
    }
})

export default store