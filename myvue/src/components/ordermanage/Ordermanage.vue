<template>
  <div id="app2">
    <el-row class="warp">
      <el-col :span="24" class="warp-breadcrum">
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }"><b>首页</b></el-breadcrumb-item>
          <el-breadcrumb-item>订单管理</el-breadcrumb-item>
        </el-breadcrumb>
      </el-col>
    </el-row>

    <div class="ght"><h3>购物车DEMO</h3></div>

    <shop-list></shop-list>
    <!-- <shop-cart></shop-cart> -->
    <!-- <shop-info></shop-info> -->
  </div>
</template>

<script>
  // import Resource from './components/Resource'
  // import Cart from './Cart'
  import List from './List'

  export default {
    name: 'app2',
    components: {
      ShopList: List
      // ShopInfo:Info,
      // ShopCart: Cart
    }
  }
</script>

<style>
  .ght {
      font-family: 'Avenir', Helvetica, Arial, sans-serif;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
      text-align: center;
      color: #2c3e50;
  }
</style>
