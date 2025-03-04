package com.example.movieticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.UserRepo;
import com.example.movieticket.entity.UserEntity;



@Service
public class AuthService {
	
	@Autowired
	private UserRepo us;
	
	public UserEntity authenticate(String phone, String password) {
		
		UserEntity currentUser = us.findByPhoneNumberAndPassword(phone, password);
		
		return currentUser;
	}
}