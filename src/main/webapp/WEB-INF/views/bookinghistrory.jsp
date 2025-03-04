<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking History</title>
    
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}


/* Unified Header Styles */
 body {
            background-color:lightpink;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
        }

        header {
    display: flex;
    justify-content: space-between;
    align-items: center;
   
    padding: 15px 30px;
    background: black;
    border: 2px solid black;
    width: 100%;
}

        .logo {
    font-size: 20px;
    font-weight: bold;
    color:white;
    border: 2px solid white;
    padding: 10px;
}

        .nav-links {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .nav-links input {
            padding: 10px;
            border: 2px solid white;
        }

        .profile-btn {
        box:3px;
            border: 2px solid white;
            color:white;
            padding: 10px 15px;
            font-weight: bold;
            cursor: pointer;
            background: black;
        }
.profile-btn:hover,
button:hover {
    background-color:black ;
    color: white;
}

/* Booking History Specific Styles */
main {
    padding: 40px;
    width: 100%;
    max-width: 1200px;
}

#history h1 {
    text-align: center;
    margin-bottom: 2.5rem;
    font-size: 2rem;
    padding-bottom: 1rem;
    border-bottom: 2px solid #ecf0f1;
}

.booking-list {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    margin: 2rem 0;
}

.booking-item {
    padding: 2rem;
}

.booking-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
}

.booking-header h2 {
    margin: 0;
    font-size: 1.3rem;
}

.payment-status {
    font-size: 0.85rem;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-weight: 600;
    text-transform: uppercase;
}

.payment-status.confirmed {
    background: #e8f5e9;
    color: #2ecc71;
}

.payment-status.pending {
    background: #fff3e0;
    color: #f39c12;
}

.payment-status.cancelled {
    background: #ffebee;
    color: #e74c3c;
}

.detail-row {
    display: flex;
    align-items: baseline;
    margin-bottom: 1rem;
}

.detail-label {
    flex: 0 0 120px;
    color: #7f8c8d;
    font-weight: 500;
}

.detail-value {
    flex: 1;
    color: #2d3436;
}

.seats {
    font-weight: 500;
}

.record-separator {
    border: 0;
    height: 1px;
    background: #ecf0f1;
    margin: 0 2rem;
}

.no-bookings {
    text-align: center;
    color: #7f8c8d;
    padding: 2rem;
    background: white;
    border-radius: 8px;
    margin: 2rem 0;
}

        footer {
            text-align: center;
            color:white;
            padding: 15px;
            background: black;
            border-top: 2px solid black;
            width: 100%;
            margin-top: auto;
        }

/* Responsive Design */
@media (max-width: 768px) {
    main {
        padding: 20px;
    }
    
    .booking-item {
        padding: 1.5rem;
    }
    
    .booking-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.5rem;
    }
    
    .detail-row {
        flex-direction: column;
        gap: 0.3rem;
    }
    
    .detail-label {
        flex: none;
    }
    
    .record-separator {
        margin: 0 1rem;
    }
}

/* Center the Back to Profile button */
button {
    display: block;
    margin: 0 auto;
}
</style>
<body>
    <header>
        <a href="${pageContext.request.contextPath}/movieapp/home" class="logo">MovieSpace</a>
    </header>

    <main>
        <section id="history">
            <h1>Booking History</h1>
            
            <c:choose>
                <c:when test="${empty bookings}">
                    <p class="no-bookings">No bookings found in your account</p>
                </c:when>
                <c:otherwise>
                    <div class="booking-list">
                        <c:forEach var="booking" items="${bookings}" varStatus="loop">
                            <div class="booking-item">
                            	<br>
                                <div class="booking-header">
                                    <h2>${booking.showtime.movie.title}</h2>
                                    <span class="payment-status ${booking.payment.status.toLowerCase()}">
                                        Payment Status: ${booking.payment.status}
                                    </span>
                                </div>
                                
                                <div class="booking-details">
                                    <div class="detail-row">
                                        <span class="detail-label">Theatre:</span>
                                        <span class="detail-value">${booking.showtime.theatre.name}</span>
                                    </div>
                                    
                                    <div class="detail-row">
                                        <span class="detail-label">Booked Date:</span>
                                        <span class="detail-value">${booking.bookingDate}</span>
                                    </div>
                                   
                                    <br>
                                </div>
                            </div>
                            
                            <c:if test="${not loop.last}">
                                <hr class="record-separator">
                            </c:if>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <button onclick="GotoProfile()">Back to Home</button>
        </section>
    </main>

    <footer>
        <p>&copy; My Movie Booker</p>
    </footer>

    <script>
        function GotoProfile() {
            window.location.href = "${pageContext.request.contextPath}/movieapp/home";
        }
    </script>
</body>
</html>