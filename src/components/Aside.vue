<template>
    <el-menu :default-openeds="['1', '3']"
     style="min-height: 100%;overflow-x:  hidden" background-color="rgb(48,65,86)" 
     text-color="#fff" active-text-color="#ffd04b" :collapse-transition="false" :collapse="isCollapse" class="el-menu-vertical"
    router @select="HandSelect"
     >
          <div style="height:60px; line-height:60px; text-align:center">
            <!-- //图片 -->
            <!-- <img src="" alt="" style="width: 20px; position: relative; top: 5px; margin-top: 5px;"> -->
            <b style="color:white;font-size:30px;
        font-family:STKaiti" v-show="LogoTextShow">管理系统</b>

          </div>

          <!-- <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-message"></i>
              <span slot="title">主页</span>
            </template>
            <el-menu-item-group>
              <template slot="title">分组一</template>
              <el-menu-item index="1-1">选项1</el-menu-item>
              <el-menu-item index="1-2">选项2</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group title="分组2">
              <el-menu-item index="1-3">选项3</el-menu-item>
            </el-menu-item-group>
            <el-submenu index="1-4">
              <template slot="title">选项4</template>
              <el-menu-item index="1-4-1">选项4-1</el-menu-item>
            </el-submenu>
          </el-submenu> -->
          <el-menu-item index="/home">
            <template slot="title">
           <i class="el-icon-house"></i>
           <span slot="title"> 主页</span>
              </template>
          </el-menu-item>
          <el-submenu index="2">
            <template slot="title">
              <i class="el-icon-menu"></i>
              <span slot="title">系统管理</span>
            </template>
            <el-menu-item index="/user">
           <i class="el-icons-custom"></i>
           <span slot="title"> 用户</span>
          </el-menu-item>
            <!-- <el-menu-item-group>
              <template slot="title">分组一</template>
              <el-menu-item index="2-1">选项1</el-menu-item>
              <el-menu-item index="2-2">选项2</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group title="分组2">
              <el-menu-item index="2-3">选项3</el-menu-item>
            </el-menu-item-group>
            <el-submenu index="2-4">
              <template slot="title">选项4</template>
              <el-menu-item index="2-4-1">选项4-1</el-menu-item>
            </el-submenu> -->
          </el-submenu>
          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-setting"></i>
              <span slot="title">导航三</span>
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
        </el-menu>
  </template>
  <script>
export default {
  name: "Aside",
  props: {
    isCollapse: Boolean,
    LogoTextShow: Boolean
  },
  methods: {
    HandSelect(index) {
      // console.log(this.$router);
      console.log(index);
      // console.log(this.$router.options.routes);
      alert.log(this.$route.name);
    }
  }
};
</script>
  
  