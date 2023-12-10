<template>
  <div style="font-size: 12px; line-height: 60px; display: flex; align-items: center;">
    <div style="flex: 1; font-size: 20px;">
      <span :class="collapseBtnClass" style="cursor: pointer; font-size:20px" @click="collapse"></span>
      <el-breadcrumb separator="/" style="display: inline-block; margin-left: 10px;">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>{{ currentPathName }}</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <el-dropdown style="width: 70px; cursor:pointer; margin-left: 10px;">
      <span>王小虎</span> 
      <i class="el-icon-arrow-down" style="margin-left: 5px"></i>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item>信息</el-dropdown-item>
        <el-dropdown-item>新增</el-dropdown-item>
        <el-dropdown-item>删除</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  name: "Header",
  props: {
    collapseBtnClass: String,
    collapse: Boolean,
    vModels: Boolean // 在data中定义vModels属性
  },
  data() {
    return {
      currentPathName: ""
    };
  },
  created() {
    this.currentPathName = localStorage.getItem("currentPathName");
  },
  watch: {
    $route: function() {
      this.currentPathName = localStorage.getItem("currentPathName");
    }
  }
};
</script>