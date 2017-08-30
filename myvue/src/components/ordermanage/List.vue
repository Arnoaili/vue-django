<template>
  <div style="width: 99.4%">
    <div class="shop">
      <h4>商品信息</h4>
      <el-table :data="tableData" border style="width: 100%">
        <el-table-column align="center" prop="id" label="id" width="180">
        </el-table-column>
        <el-table-column align="center" prop="name" label="菜名" width="250">
        </el-table-column>
        <el-table-column align="center" prop="price" label="单价" width="250">
        </el-table-column>
        <el-table-column align="center" prop="number" label="数量" width="180">
        </el-table-column>
        <el-table-column align="center" prop="sum" label="合计" width="180">
        </el-table-column>
        <el-table-column align="center" label="Action">
          <template scope="scope">
            <el-button
              size="small" type="primary"
              @click="add(scope.$index, scope.row)">{{scope.row.number > 0 ? '+' : '加入购物车'}}{{scope.row.num > 0 ? '1' : scope.row.num}}</el-button>
            <el-button
              size="small"
              type="warning"
              @click="reduce(scope.$index, scope.row)" v-if="scope.row.number>0">-</el-button>
            <el-button
              size="small"
              type="danger"
              @click="clear_one(scope.$index, scope.row)" v-if="scope.row.number>0">x</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="cart-info">
      <el-row>
        <el-col :span="2">总数：<strong>{{totalNum}}</strong></el-col>
        <el-col :span="2">总价：<strong>{{totalPrice}}</strong></el-col>
        <el-col :span="20">
          <div class="weizi">
            <el-button type="danger" @click='clear_db'>清空购物车</el-button>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        tableData: [{
          id: '1',
          name: '鱼香肉丝',
          price: '12',
          number: 0,
          sum: 0
        }, {
          id: '2',
          name: '宫保鸡丁',
          price: '14',
          number: 0,
          sum: 0
        }, {
          id: '3',
          name: '土豆丝',
          price: '6',
          number: 0,
          sum: 0
        }, {
          id: '4',
          name: '米饭',
          price: '2',
          number: 0,
          sum: 0
        }],
        totalNum: 0,
        totalPrice: 0
      }
    },
    methods: {
      add: function (index, row) {
        let num = this.tableData[index].number
        let price = this.tableData[index].price
        console.log(index)
        this.tableData[index].number = num + 1
        console.log(this.tableData[index].number)
        this.totalNum += 1
        this.totalPrice += price * 1
        this.tableData[index].sum = this.tableData[index].number * price
      },
      reduce: function (index, row) {
        let num = this.tableData[index].number
        let price = this.tableData[index].price
        this.tableData[index].number = num - 1
        this.totalNum -= 1
        this.totalPrice -= price * 1
        this.tableData[index].sum = this.tableData[index].number * price
      },
      clear_one: function (index, row) {
        let num = this.tableData[index].number
        let price = this.tableData[index].price
        this.tableData[index].number = 0
        this.tableData[index].sum = 0
        this.totalNum -= num
        this.totalPrice -= price * num
      },
      clear_db: function () {
        this.totalNum = 0
        this.totalPrice = 0
        let len = this.tableData.length
        for (var i = 0; i < len; i++) {
          this.tableData[i].number = 0
          this.tableData[i].sum = 0
        }
      }
    }
  }
</script>

<style scoped lang="scss">
  .shop{
    text-align: center
  }

  .cart-info{
    font-size: 18px;
    text-align: left;
    line-height: 60px;

    .weizi{
      text-align: right;
    }

  }

</style>
