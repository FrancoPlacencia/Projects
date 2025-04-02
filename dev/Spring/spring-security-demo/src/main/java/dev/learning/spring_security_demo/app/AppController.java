package dev.learning.spring_security_demo.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api")
public class AppController {
    @GetMapping("hello")
    public String hello() {
        return "hello";
    }
}
