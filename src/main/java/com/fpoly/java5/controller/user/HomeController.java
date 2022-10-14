package com.fpoly.java5.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping
    public String index(){
        return "home/index";
    }
    @RequestMapping("/about")
    public String about() {
        return "about/index";
    }

}