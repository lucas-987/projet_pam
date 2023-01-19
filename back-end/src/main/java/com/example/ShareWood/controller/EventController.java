package com.example.ShareWood.controller;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.service.IEventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/event")

public class EventController {
    @Autowired
    private  IEventService eventService ;
    @GetMapping
    public List<Event> getAllEvent(){
        return this.eventService.getAllEvent();
    }

    @GetMapping
    public List<Event> getAllEventByLocation(Model model){
        return this.eventService.getAllEventByLocation((String) model.getAttribute("location"));
    }

    @PostMapping(value = "addevent")
    public String addEvent(@RequestParam(name = "name", required = true)String name,
                           @RequestParam(name = "description", required = true)String description,
                           @RequestParam(name = "start_date", required = true) String start_date,
                           @RequestParam(name = "fin_date", required = true) String end_date,
                           @RequestParam(name = "location", required = true)String location,
                           Model model) {
        if(name == null || description == null || start_date == null || end_date == null || location == null){
            System.out.println("Error");
            return "";
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date_debut = null;
        Date date_fin = null;
        try {
            date_debut = formatter.parse(start_date);
            date_fin = formatter.parse(end_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        eventService.addEvent(name, description, date_debut, date_fin, location);
        model.addAttribute("avname", name);
        model.addAttribute("avdescription", description);
        model.addAttribute("avstartdate", date_debut);
        model.addAttribute("avenddate", date_fin);
        model.addAttribute("avlocation", location);
        return "";
    }

    @RequestMapping(value = "joinevent", method = RequestMethod.GET)
    public String joinEvent(Model model) {
        List<Event> evenements = eventService.getAllEventByUser((int)model.getAttribute("user_id"));
        model.addAttribute("evenements",evenements);
        return "";
    }

    @PostMapping(value = "joinevent")
    public String joinEvent(@RequestParam(name = "sevenement", required = false) long idevent,
                            Model model) {

        Event event = eventService.addParticipantToEvent(idevent, (long)model.getAttribute("user_id"));
        eventService.updateEvent(event.getId(), event);
        return "";
    }
}
