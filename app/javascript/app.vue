<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import UsersIndexPage from 'UsersIndexPage.vue'
import UsersShowPage from 'UsersShowPage.vue'

const router = new VueRouter({
  mode: 'history',
  base: '/with_vue',
  routes: [
    { path: '/users/:id',
      name: 'UsersShowPage',
      component: UsersShowPage, UsersIndexPage  }
  ]
})

Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
</style>