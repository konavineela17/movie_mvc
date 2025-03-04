package com.example.movieticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.BookingRepo;
import com.example.movieticket.entity.BookingEntity;
import com.example.movieticket.entity.ShowTimeEntity;
import com.example.movieticket.entity.UserEntity;
import com.example.movieticket.entity.paymentEntity;


@Service
public class BookingService {
	
	@Autowired
	private BookingRepo br;

    public BookingEntity createBooking(UserEntity userId, ShowTimeEntity showtime, paymentEntity payment) {
    	
        BookingEntity booking = new BookingEntity();
        booking.setUser(userId);
        booking.setPayment(payment);
        booking.setShowtime(showtime);
        booking.setBookingDate(payment.getCreatedAt());
        booking.setTotalPrice(payment.getAmount());

        BookingEntity doneBooking = br.save(booking);
        
        return doneBooking;
    }
    
    public List<BookingEntity> getBookingHistoryByUserId(int userId){
    	
    	List<BookingEntity> bookingHistory = br.findByUserId(userId);
    	
		return bookingHistory;    	
    }
}