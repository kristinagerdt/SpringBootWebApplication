package org.example.sweater.controller;

import org.example.sweater.entities.Message;
import org.example.sweater.entities.User;
import org.example.sweater.repositories.MessageRepository;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
    private MessageRepository messageRepository;

    public MessageController(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @GetMapping("/message")
    public String message(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepository.findAll();
        if (filter != null && !filter.isEmpty()) messages = messageRepository.findByTag(filter);
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        model.addAttribute("welcome", "Welcome to my beautiful page!");
        return "message";
    }

    @PostMapping("add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, @RequestParam String tag,
            Model model) {
        Message message = new Message(text, tag, user);
        messageRepository.save(message);
        return message("", model);
    }
}