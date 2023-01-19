package com.example.ShareWood;

import com.example.ShareWood.entities.Event;
import com.example.ShareWood.entities.Role;
import com.example.ShareWood.entities.User;
import com.example.ShareWood.service.IEventService;
import com.example.ShareWood.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

import java.util.ArrayList;
import java.util.Date;

@SpringBootApplication
@RequiredArgsConstructor
public class ShareWoodApplication implements ApplicationRunner {

	private final IUserService userService;

	public static void main(String[] args) {
		SpringApplication.run(ShareWoodApplication.class, args);
	}


	@Override
	public void run(ApplicationArguments args) throws Exception {
		User user1 = new User(null, "user1", "user1@user1.user1", "1234",
					"Besançon", Role.USER, new ArrayList<>(), new ArrayList<>());

		Event event1 = new Event("Event1", "Event1", new Date(), new Date(), "perou");
		event1.setCreator(user1);
		userService.addUser(user1);

	}
}
