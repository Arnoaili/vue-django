<template>
  <el-row class="warp">
    <el-col :span="24" class="warp-breadcrum">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }"><b>首页</b></el-breadcrumb-item>
        <el-breadcrumb-item>图书管理</el-breadcrumb-item>
        <el-breadcrumb-item>图书列表</el-breadcrumb-item>
      </el-breadcrumb>
    </el-col>

    <el-col :span="24" class="warp-main">
      <!--工具条-->
      <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
        <el-form :inline="true" :model="filters">
          <el-form-item>
            <el-input v-model="filters.name" placeholder="书名"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" v-on:click="getOneBook">查询</el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="showAddDialog">新增</el-button>
          </el-form-item>
        </el-form>
      </el-col>

      <!--列表-->
      <el-table :data="books" highlight-current-row v-loading="listLoading" @selection-change="selsChange"
                style="width: 100%;">
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column type="index" width="60"></el-table-column>
        <el-table-column type="expand">
          <template scope="props">
            <el-form label-position="left" inline class="demo-table-expand">
              <el-form-item label="[图书简介]">
                <span>{{ props.row.description }}</span>
              </el-form-item>
            </el-form>
          </template>
        </el-table-column>
        <el-table-column prop="name" label="书名" sortable></el-table-column>
        <el-table-column prop="author" label="作者" width="200" sortable></el-table-column>
        <el-table-column prop="date" label="出版日期" width="150" sortable></el-table-column>
        <el-table-column label="操作" width="150">
          <template scope="scope">
            <el-button size="small" @click="showEditDialog(scope.$index,scope.row)">编辑</el-button>
            <el-button type="danger" @click="delBook(scope.$index,scope.row)" size="small">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!--工具条-->
      <el-col :span="24" class="toolbar">
        <el-button type="danger" @click="batchDeleteBook" :disabled="this.sels.length===0">批量删除</el-button>
        <el-pagination layout="total, sizes, prev, pager, next, jumper" @current-change="handleCurrentChange" :page-size="lines" :total="total"
                       @size-change="handleSizeChange" :current-page.sync="currentPage" :page-sizes="[10, 20, 30, 40]" style="float:right;">
        </el-pagination>
      </el-col>

      <el-dialog title="编辑" v-model="editFormVisible" :close-on-click-modal="false">
        <el-form :model="editForm" label-width="100px" :rules="editFormRules" ref="editForm">
          <el-form-item label="书名" prop="name">
            <el-input v-model="editForm.name" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="作者" prop="author">
            <el-input v-model="editForm.author" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="出版日期">
            <el-date-picker type="date" placeholder="选择日期" v-model="editForm.date"></el-date-picker>
          </el-form-item>
          <el-form-item label="简介" prop="description">
            <el-input type="textarea" v-model="editForm.description" :rows="8"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click.native="editFormVisible = false">取消</el-button>
          <el-button type="primary" @click.native="editSubmit" :loading="editLoading">提交</el-button>
        </div>
      </el-dialog>

      <!--新增界面-->
      <el-dialog title="新增" v-model="addFormVisible" :close-on-click-modal="false">
        <el-form :model="addForm" label-width="80px" :rules="addFormRules" ref="addForm">
          <el-form-item label="书名" prop="name">
            <el-input v-model="addForm.name" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="作者" prop="author">
            <el-input v-model="addForm.author" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="出版日期">
            <el-date-picker type="date" placeholder="选择日期" v-model="addForm.date"></el-date-picker>
          </el-form-item>
          <el-form-item label="简介" prop="description">
            <el-input type="textarea" v-model="addForm.description" :rows="8"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click.native="addFormVisible = false">取消</el-button>
          <el-button type="primary" @click.native="addSubmit" :loading="addLoading">提交</el-button>
        </div>
      </el-dialog>

    </el-col>
  </el-row>
