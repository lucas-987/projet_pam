package com.example.ShareWood.controller;

import com.example.ShareWood.entities.User;
import com.example.ShareWood.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/{id}")
    public User getUser(@PathVariable Long id){
        return userService.getUserById(id);
    }

    @PostMapping()
    public User addAppUser(@RequestBody User user){
        return userService.addUser(user);
    }
}
