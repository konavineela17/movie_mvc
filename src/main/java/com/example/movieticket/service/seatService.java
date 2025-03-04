package com.example.movieticket.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.SeatRepo;
import com.example.movieticket.Repository.showtimeRepo;
import com.example.movieticket.entity.SeatEntity;
import com.example.movieticket.entity.ShowTimeEntity;

import jakarta.transaction.Transactional;

@Service
public class seatService {

	@Autowired
	private SeatRepo sr;
	
	@Autowired
	private showtimeRepo se;
	
//	public List<SeatEntity> findSeatsByShowtime(ShowtimeEntity showtime) {
//		return sr.findByShowtime(showtime);
//	}
	
	public List<SeatEntity> findByShowtimeAndIsBooked(ShowTimeEntity showtime,  String isBooked) {
		return sr.findByShowtimeAndIsBooked(showtime, isBooked);
	}
	
    @Transactional
    @Scheduled(fixedRate = 60000)
    public void updateSeatStatus() throws ParseException {
    	LocalTime now = LocalTime.now();
    	
        List<ShowTimeEntity> endedShowtimes = se.findByEndTimeBefore(now);

        for (ShowTimeEntity showtime : endedShowtimes) {
            sr.markSeatsAsNotBooked(showtime.getShowTimeId());
      
        }
        System.out.println("Updated Seat Status");
    }
    
}