package com.example.ShareWood.service;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.entities.User;

import java.util.Date;
import java.util.List;

public interface IEventService {
    public List<Event> getAllEventByLocation(String location);
    public List<Event> getAllEventByUser(int user);
    public List<Event> getAllEvent();
    public Event getEventById(Long id);
    public Event addEvent(Event event, User creator);
    public Event updateEvent(Long id,Event event);
    public void deleteEvent(Long id);
    public void addParticipantToEvent(User user, Long idEvent);
}
