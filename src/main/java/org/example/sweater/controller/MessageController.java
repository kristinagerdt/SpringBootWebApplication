package org.example.sweater.controller;

import org.example.sweater.entities.Message;
import org.example.sweater.entities.User;
import org.example.sweater.repositories.MessageRepository;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MessageController {
    private MessageRepository messageRepository;

    public MessageController(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @GetMapping("/message")
    public String message(Map<String, Object> model) {
        model.put("welcome", "Welcome to my beautiful page!");
        Iterable<Message> messages = messageRepository.findAll();
        model.put("messages", messages);
        return "message";
    }

    @PostMapping("add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, @RequestParam String tag,
            Map<String, Object> model) {
        Message message = new Message(text, tag, user);
        messageRepository.save(message);
        return message(model);
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String, Object> model) {
        model.put("welcome", "Welcome to my beautiful page!");
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) messages = messageRepository.findByTag(filter);
        else messages = messageRepository.findAll();
        model.put("messages", messages);
        return "message";
    }
}