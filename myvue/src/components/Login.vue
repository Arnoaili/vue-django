<template>
  <el-form ref="AccountFrom" :model="account" :rules="rules" label-position="left" label-width="0px"
           class="demo-ruleForm login-container">
    <h3 class="title">系统登录</h3>
    <el-form-item prop="username">
      <el-input type="text" v-model="account.username" auto-complete="off" placeholder="账号"></el-input>
    </el-form-item>
    <el-form-item prop="password">
      <el-input type="password" v-model="account.password" auto-complete="off" placeholder="密码"></el-input>
    </el-form-item>
    <el-checkbox v-model="rememberPassword" class="remember">记住密码</el-checkbox>
    <el-form-item style="width:100%;">
      <el-button type="primary" style="width:100%;" @click.native.prevent="handleLogin" :loading="logining">登录</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
  export default {
    data () {
      return {
        logining: false,
        account: {
          username: sessionStorage.getItem('access-user') ? JSON.parse(sessionStorage.getItem('access-user'))['username'] : '',
          password: sessionStorage.getItem('access-user') ? JSON.parse(sessionStorage.getItem('access-user'))['password'] : ''
        },
        rules: {
          username: [
            {required: true, message: '请输入账号', trigger: 'blur'}
            // { validator: validaePass }
          ],
          password: [
            {required: true, message: '请输入密码', trigger: 'blur'}
            // { validator: validaePass2 }
          ]
        },
        rememberPassword: true,
        isLogin: false
      }
    },
    methods: {
      handleLogin () {
        this.$refs.AccountFrom.validate((valid) => {
          if (valid) {
            this.logining = true
            var user = this.account
            this.$http.post('http://127.0.0.1:8000/myapp/login_api/', user)
              .then((response) => {
                // this.$set('item', {})
                this.logining = false
                console.log(response.data)
                if (response.status === 200) {
                  sessionStorage.setItem('lsLogin', this.isLogin)
                  let status = response.data['status']
                  let msg = response.data['message']
                  if (status === 'error') {
                    this.$message({
                      message: msg,
                      type: 'error'
                    })
                  } else {
                    if (this.rememberPassword) {
                      sessionStorage.setItem('access-user', JSON.stringify(user))
                    } else {
                      sessionStorage.removeItem('access-user')
                    }
                    this.$router.push({ path: '/' })
                  }
                }
              })
          } else {
            console.log('error submit!!')
            return false
          }
        })
      }
    }
  }
</script>

<style>
  body{
    background: #9AC0CD;
  }
</style>
<style lang="scss" scoped>
  .login-container {
    /*box-shadow: 0 0px 8px 0 rgba(0, 0, 0, 0.06), 0 1px 0px 0 rgba(0, 0, 0, 0.02);*/
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-border-radius: 5px;
    background-clip: padding-box;
    margin: 160px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #D3D3D3;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;

    background: -ms-linear-gradient(top, #fff, #6495ed);        /* IE 10 */
    background:-moz-linear-gradient(top,#b8c4cb,#f6f6f8);/*火狐*/
    background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#b8c4cb), to(#f6f6f8));/*谷歌*/
    background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fff), to(#6495ed));      /* Safari 4-5, Chrome 1-9*/
    background: -webkit-linear-gradient(top, #fff, #6495ed,#fff);   /*Safari5.1 Chrome 10+*/
    background: -o-linear-gradient(top, #fff, #6495ed);  /*Opera 11.10+*/

    .title {
      margin: 0px auto 40px auto;
      text-align: center;
      color: #505458;
    }
    .remember {
      margin: 0px 0px 35px 0px;
    }
  }
</style>
