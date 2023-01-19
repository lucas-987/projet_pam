package com.example.ShareWood.service;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.entities.User;
import com.example.ShareWood.repository.EventRepository;
import com.example.ShareWood.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class EventServiceImpl implements IEventService{
    @Autowired
    private EventRepository eventRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Event> getAllEventByLocation(String location) {
        return null;
    }

    @Override
    public Event getEventById(Long id) {
        return eventRepository.findById(id).orElseThrow(RuntimeException::new);
    }

    @Override
    public Event addEvent(Event event) {
        return eventRepository.save(event);
    }

    @Override
    public Event updateEvent(Long id, Event event) {
        eventRepository.findById(id).orElseThrow(RuntimeException::new);
        event.setId(id);
        return eventRepository.save(event);
    }

    @Override
    public void deleteEvent(Long id) {
        eventRepository.deleteById(id);
    }

    @Override
    public void addParticipantToEvent(Long idUser, Long idEvent) {
        User user = userRepository.findById(idUser).orElseThrow(RuntimeException::new);
        Event event = eventRepository.findById(idEvent).orElseThrow(RuntimeException::new);
        event.getParticipants().add(user);
    }
}