package com.example.movieticket.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.movieticket.entity.UserEntity;
import com.example.movieticket.service.UserService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/movieapp")
public class SignupController {
	
	@Autowired
	UserService us;

	@GetMapping("/signup")
	public String viewSignup() {
		return "signup";
	}
	
	@PostMapping("/create-account")
	public void createUser(@RequestParam String name, @RequestParam String phone, @RequestParam String email, @RequestParam String password, HttpServletResponse res) throws IOException {
		
		UserEntity done = us.saveUser(new UserEntity(name, phone, email, password));
		
		if(done != null) {
			res.sendRedirect("/movieapp/login");
		}
		else {
			res.sendRedirect("/movieapp/signup");
		}
	}
	
}