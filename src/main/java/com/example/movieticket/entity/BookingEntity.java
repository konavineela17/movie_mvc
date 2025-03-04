package com.example.movieticket.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "bookings")
public class BookingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private int bookingId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserEntity user;

    @ManyToOne
    @JoinColumn(name = "showtime_id")
    private ShowTimeEntity showtime;

    @OneToOne
    @JoinColumn(name = "payment_id")
    private paymentEntity payment;

    @Temporal(TemporalType.DATE)
    @Column(name = "booking_date")
    private Date bookingDate;

    @Column(name = "total_price")
    private double totalPrice;

    public BookingEntity() {}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public ShowTimeEntity getShowtime() {
		return showtime;
	}

	public void setShowtime(ShowTimeEntity showtime) {
		this.showtime = showtime;
	}

	public paymentEntity getPayment() {
		return payment;
	}

	public void setPayment(paymentEntity payment) {
		this.payment = payment;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

    
}