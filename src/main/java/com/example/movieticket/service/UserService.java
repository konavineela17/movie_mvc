package com.example.movieticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.UserRepo;
import com.example.movieticket.entity.UserEntity;


@Service
public class UserService {
	
	@Autowired
	UserRepo ur;
	
	public UserEntity saveUser(UserEntity user) {
		
		UserEntity createdUser = ur.save(user);
		
		return createdUser;
	}
	
	public UserEntity updateUser(int userId, String newEmail, String newPhone) {
	    UserEntity user = ur.findById(userId);
	    if (user != null) { 
	        user.setEmail(newEmail);
	        user.setPhoneNumber(newPhone);
	        return ur.save(user);
	    }
	    return null;
	}

	
}