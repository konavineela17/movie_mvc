package com.example.movieticket.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.movieticket.entity.MovieEntity;



@Repository
public interface MovieRepo extends JpaRepository<MovieEntity, Integer>{

}