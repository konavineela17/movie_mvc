package com.example.movieticket.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.movieticket.entity.AdminEntity;



@Repository
public interface AdminRepo extends JpaRepository<AdminEntity, Integer>{

}