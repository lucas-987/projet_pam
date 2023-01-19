package com.example.ShareWood.controller;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.service.IEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/event")

public class EventController {
    @Autowired
    private  IEventService eventService ;
    @GetMapping
    public List<Event> getAllEvaluations(){
        return this.eventService.getAllEvent();
    }
}
