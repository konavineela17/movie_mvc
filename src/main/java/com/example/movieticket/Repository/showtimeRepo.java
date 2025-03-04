package com.example.movieticket.Repository;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.movieticket.entity.MovieEntity;
import com.example.movieticket.entity.ShowTimeEntity;

import jakarta.transaction.Transactional;

@Repository
public interface showtimeRepo extends JpaRepository<ShowTimeEntity, Integer>{
		
	public ShowTimeEntity findById(int id);
	
	public List<ShowTimeEntity> findByMovie(MovieEntity movie);
	
	public List<ShowTimeEntity> findStartDateAndStartTimeByMovie(MovieEntity movie);
	
	public ShowTimeEntity findByStartDateAndStartTimeAndTheatreId(Date date, LocalTime time, int id);
	
	public List<ShowTimeEntity> findByTheatreId(int t);

	public List<ShowTimeEntity> findByEndDateBefore(Date today);
	
	public List<ShowTimeEntity> findByEndTimeBefore(LocalTime today);
	
//	@Modifying
//	@Transactional
//	@Query(nativeQuery = true, value = "UPDATE showtimes s SET s.is_active = 'N' WHERE s.showtime_id = :showtimeId")
//	void markShowsAsNotActive(@Param("showtimeId") int showtimeId);

}