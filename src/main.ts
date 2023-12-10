import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-ui/lib/theme-chalk/index.css';
import './assets/global.css';
import axios from 'axios';
import request from '@/utils/request.js';
import store from '@/store/store'
import { createStore } from 'vuex';
import App from './App.vue'
const app = createApp(App)

app.use(store)
app.use(ElementPlus, { size: "mini" })

app.config.globalProperties.$axios = axios
app.config.globalProperties.$request = request

app.mount('#app')