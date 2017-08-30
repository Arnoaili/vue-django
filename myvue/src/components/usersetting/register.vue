<template>
  <el-row class="warp">
    <el-col :span="24" class="warp-breadcrum">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }"><b>首页</b></el-breadcrumb-item>
        <el-breadcrumb-item>设置</el-breadcrumb-item>
        <el-breadcrumb-item>注册</el-breadcrumb-item>
      </el-breadcrumb>
    </el-col>

    <el-col :span="24" class="warp-main">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item prop="username" label="用户名" style="width: 30%;">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item prop="password" label="密码" style="width: 30%;">
          <el-input v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item prop="email" label="邮箱" style="width: 30%;">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="register">提交</el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </el-row>
</template>

<script>
  export default {
    data () {
      return {
        form: {
          username: '',
          password: '',
          email: ''
        },
        url: 'http://127.0.0.1:8000/myapp/register_api/',
        rules: {
          username: [
            {required: true, message: '请输入昵称', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '请输入密码', trigger: 'blur'}
          ],
          email: [
            {message: '请输入邮箱', trigger: 'blur'}
          ]
        }
      }
    },
    methods: {
      mounted () {
        this.register()
      },
      register () {
        // let para = {'username': this.form.username, 'password': this..form.password, 'email': this.form.email}
        let para = Object.assign({}, this.form)
        console.log(para)
        this.$http.post(this.url, para).then((response) => {
          console.log(response.status)
          if (response.status === 200) {
            alert('注册成功！')
          }
        })
      }
    }
  }
</script>
