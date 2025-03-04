<%@ page import="com.example.movieticket.entity.TheatreEntity, java.util.List" %>
<%@ page import="com.example.movieticket.entity.SeatEntity, java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking - Seat Selection</title>
    
</head>
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #f9fafb;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    width: 100%;
}

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: white;
            border: 2px solid black;
            width: 100%;
        }

        .logo {
            font-size: 20px;
            font-weight: bold;
            color: red;
            border: 2px solid red;
            padding: 10px;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .nav-links input {
            padding: 10px;
            border: 2px solid black;
        }

.profile-btn {
    border: 2px solid black;
    padding: 10px 15px;
    font-weight: bold;
    cursor: pointer;
}


.main-container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 20px;
    width: 100%;
    flex-grow: 1;
    padding: 20px;
}

.left-section {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.box {
    width: 300px;
    height: 500px;
    border: 3px solid orange;
    padding: 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    background-color: white;
}

.movie-image {
    width: 100%;
    height: 60%;
    object-fit: cover;
    border-radius: 5px;
}

.movie-details {
    width: 100%;
    text-align: left;
    padding-top: 10px;
}

.box h3 {
    font-size: 16px;
    margin-top: 8px;
    font-weight: normal;
    width: 100%;
    text-align: left;
}

#seats-selection {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    gap: 15px;
    border: 2px solid black;
    padding: 20px;
    width: 100%;
    height: 350px;
}

.seats {
    display: grid;
    grid-template-columns: repeat(8, 1fr);
    gap: 10px;
}

.seat {
    width: 40px;
    height: 40px;
    border: 2px solid black;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    background-color: white;
    transition: background 0.3s ease;
}

.seat.selected {
    background-color: #4CAF50;
    color: white;
}

.seat:hover {
    background-color: red;
    cursor: pointer;
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
    transition: background 0.3s ease, color 0.3s ease;
}

.button:hover {
    background-color: red;
    color: white;
}

        footer {
            text-align: center;
            padding: 15px;
            background: white;
            border-top: 2px solid black;
            width: 100%;
            margin-top: auto;
        }
</style>

<body>
    <header>
    
        <a href="${pageContext.request.contextPath}/movieapp/home" class="logo">
        <img src="https://as2.ftcdn.net/v2/jpg/01/68/46/15/1000_F_168461551_pyiS0OjsgzoEvZly7VXBoULmoHxoquCW.jpg" alt="MovieSpace" style="height: 50px; vertical-align: middle;">
        MovieSpace</a>
        <div class="nav-links">
            <input type="text" placeholder="Search Movie" id="search-bar">
            <input type="text" placeholder="Search Theatre" id="search-bar2">
            <button class="profile-btn" onclick="searchStuff()">Search</button>
        </div>
        <button class="profile-btn" onclick="GoToProfile()">Profile</button>
    </header>

    <main class="main-container">
        <%
            TheatreEntity selectedTheatre = (TheatreEntity) request.getAttribute("theatre");
        %>
    
        <div class="left-section">
                <div class="box">
                    <img class="movie-image" src="${movieInfo.getMovieUrl()}" alt="${movieInfo.getTitle()}">
                    <h3><strong>Theatre:</strong> ${theatre.getName()}</h3>       
                    <h3><strong>Movie:</strong> ${movieInfo.getTitle()}</h3>  
                    <h3><strong>Release Date:</strong> ${movieInfo.getReleaseDate()}</h3>         
                    <h3><strong>Duration: </strong>${movieInfo.getDuration()}</h3>      
                    <h3><strong>Genre:</strong> ${movieInfo.getGenre()}</h3>      
                    <h3><strong>About:</strong> ${movieInfo.getDescription()}</h3> 
                </div>
        </div>
        <div id="seats-selection">
            <h4>Select Seats:</h4>
            <div class="seats">
			<%
			    List<SeatEntity> seats = (List<SeatEntity>) request.getAttribute("seats");
			    if (seats != null && !seats.isEmpty()) {
			        for (SeatEntity seat : seats) {
			            boolean isBooked = "true".equalsIgnoreCase(seat.isBooked());
			            String seatClass = isBooked ? "seat booked" : "seat available";
			%>
			            <div class="<%= seatClass %>" onclick="<%= isBooked ? "" : "toggleSeat(this)" %>">
			                <%= seat.getSeatNumber() %>
			            </div>
			<%
			        }
			    } else {
			%>
			        <p>No seats available.</p>
			<%
			    }
			%>
            </div>
        </div>
    </main>

    <div class="buttons-container">
        <button class="button" onclick="GotoSummary(<%= selectedTheatre.getId() %>, ${showtimeId.getShowTimeId()})">Confirm</button>
        <button class="button" onclick="GotoTheatreInfo()">Cancel</button>
    </div>

    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>
<script>
	let selectedSeats = [];
	
	function toggleSeat(seatElement) {
	    if (!seatElement.classList.contains("booked")) {
	        seatElement.classList.toggle("selected");
	
	        let seatNumber = seatElement.innerText.trim();
	        if (selectedSeats.includes(seatNumber)) {
	            selectedSeats = selectedSeats.filter(seat => seat !== seatNumber);
	        } else {
	            selectedSeats.push(seatNumber);
	        }
	    }
	}

    function GotoSummary(theatreId, showtimeId) {
        if (selectedSeats.length === 0) {
            alert("Please select at least one seat before proceeding.");
            return;
        }

        let seatsParam = selectedSeats.join(",");
        
        window.location.href = "/movieapp/order-summary/" + seatsParam + "/" + theatreId + "/" + showtimeId;
    }
	
	function GotoTheatreInfo(){
		window.history.back();
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

</script>
</html>