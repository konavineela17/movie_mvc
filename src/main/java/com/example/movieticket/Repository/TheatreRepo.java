package com.example.movieticket.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.movieticket.entity.TheatreEntity;



@Repository
public interface TheatreRepo extends JpaRepository<TheatreEntity, Integer>{

}