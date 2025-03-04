package com.example.movieticket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.movieticket.Repository.TheatreRepo;
import com.example.movieticket.entity.TheatreEntity;



@Service
public class TheatreService {
	
	@Autowired
	TheatreRepo tr;

    public List<TheatreEntity> searchTheatre(String theatreName) {
        List<TheatreEntity> allTheatre = tr.findAll();
        
        List<TheatreEntity> searchedTheatrs = new ArrayList<>();;
        
        for(TheatreEntity t : allTheatre) {
        	if(t.getName().toLowerCase().contains(theatreName.toLowerCase())) {
        		searchedTheatrs.add(t);
        	}
        }
		return searchedTheatrs;
    }
    
    public TheatreEntity getTheatreById(int TheartreId) {
    	
    	for(TheatreEntity t : tr.findAll()) {
    		if(t.getId() == TheartreId) {
    			return t;
    		}
    	}
    	return null;
    }
	
}