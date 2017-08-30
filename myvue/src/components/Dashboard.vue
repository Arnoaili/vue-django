<template>
  <el-row class="warp">
    <el-col :span="24" class="warp-breadcrum">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }"><b>首页</b></el-breadcrumb-item>
      </el-breadcrumb>
    </el-col>

    <el-col :span="24" class="warp-main">
      <section class="chart-container">
        <el-row>
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }">
              <img src="../assets/images/tup2.png" class="image">
              <div style="padding: 14px;">
                <span>镇魂街</span>
                <div class="bottom clearfix">
                  <time class="time">{{ currentDate }}</time>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }">
              <img src="../assets/images/tup3.png" class="image">
              <div style="padding: 14px;">
                <span>镇魂街-曹焱兵</span>
                <div class="bottom clearfix">
                  <time class="time">{{ currentDate }}</time>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }">
              <img src="../assets/images/tup1.png" class="image">
              <div style="padding: 14px;">
                <span>镇魂街-夏玲</span>
                <div class="bottom clearfix">
                  <time class="time">{{ currentDate }}</time>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="24">
            <div style="color:#4D4D4D"> &nbsp;&nbsp;&nbsp;&nbsp;《镇魂街》是由优酷、奥飞剧业、雄孩子传媒、有妖气联合出品，汪东城、安悦溪等人主演的网络剧。
                  该剧由许辰创作的少年奇幻热血漫画改编，讲述了在人灵共存的镇魂街上，肩负守护任务的镇魂将曹
                  焱兵结识了误入此地的少女夏铃，两人展开一段惊心动魄的救世守护之旅的故事。
                  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;该剧于2017年8月2日在优酷视频首播。
                  讲述了魏武后裔曹焱兵（汪东城饰）身为人灵共存的罗刹街镇魂将，誓守灵域一方安定。寄灵人夏铃（安悦溪饰）
                  的意外乱入，引动灵域风云激变。一直暗中觊觎的神秘邪恶势力发动突袭，导致人世与灵域的结界被毁，于是曹焱兵
                  与欢喜冤家夏铃踏上镇魂之旅，一同闯荡异世界的故事。
            </div>
          </el-col>
        </el-row>
      </section>
    </el-col>
  </el-row>
</template>
<style>
  .time {
    font-size: 13px;
    color: #999;
  }

  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .image {
    width: 100%;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both
  }

  .chart-container {
    width: 100%;
  }
  .chart-container .el-col {
    padding: 30px 20px;
  }
</style>

<script>
  export default {
    data () {
      return {
        currentDate: new Date()
      }
    }
  }
</script>
