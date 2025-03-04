package com.example.movieticket.service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.showtimeRepo;
import com.example.movieticket.entity.MovieEntity;
import com.example.movieticket.entity.ShowTimeEntity;
import com.example.movieticket.entity.TheatreEntity;


@Service
public class showtimeService {
	
	@Autowired
	private showtimeRepo sr;
	
//    public Optional<ShowtimeEntity> findById(int showtimeId) {
//        return sr.findById(showtimeId);
//    }
    
    public ShowTimeEntity findById(int showtimeId) {
        return sr.findById(showtimeId);
    }
	
	public List<TheatreEntity> findTheatresByMovies(MovieEntity m) {
		List<ShowTimeEntity> showtimes = sr.findByMovie(m);
		Set<TheatreEntity> theatreSet = new HashSet<>();
		
		for (ShowTimeEntity s : showtimes) {
			theatreSet.add(s.getTheatre());
		}
		
		List<TheatreEntity> theatreList = new ArrayList<>(theatreSet);
		return theatreList;
	}
	
	public List<ShowTimeEntity> findStartDateAndStartTimeByMovie(MovieEntity m) {
		return sr.findStartDateAndStartTimeByMovie(m);
	}
	
	public ShowTimeEntity findByStartDateAndStartTime(Date date, LocalTime time, int id) {
		return sr.findByStartDateAndStartTimeAndTheatreId(date, time, id);
	}
	
	public List<ShowTimeEntity> findByTheatreId(int t) {
		return sr.findByTheatreId(t);
	}
	
//    @Transactional
//    @Scheduled(fixedRate = 60000)
//    public void updateShowStatus() throws ParseException {
//    	Date today = new Date();
// 
//        List<ShowtimeEntity> endedShowdates = sr.findByEndDateBefore(today);
//
//        for (ShowtimeEntity show : endedShowdates) {
//            sr.markShowsAsNotActive(show.getShowTimeId());
//        }
//        
//        System.out.println("Updated Show Status");
//    }
}