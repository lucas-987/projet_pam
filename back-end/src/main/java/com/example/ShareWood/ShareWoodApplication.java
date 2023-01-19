package com.example.ShareWood;

import com.example.ShareWood.entities.Role;
import com.example.ShareWood.entities.User;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;

@SpringBootApplication
public class ShareWoodApplication implements ApplicationRunner {

	public static void main(String[] args) {
		SpringApplication.run(ShareWoodApplication.class, args);
	}


	@Override
	public void run(ApplicationArguments args) throws Exception {
		User user1 = new User(null, "user1", "user1@user1.user1", "1234",
					"Besançon", Role.USER, new ArrayList<>(), new ArrayList<>());
	}
}
