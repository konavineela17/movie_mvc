package com.example.movieticket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.MovieRepo;
import com.example.movieticket.entity.MovieEntity;


@Service
public class MovieService {
    
	@Autowired
	MovieRepo mr;
	
	public List<MovieEntity> getMovies(){
		List<MovieEntity> movieList = mr.findAll();
		return movieList;
	}
	
    public MovieEntity getMovieById(int movieId) {
        for (MovieEntity movie : getMovies()) {
            if (movie.getId() == movieId) {
                return movie;
            }
        }
        return null;
    }
	
    public List<MovieEntity> searchMovies(String movieName) {
        List<MovieEntity> allMovies = getMovies();
        List<MovieEntity> searchedMovies = new ArrayList<>();;
        for(MovieEntity m : allMovies) {
        	if(m.getTitle().toLowerCase().contains(movieName.toLowerCase())) {
        		searchedMovies.add(m);
        	}
        }
		return searchedMovies;
    }
}