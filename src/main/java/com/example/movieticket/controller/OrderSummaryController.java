package com.example.movieticket.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.movieticket.Repository.SeatRepo;
import com.example.movieticket.entity.ShowTimeEntity;
import com.example.movieticket.entity.UserEntity;
import com.example.movieticket.service.showtimeService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/movieapp")
public class OrderSummaryController {

    @Autowired
    private showtimeService ss;
    
    @Autowired
    private SeatRepo sr;

    @GetMapping("/order-summary/{selectedSeats}/{theatreId}/{showtimeId}")
    public String viewOrderSummary(@PathVariable("selectedSeats") String selectedSeats, @PathVariable("theatreId") int theatreId, @PathVariable("showtimeId") int showtimeId, Model model, HttpSession s, HttpServletResponse response) {
        
        UserEntity user = (UserEntity) s.getAttribute("user");

        if (user == null) {
        	try {
				response.sendRedirect("/movieapp/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    	
    	List<String> seatList = Arrays.asList(selectedSeats.split(","));
    	
        for (String seatNumber : seatList) {
            sr.markSeatAsBooked(seatNumber, theatreId);
        }

        ShowTimeEntity show = ss.findById(showtimeId);
        if(show == null) {
        	System.out.println("Show not found");
        }
        
        s.setAttribute("showtimeId", show);
        
        int seatPrice = 200;
        int totalPrice = seatList.size() * seatPrice;
        
        model.addAttribute("selectedSeats", seatList);
        model.addAttribute("movie", show.getMovie().getTitle());
        model.addAttribute("theatre", show.getTheatre().getName());
        model.addAttribute("screen", show.getScreenNumber());
        model.addAttribute("showdate", show.getStartDate());
        model.addAttribute("showtime", show.getStartTime());
        model.addAttribute("totalPrice", totalPrice);
        
        return "orderSummary";
    }
}