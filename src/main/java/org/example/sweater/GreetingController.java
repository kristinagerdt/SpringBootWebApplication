package org.example.sweater;

import org.example.sweater.domain.Message;
import org.example.sweater.repositories.MessageRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class GreetingController {
    private MessageRepository messageRepository;

    public GreetingController(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "userName", required = false, defaultValue = "World")
                                   String userName, Map<String, String> model) {
        model.put("userName", userName);
        return "greeting";
    }

    @GetMapping //("/")
    public String main(Map<String, Object> model) {
        model.put("welcome", "Welcome to my beautiful page!");
        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping("add")
    public String add(@RequestParam String text, @RequestParam String tag, Map<String, Object> model) {
        Message message = new Message(text, tag);
        messageRepository.save(message);
        return main(model);
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String, Object> model) {
        model.put("welcome", "Welcome to my beautiful page!");
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) messages = messageRepository.findByTag(filter);
        else messages = messageRepository.findAll();
        model.put("messages", messages);
        return "main";
    }
}