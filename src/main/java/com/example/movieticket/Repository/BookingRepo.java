package com.example.movieticket.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.movieticket.entity.BookingEntity;



@Repository
public interface BookingRepo extends JpaRepository<BookingEntity, Integer>{
	
	public List<BookingEntity> findByUserId(int userId);
	
}