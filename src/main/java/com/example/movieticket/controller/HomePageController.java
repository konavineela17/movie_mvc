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
import com.example.movieticket.service.TheatreService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/movieapp")
public class HomePageController {
	
	@Autowired
    private MovieService movieService;
	
	@Autowired
    private TheatreService theatreService;
    
    @GetMapping("/home")
    public String home(Model model, HttpSession session, HttpServletResponse response) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
        	try {
				response.sendRedirect("/movieapp/login");
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
    	
    	    
    	List<MovieEntity> movieList = movieService.getMovies();
    	model.addAttribute("movieList", movieList);
        return "homepage";
    }
    
    @GetMapping("/search/{movie}")
    public String search(@PathVariable String movie,  Model model, HttpSession session, HttpServletResponse response) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
        	try {
				response.sendRedirect("/movieapp/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    	
    	List<MovieEntity> movieList = movieService.searchMovies(movie);
    	model.addAttribute("movieList", movieList);
        return "homepage";
    }
    
    @GetMapping("/search-theatre/{theatre}")
    public String searchTheare(@PathVariable String theatre,  Model m, HttpSession session, HttpServletResponse response) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
        	try {
				response.sendRedirect("/movieapp/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    	
    	List<TheatreEntity> theatreList = theatreService.searchTheatre(theatre);
    	m.addAttribute("theatreList", theatreList);
        return "homepage";
    }
}