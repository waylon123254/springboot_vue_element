<template>
  <!--  <el-container>：定义一个容器，设置高度为100%。-->
  <el-container style="min-height: 100vh">
    <!--    <el-aside>：定义侧边栏，设置宽度为200px，背景颜色为rgb(238, 241, 246)，高度为100% 这样就可以给侧边栏添加一个水平偏移为 2px，模糊半径为 6px，扩散半径为 0，并且颜色采用 RGBA 格式表示半透明效果的阴影-->
    <el-aside :width="sideWidth + 'px'" style="background-color: rgb(238, 241, 246); box-shadow: 2px 0 6px rgba(0, 21, 41, 0.35);">
      <Aside :isCollapse="isCollapse" :LogoTextShow="LogoTextShow" /> </el-aside>
    <el-container>
      <el-header style="border-bottom: 1px solid #ccc;">
        <Header :collapseBtnClass="collapseBtnClass" :collapse="true" /> </el-header>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>
<script>
import Aside from "@/components/Aside.vue";
import Header from "@/components/Header.vue";
export default {
  data() {
      return {
        tableData: [],
        total: 0,
        pageNum: 1,
        pageSize: 5,
        email: "",
        address: "",
        username: "",
        dialogFormVisible: false,
        form: {},
        multipleSelection: [],
        collapseBtnClass: "el-icon-s-fold",
        isCollapse: false, // 是否收缩
        sideWidth: 200, // 侧边栏宽度
        LogoTextShow: true
          // currentPathName: "" // 在data中定义currentPathName属性并给定初始值
      };
    },
    created() {
      // 请求分页查询数据
      this.load();
    },
    components: {
      Aside,
      Header
    },
    methods: {
      collapse() {
          this.isCollapse = !this.isCollapse;
          if(this.isCollapse) {
            this.sideWidth = 50;
            this.collapseBtnClass = "el-icon-s-unfold";
            this.LogoTextShow = false;
          } else {
            this.sideWidth = 200;
            this.collapseBtnClass = "el-icon-s-fold";
            this.LogoTextShow = true;
          }
        },
        load() {
          const params = {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            username: this.username,
            email: this.email,
            address: this.address
          };
          this.request.post("/user/page?pageNum=" + this.pageNum + "&pageSize=" + this.pageSize + "&username=" + this.username).then(res => {
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
          }).then(() => {
            request.delete("/user/" + id).then(res => {
              if(res) {
                this.$message.success("删除成功");
                this.load();
              } else {
                this.$message.console.error("删除失败");
              }
            });
          }).catch(() => {
            // 用户取消删除操作
          });
        },
        Save() {
          // 在开始处添加深拷贝
          // this.form = JSON.parse(JSON.stringify(row));
          request.post("/user/insert", this.form).then(res => {
            if(res) {
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
          }).then(() => {
            request.delete("user/Delete/Deletebatch/" + ids).then(res => {
              if(res) {
                this.$message.success("删除成功");
                this.load();
              } else {
                this.$message.console.error("删除失败");
              }
            });
          }).catch(() => {
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