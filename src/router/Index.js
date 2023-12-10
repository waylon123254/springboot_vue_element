import store from '@/store/store'
import { createStore } from 'vuex'
const store = createStore(
    {
        path: '/about',
        name: 'about',
        component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue').catch(err => console.log(err))
    },
    {
        path: '/',
        name: '主页',
        component: () => import(/* webpackChunkName: "manage" */ '../views/Manage.vue'),
        children: [
            {
                path: 'user',
                name: '用户',
                component: () => import(/* webpackChunkName: "user" */ '../views/User.vue')
            },
            {
                path: 'home',
                name: '首页',
                component: () => import(/* webpackChunkName: "user" */ '../views/Home.vue')
            }
        ]
    },
    {
        path: '/login',
        name: '/Login',
        component: () => import(/* webpackChunkName: "user" */ '../views/Login.vue')
    }
)
const navigateTo = (route) => {
    const pathNames = {
        fromPathName: null, // 由于没有 Vue Router，无法获取 from 的路由名称
        toPathName: route.name
    };
    localStorage.setItem("pathNames", JSON.stringify(pathNames));
    store.commit("setPath");
}

export default {
    navigateTo,
    routes
}