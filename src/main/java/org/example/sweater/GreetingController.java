package org.example.sweater;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class GreetingController {
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "userName", required = false, defaultValue = "World")
                                   String userName, Map<String, String> model) {
        model.put("userName", userName);
        return "greeting";
    }

    @GetMapping("/")
    public String main(Map<String, Object> model) {
        model.put("welcome", "Welcome to my beautiful page!");
        return "main";
    }
}