package com.example.movieticket.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.movieticket.entity.MovieEntity;
import com.example.movieticket.entity.TheatreEntity;
import com.example.movieticket.entity.UserEntity;
import com.example.movieticket.service.MovieService;
import com.example.movieticket.service.showtimeService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/movieapp")
public class MovieInfoController {

	@Autowired
	private MovieService ms;
	
	@Autowired
	private showtimeService ss;

	
	@GetMapping("/movie-info/{movieId}")
	public String showMovieInfo(@PathVariable int movieId, Model model, HttpSession session, HttpServletResponse response) {
	    UserEntity user = (UserEntity) session.getAttribute("user");
	    
	    if (user == null) {
	    	try {
				response.sendRedirect("/movieapp/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		
		MovieEntity movieInfo = ms.getMovieById(movieId);
		List<TheatreEntity> theatreList = ss.findTheatresByMovies(movieInfo);
		model.addAttribute("selectedMovie", movieInfo);
		model.addAttribute("theatreList", theatreList);
		
		return "movieInfo";
	}
}