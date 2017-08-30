<template>
  <el-row class="warp">
    <el-col :span="24" class="warp-breadcrum">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }"><b>首页</b></el-breadcrumb-item>
        <el-breadcrumb-item>项目管理</el-breadcrumb-item>
        <el-breadcrumb-item>项目列表</el-breadcrumb-item>
      </el-breadcrumb>
    </el-col>

    <el-col :span="24" class="warp-main">
        <!--工具条-->
        <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
          <el-form :inline="true" :model="filters">
            <el-form-item>
              <el-input v-model="filters.name" placeholder="项目名" style="min-width: 240px;"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="search" @click="getOneProject">查询</el-button>
            </el-form-item>
          </el-form>
        </el-col>

      <!--列表-->
      <el-table :data="projects" highlight-current-row v-loading="loading" style="width: 100%;">
        <el-table-column type="index" width="60">
        </el-table-column>
        <el-table-column prop="projectName" label="项目名" width="120" sortable>
        </el-table-column>
        <el-table-column prop="projectInfo" label="项目信息" width="250" sortable>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="200" sortable>
        </el-table-column>
        <el-table-column prop="creatorUin" label="CreatorUin" width="150" sortable>
        </el-table-column>
        <el-table-column prop="projectId" label="项目ID" min-width="120" sortable>
        </el-table-column>
      </el-table>

    </el-col>
  </el-row>
</template>

<script>
  export default {
    data () {
      return {
        filters: {
          name: ''
        },
        loading: false,
        projects: [],
        apiUrl: 'http://127.0.0.1:8000/myapp/qcloudapi/'
      }
    },
    mounted: function () {
      this.getProjects()
    },
    methods: {
      getProjects: function () {
        this.$http.get(this.apiUrl)
          .then((response) => {
            this.projects = response.data
            // this.$set('projects', response.data) 不能这么用，不会有数据
            console.log(response.data)
          }).catch(function (response) {
            console.log(response.data)
          })
      },
      getOneProject () {
        let para = {
          name: this.filters.name
        }
        this.loading = true
        this.$http.post(this.apiUrl, para)
        .then((response) => {
          this.projects = response.data
          this.loading = false
          console.log(response.data)
        })
      }
    }
  }
</script>

<style scoped>

</style>
