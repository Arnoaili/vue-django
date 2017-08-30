import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Home from '@/components/Home'
import Dashboard from '@/components/Dashboard'
import Ordermanage from '@/components/ordermanage/Ordermanage'
import ProjectList from '@/components/projectmanage/projectlist'
import Booklist from '@/components/bookmanage/Booklist'
import Chart from '@/components/bookmanage/Chart'
import UserRegister from '@/components/usersetting/register'
import UserChangePwd from '@/components/usersetting/changepwd'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/',
      name: 'home',
      component: Home,
      redirect: '/Dashboard',
      leaf: true, // 只有一个节点
      menuShow: true,
      iconCls: 'iconfont icon-zhuye', // 图标样式class
      children: [
        {path: '/Dashboard', component: Dashboard, name: '首页', menuShow: true}
      ]
    },
    {
      path: '/',
      name: '订单管理',
      component: Home,
      menuShow: true,
      leaf: true, // 只有一个节点
      iconCls: 'iconfont icon-gouwuche',
      children: [
        {path: '/ordermanage', component: Ordermanage, name: '订单管理', menuShow: true}
      ]
    },
    {
      path: '/',
      component: Home,
      name: '项目管理',
      menuShow: true,
      leaf: false, // 只有一个节点
      iconCls: 'iconfont icon-xiangmu', // 图标样式class
      children: [
        {path: '/projectmanage/projectlist', component: ProjectList, name: '项目列表', menuShow: true}
      ]
    },
    {
      path: '/',
      component: Home,
      name: '图书管理',
      menuShow: true,
      leaf: false,
      iconCls: 'iconfont icon-tushuguan1',
      children: [
        {path: '/bookmanage/booklist', component: Booklist, name: '图书列表', menuShow: true},
        {path: '/bookmanage/chart', component: Chart, name: '图表', menuShow: true}
      ]
    },
    {
      path: '/',
      component: Home,
      name: '设置',
      menuShow: true,
      iconCls: 'iconfont icon-shezhi',
      children: [
        {path: '/usersetting/register', component: UserRegister, name: '注册', menuShow: true},
        {path: '/usersetting/changepwd', component: UserChangePwd, name: '修改密码', menuShow: true}
      ]
    }
  ]
})
router.beforeEach((to, from, next) => {
  // console.log('to:' + to.path)
  if (to.path.startsWith('/login')) {
    window.sessionStorage.removeItem('lsLogin')
    next()
  } else {
    // let user = JSON.parse(window.sessionStorage.getItem('access-user'))
    let isLogin = sessionStorage.getItem('lsLogin')
    if (!isLogin) {
      next({path: '/login'})
    } else {
      next()
    }
  }
})

export default router

// export default new Router({
  // routes: [
  //   {
  //     path: '/',
  //     name: 'Dashboard',
  //     component: Dashboard
  //   },
  //   {
  //     path: '/login',
  //     name: 'login',
  //     component: Login
  //   }
  // ]
// })
