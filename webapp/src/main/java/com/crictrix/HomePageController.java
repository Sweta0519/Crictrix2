package com.crictrix;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin
public class HomePageController {
    @Value("${myapp.message}")
    private String message;

    @GetMapping("/hello")
    public String hello() {
        return message;
    }

}
