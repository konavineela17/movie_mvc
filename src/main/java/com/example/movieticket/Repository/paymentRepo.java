package com.example.movieticket.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.movieticket.entity.paymentEntity;



@Repository
public interface paymentRepo extends JpaRepository<paymentEntity, Integer>{

}