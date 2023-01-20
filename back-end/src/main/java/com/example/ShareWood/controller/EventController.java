package com.example.ShareWood.controller;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.entities.Role;
import com.example.ShareWood.entities.User;
import com.example.ShareWood.service.IEventService;
import com.example.ShareWood.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/event")

public class EventController {
    @Autowired
    private  IEventService eventService ;
    @Autowired
    private IUserService userService;

    @GetMapping
    public List<Event> getAllEvent(){
        return this.eventService.getAllEvent();
    }

    @GetMapping("/{id}")
    public Event getById(@PathVariable Long id) {
        return eventService.getEventById(id);
    }

    @GetMapping("/location/{location}")
    public List<Event> getAllEventByLocation(String location){
        return this.eventService.getAllEventByLocation(location);
    }

    @PostMapping()
    public Event addEvent(Principal principal, @RequestBody Event event) {

        User creator = userService.getUserByUsername(principal.getName());
        if(creator == null) {
            throw new RuntimeException();
        }

        return eventService.addEvent(event, creator);
    }

    @PutMapping("/{id}/like")
    public Event likeEvent(@PathVariable Long id) {
        Event event = eventService.getEventById(id);
        event.setScore(event.getScore() + 1);
        return eventService.updateEvent(id, event);
    }
    @PutMapping("/{id}/unlike")
    public Event unlikeEvent(@PathVariable Long id) {
        Event event = eventService.getEventById(id);
        event.setScore(event.getScore() -1);
        return eventService.updateEvent(id, event);
    }

    @GetMapping("/{eventId}/joinevent")
    public void joinEvent(Principal principal, @PathVariable Long eventId) {
        User loggedUser = userService.getUserByUsername(principal.getName());
        if(loggedUser == null) throw new RuntimeException();
        eventService.addParticipantToEvent(loggedUser, eventId);
    }

    @DeleteMapping("/{id}")
    public void deleteEvent(Principal principal, @PathVariable Long id) {
        User loggedUser = userService.getUserByUsername(principal.getName());
        Event event = eventService.getEventById(id);
        User owner = event.getCreator();

        if(owner == null || loggedUser.getId().equals(owner.getId()) || loggedUser.getRole().equals(Role.ADMIN)) {
            eventService.deleteEvent(id);
        }
        else {
            throw new RuntimeException();
        }
    }
}