</template>
<script>
  import util from '../../common/util'
  export default{
    data () {
      return {
        filters: {
          name: ''
        },
        books: [],
        total: 0,
        page: 1,
        currentPage: 1,
        lines: 10,
        listLoading: false,
        apiUrl: 'http://127.0.0.1:8000/myapp/get_booklist/',
        sels: [],  // 列表选中列

        // 编辑相关数据
        editFormVisible: false, // 编辑界面是否显示
        editLoading: false,
        editFormRules: {
          name: [
            {required: true, message: '请输入书名', trigger: 'blur'}
          ],
          author: [
            {required: true, message: '请输入作者', trigger: 'blur'}
          ],
          description: [
            {required: true, message: '请输入简介', trigger: 'blur'}
          ]
        },
        editForm: {
          id: 0,
          name: '',
          author: '',
          date: '',
          description: ''
        },

        // 新增相关数据
        addFormVisible: false, // 新增界面是否显示
        addLoading: false,
        addFormRules: {
          name: [
            {required: true, message: '请输入书名', trigger: 'blur'}
          ],
          author: [
            {required: true, message: '请输入作者', trigger: 'blur'}
          ],
          description: [
            {required: true, message: '请输入简介', trigger: 'blur'}
          ]
        },
        addForm: {
          name: '',
          author: '',
          date: '',
          description: ''
        }
      }
    },
    mounted () {
      this.getBooksList()
    },
    methods: {
      handleCurrentChange (val) {
        this.page = val
        this.getBooksList()
      },
      handleSizeChange (val) {
        this.lines = val
        console.log(this.lines)
        this.getBooksList()
      },
      getBooksList () {
        this.listLoading = true
        let para = { page: this.page, lines: this.lines }
        this.$http.post(this.apiUrl, para)
          .then((response) => {
            this.books = response.data.data
            this.listLoading = false
            this.total = response.data.total
            console.log(response.data.total)
          }).catch(function (response) {
            console.log(response.data.total)
          })
      },
      getOneBook () {
        let para = {
          name: this.filters.name
        }
        this.listLoading = true
        this.$http.post(this.apiUrl, para)
          .then((response) => {
            this.books = response.data.data
            this.total = response.data.total
            this.listLoading = false
          })
      },
      selsChange: function (sels) {
        this.sels = sels
      },
      delBook: function (index, row) {
        console.log(index)
        console.log(row.name)
        this.$confirm('确认删除该记录吗?', '提示', {type: 'warning'}).then(() => {
          this.listLoading = true
          let para = {name: row.name}
          this.$http.post('http://127.0.0.1:8000/myapp/delete_book_api/', para)
            .then((response) => {
              this.listLoading = false
              console.log(response.data)
              this.$message({
                message: '删除成功',
                type: 'success'
              })
              this.getBooksList()
            })
        })
      },
      showEditDialog: function (index, row) {
        this.editFormVisible = true
        this.editForm = Object.assign({}, row)
        console.log(this.editForm)
      },
      editSubmit: function () {
        this.$refs.editForm.validate((valid) => {
          if (valid) {
            this.$confirm('确认提交吗？', '提示', {}).then(() => {
              this.editLoading = true
              let para = Object.assign({}, this.editForm)
              para.date = (!para.date || para.date === '') ? '' : util.formatDate.format(new Date(para.date), 'yyyy-MM-dd')
              this.$http.post('http://127.0.0.1:8000/myapp/edit_book_api/', para)
                .then((response) => {
                  this.editLoading = false
                  this.editFormVisible = false
                  console.log(response.data)
                  this.$message({
                    message: '提交成功',
                    type: 'success'
                  })
                  this.getBooksList()
                })
            })
          }
        })
      },
      showAddDialog: function () {
        this.addFormVisible = true
        this.addForm = {
          name: '',
          author: '',
          date: '',
          description: ''
        }
      },
      addSubmit: function () {
        this.$refs.addForm.validate((valid) => {
          if (valid) {
            this.addLoading = true
            let para = Object.assign({}, this.addForm)
            para.date = (!para.date || para.date === '') ? '' : util.formatDate.format(new Date(para.date), 'yyyy-MM-dd')
            this.$http.post('http://127.0.0.1:8000/myapp/add_book_api/', para)
              .then((response) => {
                this.addLoading = false
                this.addFormVisible = false
                console.log(response.data)
                this.$message({
                  message: '提交成功',
                  type: 'success'
                })
                this.getBooksList()
              })
          }
        })
      },
      batchDeleteBook: function () {
        var names = this.sels.map(item => item.name).toString()
        this.$confirm('确认删除选中记录吗？', '提示', {
          type: 'warning'
        }).then(() => {
          this.listLoading = true
          let para = {names: names}
          console.log(para)
          this.$http.post('http://127.0.0.1:8000/myapp/delete_book_api/', para)
            .then((response) => {
              this.listLoading = false
              this.$message({
                message: '删除成功',
                type: 'success'
              })
              this.getBooksList()
            })
        }).catch(() => {
        })
      }
    }
  }
</script>

<style>
  .demo-table-expand label {
    font-weight: bold;
  }
</style>
