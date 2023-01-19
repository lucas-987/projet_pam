package com.example.ShareWood.service;

import com.example.ShareWood.entities.User;

import java.util.List;

public interface IUserService {
    public List<User> getAllUsers();
    public User getUserById(Long id);
    public User addUser(User user);


}
