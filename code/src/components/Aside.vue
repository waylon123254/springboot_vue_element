<template>
    <el-menu
        style="min-height: 100%; overflow-x: hidden;transition: width 0.3s;"
        :default-openeds="['1','3']"
        default-active="2"
        class="el-menu-vertical-demo"
        :width="isCollapse ? '64px' : '200px'" 
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
        :collapse-transition="false"
         :collapse="isCollapse"
      >   
<!-- :collapse-transition="false" 是关闭折叠时的动画，要不然折叠时字是一个个消失的。
:collapse属性是“是否水平折叠收起菜单”，下面默认数据为false。 -->
         <!-- @open="handleOpen"
        @close="handleClose" -->
        <div style="height:100px; line-height:100px; text-align;center">
          <b> 后台管理系统 </b>
        </div>

        <el-submenu index="1">
          <template slot="title"><i class="el-icon-location"></i>
           <span> 首页</span>
          </template >
            <el-menu-item-group>
            <template slot="title">分组一</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
          </el-menu-item-group>
          <el-menu-item-group title="分组2">
            <el-menu-item index="2-3">选项3</el-menu-item>
          </el-menu-item-group> 
        </el-submenu>
        <el-submenu index="2">
     
          <template slot="title"><i class="el-icon-message"></i>
         <span>   用户管理</span>
          </template >
          <el-menu-item-group>
            <template slot="title">分组一</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
          </el-menu-item-group>
          <el-menu-item-group title="分组2">
            <el-menu-item index="2-3">选项3</el-menu-item>
          </el-menu-item-group>
          <el-submenu index="2-4">
            <template slot="title">选项4</template>
            <el-menu-item index="1-4-1">选项4-1</el-menu-item>
          </el-submenu>
        </el-submenu>
        <el-submenu index="3">
          <template slot="title"><i class="el-icon-menu"></i>
            <span>权限管理
            </span>
            </template>
          <el-menu-item-group>
            <template slot="title">分组一</template>
            <el-menu-item index="3-1">选项1</el-menu-item>
            <el-menu-item index="3-2">选项2</el-menu-item>
          </el-menu-item-group>
          <el-menu-item-group title="分组2">
            <el-menu-item index="3-3">选项3</el-menu-item>
          </el-menu-item-group>
          <el-submenu index="3-4">
            <template slot="title">选项4</template>
            <el-menu-item index="3-4-1">选项4-1</el-menu-item>
          </el-submenu>
        </el-submenu>
        <el-submenu index="4">
          <template slot="title"
            ><i class="el-icon-setting"></i>数据管理</template
          >
          <el-menu-item-group>
            <template slot="title">分组一</template>
            <el-menu-item index="4-1">选项1</el-menu-item>
            <el-menu-item index="4-2">选项2</el-menu-item>
          </el-menu-item-group>
          <el-menu-item-group title="分组2">
            <el-menu-item index="4-3">选项3</el-menu-item>
          </el-menu-item-group>
          <el-submenu index="4-4">
            <template slot="title">选项4</template>
            <el-menu-item index="4-4-1">选项4-1</el-menu-item>
          </el-submenu>
        </el-submenu>
      </el-menu>
</template>
<script>
export default {
  name: "Aside",
  data() {
    return {
      isCollapse: false
    };
  }
};
</script>
