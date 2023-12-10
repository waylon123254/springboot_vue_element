package com.example.spring_hello.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController //注解告诉Spring将结果字符串直接呈现给调用者
public class HelloController {
    @RequestMapping("/hi")  //路径映射
    public String hello() {
        return "Hello Spring Boot!";
    }
}
