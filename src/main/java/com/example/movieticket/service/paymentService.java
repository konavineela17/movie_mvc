package com.example.movieticket.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.paymentRepo;
import com.example.movieticket.entity.paymentEntity;



@Service
public class paymentService {
	
    @Autowired
    private paymentRepo paymentRepository;

    public paymentEntity processPayment(int userId, double amount) {

        paymentEntity payment = new paymentEntity();
        payment.setUserId(userId);
        payment.setAmount(amount);
        payment.setStatus("Completed");
        payment.setCreatedAt(new Date());

        paymentEntity savedPayment = paymentRepository.save(payment);
        
        return savedPayment;
    }

}