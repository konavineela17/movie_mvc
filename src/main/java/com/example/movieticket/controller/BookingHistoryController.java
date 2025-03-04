package com.example.movieticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.movieticket.Repository.SeatRepo;
import com.example.movieticket.entity.BookingEntity;
import com.example.movieticket.service.BookingService;



@Controller
@RequestMapping("/movieapp")
public class BookingHistoryController {
	
	@Autowired
	private BookingService bs;
	
	@Autowired
	private SeatRepo sr;
	
    @GetMapping("/booking-history/{userId}")
    public String showBookingHistory(@PathVariable int userId, Model m) {
    	
    	List<BookingEntity> bookingList = bs.getBookingHistoryByUserId(userId);
//    	List<SeatEntity> seatList = sr.findBookedSeatsByUserId(userId);
    	
    	m.addAttribute("bookings", bookingList);
//        m.addAttribute("bookedSeats", seatList);
    	
        return "bookingHistory";
    }
}