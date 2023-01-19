package com.example.ShareWood.service;

import com.example.ShareWood.entities.Event;

import java.util.List;

public interface IEventService {
    public List<Event> getAllEventByLocation(String location);
    public List<Event> getAllEvent();
    public Event getEventById(Long id);
    public Event addEvent(Event event);
    public Event updateEvent(Long id,Event event);
    public void deleteEvent(Long id);
    public void addParticipantToEvent(Long idUser, Long idEvent);
}
