<template>
<div>

        <div style="display: flex; flex-direction: column; align-items: center;">
  <div style="padding: 5px 0;display: flex; justify-content: center;">
    <el-input style="width:200px" suffix-icon="el-icon-search" placeholder="请输入名称" class="ml-5" v-model="username"></el-input>
    <el-input style="width:200px" suffix-icon="el-icon-message" placeholder="请输入邮箱" class="ml-5" v-model="email"></el-input>
    <el-input style="width:200px" suffix-icon="el-icon-position" placeholder="请输入地址" class="ml-5" v-model="address"></el-input>
   <!--  <el-input style="width:200px" suffix-icon="el-icon-message" placeholder="请输入昵称" class="ml-5"></el-input>
    <el-input style="width:200px" suffix-icon="el-icon-position" placeholder="请输入电话" class="ml-5"></el-input> -->
    <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
    <el-button class="ml-5" type="warning" @click="reset">重置</el-button>
  </div>

  <div style="padding: 15px 0;display: flex; justify-content: center;">
    <el-button type="primary" @click="handleAdd">新增<i class="el-icon-circle-plus-outline"></i></el-button>
    <el-button type="danger" @click="DeleteBatch">删除<i class="el-icon-remove-outline"></i></el-button>
    <el-button type="success">导入<i class="el-icon-top"></i></el-button>
    <el-button type="info">导出<i class="el-icon-bottom"></i></el-button>
  </div>
</div>

        <el-table :data="tableData" border header-cell-class-name="headerBag" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55">
    </el-table-column>
          <el-table-column prop="id" label="编号" width="120">
          </el-table-column>
        <el-table-column prop="username" label="用户名" width="120">
          </el-table-column>
          <el-table-column prop="nickname" label="姓名" width="120">
          </el-table-column>
          <el-table-column prop="password" label="密码" width="120">
          </el-table-column>
          <el-table-column prop="address" label="地址">
          </el-table-column>
          <el-table-column prop="email" label="邮箱">
          </el-table-column>
          <el-table-column prop="phone" label="电话">
          </el-table-column>
          <el-table-column label="操作">
            <template v-slot:default="scope" >
              <el-popconfirm
                  confirm-button-text='确定删除'
                  cancel-button-text='取消删除'
                  icon="el-icon-info"
                  icon-color="red"
                  title="确定删除吗？"
                 @confirm="DeleteEdit(scope.row.id)"
                 class="ml-5"
>
              <el-button type="danger" @click="DeleteEdit(scope.row.id)" slot="reference">删除<i class="el-icon-remove-outline">  </i>
              </el-button>
            </el-popconfirm>
              <el-button type="warning" @click="handleEdit(scope.row)" @row-click="handleRowClick">修改<i class="el-icon-edit"></i>
              </el-button>  
            </template>
          </el-table-column>
        </el-table>
        <div style="padding: 50px 0; margin-left: auto; margin-right: auto;">
          <el-pagination
              :current-page="pageNum"
              :page-sizes="[1, 5, 10, 15]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
          >
          </el-pagination>
        </div>

<!-- Form -->

<el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%" size="small">
  <el-form label-width="80px" >
    <el-form-item label="用户名" >
      <el-input v-model="form.username" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="昵称" >
      <el-input v-model="form.nickname" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="邮箱" >
      <el-input v-model="form.email" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="电话" >
      <el-input v-model="form.phone" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="地址" >
      <el-input v-model="form.address" autocomplete="off"></el-input>
    </el-form-item>

  </el-form>
  <div slot="footer" class="dialog-footer">
    <el-button @click="Cancel">取 消</el-button>
    <el-button type="primary" @click="Save">确 定</el-button>
  </div>
</el-dialog>
</div>

</template>
<script>
import Aside from "@/components/Aside.vue";
import Header from "@/components/Header.vue";
export default {
  name: "User",
  components: {
    Aside,
    Header
  },
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 5,
      email: "",
      address: "",
      username: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: []
    };
  },
  created() {
    // 请求分页查询数据
    this.load();
  },
  methods: {
    load() {
      const params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        username: this.username,
        email: this.email,
        address: this.address
      };

      this.request
        .post(
          "/user/page?pageNum=" +
            this.pageNum +
            "&pageSize=" +
            this.pageSize +
            "&username=" +
            this.username
        )
        .then(res => {
          console.log(res);
          this.tableData = res.records;
          this.total = res.total;
        });
    },
    handleRowClick(row) {
      // 深拷贝当前行数据
      this.form = JSON.parse(JSON.stringify(row));
      // 显示弹出框
      this.dialogFormVisible = true;
    },
    Cancel() {
      // 取消操作
      this.dialogFormVisible = false;
      this.load();
    },
    DeleteEdit(id) {
      this.$confirm("确定删除吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          request.delete("/user/" + id).then(res => {
            if (res) {
              this.$message.success("删除成功");
              this.load();
            } else {
              this.$message.console.error("删除失败");
            }
          });
        })
        .catch(() => {
          // 用户取消删除操作
        });
    },
    Save() {
      // 在开始处添加深拷贝
      // this.form = JSON.parse(JSON.stringify(row));
      request.post("/user/insert", this.form).then(res => {
        if (res) {
          this.$message.success("保存成功");
          this.dialogFormVisible = false;
          this.load();
        } else {
          this.$message.console.error("保存失败");
        }
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(val);
    },
    DeleteBatch() {
      let ids = this.multipleSelection.map(v => v.ids);
      this.$confirm("确定删除吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          request.delete("user/Delete/Deletebatch/" + ids).then(res => {
            if (res) {
              this.$message.success("删除成功");
              this.load();
            } else {
              this.$message.console.error("删除失败");
            }
          });
        })
        .catch(() => {
          // 用户取消删除操作
        });
    },
    handleAdd() {
      this.dialogFormVisible = true;
      this.form = {};
    },
    reset() {
      this.username = "";
      this.email = "";
      this.address = "";
      this.load();
    },
    handleEdit(row) {
      this.form = row;
      this.dialogFormVisible = true;
      this.load();
    },
    handleSizeChange(pageSize) {
      console.log(pageSize);
      this.pageSize = pageSize;
      this.load();
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum);
      this.pageNum = pageNum;
      this.load();
    }
  }
};
</script>