package com.example.ShareWood.service;

import com.example.ShareWood.entities.Event;

import java.util.Date;
import java.util.List;

public interface IEventService {
    public List<Event> getAllEventByLocation(String location);
    public List<Event> getAllEventByUser(int user);
    public List<Event> getAllEvent();
    public Event getEventById(Long id);
    public Event addEvent(String name, String description, Date date_debut, Date date_fin, String location);
    public Event updateEvent(Long id,Event event);
    public void deleteEvent(Long id);
    public Event addParticipantToEvent(Long idUser, Long idEvent);
}
