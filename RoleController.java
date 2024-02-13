package com.example.springboot.Controller;

import com.example.springboot.Service.IRoleService;
import com.example.springboot.entity.Role;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/role")
@Api(tags = "角色管理")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @PostMapping("/add")
    @ApiOperation("添加角色")
    public boolean addRole(@RequestBody Role role) {
        return roleService.save(role);
    }

    @PutMapping("/update")
    @ApiOperation("更新角色")
    public boolean updateRole(@RequestBody Role role) {
        return roleService.updateById(role);
    }

    @DeleteMapping("/{id}")
    @ApiOperation("删除角色")
    public boolean deleteRole(@PathVariable Integer id) {
        return roleService.removeById(id);
    }

    @GetMapping("/{id}")
    @ApiOperation("通过ID获取角色信息")
    public Role getRoleById(@PathVariable Integer id) {
        return roleService.getById(id);
    }

    @GetMapping("/list")
    @ApiOperation("获取角色列表")
    public List<Role> listRoles() {
        return roleService.list();
    }
}