package com.example.ShareWood.controller;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.entities.User;
import com.example.ShareWood.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/user")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UserController {
    @Autowired
    IUserService userService;

    @GetMapping()
    public List<User> getALlUsers(){
        return userService.getAllUsers();
    }

    @GetMapping("/")
    public User getUserByName(@RequestParam(name = "name", required = true) String username) {
        return userService.getUserByUsername(username);
    }

    @GetMapping("/{id}")
    public User getUser(@PathVariable Long id){
        return userService.getUserById(id);
    }

    @GetMapping("/{id}/joined_events")
    public List<Event> getJoinedEvents(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return user.getSaved_events();
    }

    @GetMapping("/{id}/created_events")
    public List<Event> getCreatedEvents(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return user.getCreated_events();
    }

    @PostMapping()
    public User addAppUser(@RequestBody User user){
        return userService.addUser(user);
    }
}
