<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking - Order Summary</title>
    
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

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

.main-container {
	display: flex;
	padding: 20px;
	gap: 20px;
	width: 100%;
	flex-grow: 1;
}

.left-section {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.box {
	width: 250px;
	height: 300px;
	border: 3px solid black;
	padding: 10px;
}

.info {
	width: 250px;
	border: 2px solid black;
	padding: 10px;
}

.payment-section {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	gap: 15px;
	border: 2px solid black;
	padding: 20px;
	width: 100%;
	height: 350px;
}

.payment-options {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.payment-options button {
	padding: 15px;
	font-weight: bold;
	cursor: pointer;
	border: 2px solid black;
	background: white;
	width: 100%;
}

.payment-details {
	border: 2px solid black;
	padding: 15px;
	min-height: 100px;
}

.buttons-container {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 10px;
	width: 100%;
	padding-bottom: 70px;
}

.button {
	padding: 15px 25px;
	font-weight: bold;
	cursor: pointer;
	border: 2px solid black;
	background: white;
	color: black;
}

.button:hover {
	background-color: black;
	color: white;
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
</style>
<body>
    <header>
    
        <a href="${pageContext.request.contextPath}/movieapp/home" class="logo">
        <img src="https://as2.ftcdn.net/v2/jpg/01/68/46/15/1000_F_168461551_pyiS0OjsgzoEvZly7VXBoULmoHxoquCW.jpg" alt="MovieSpace" style="height: 50px; vertical-align: middle;">
        </a>
        <div class="nav-links">
            <input type="text" placeholder="Search Movie" id="search-bar">
            <input type="text" placeholder="Search Theatre" id="search-bar2">
            <button class="profile-btn" onclick="searchStuff()">Search</button>
        </div>
        <button class="profile-btn" onclick="GoToProfile()">Profile</button>
    </header>
    <main class="main-container">
        <div class="payment-section">
            <h4>Order Summary:</h4>
            <div class="payment-details">
                <p><strong>Title:</strong> ${movie}</p>
                <br>
                <p><strong>Date & Time:</strong> ${showdate} ${showtime}</p>
                <br>
                <p><strong>Theatre:</strong> ${theatre}</p>
                <br>
                <p><strong>Screen Number:</strong> ${screen}</p>
                <br>
                <p><strong>Selected Seats:</strong>
                    <c:forEach var="seat" items="${selectedSeats}" varStatus="loop">
                        ${seat}${!loop.last ? ', ' : ''}
                    </c:forEach>
                </p>
                <br>
                <p><strong>Total Price:</strong> ₹${totalPrice}</p>
            </div>
        </div>
    </main>
    <div class="buttons-container">
        <button class="button" 
    onclick="GotoPayments('${totalPrice}')">Confirm</button>
    
        <button class="button" onclick="GotoSeatSelection()">Cancel</button>
    </div>
    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>
<script>
function GotoPayments(totalPrice) {

    window.location.href = "/movieapp/payments/" + totalPrice;
}

function GoToProfile() {
    window.location.href = '/movieapp/profile';
}

function searchStuff() {
    const movieTerm = document.getElementById("search-bar").value.trim();
    const theatreTerm = document.getElementById("search-bar2").value.trim();

    if (movieTerm && theatreTerm) {
        alert("Can't search both movie and theatre at the same time.");
    } else if (movieTerm) {
        window.location.href = '/movieapp/search/' + movieTerm;
    } else if (theatreTerm) {
        window.location.href = '/movieapp/search-theatre/' + theatreTerm;
    } else {
        alert("Please enter a movie or theatre name to search.");
    }
}

function GotoSeatSelection(){
	window.history.back();
}
</script>
</html>