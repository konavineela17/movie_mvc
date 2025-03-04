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
		    gap: 20px;
		    width: 250px;
		}
		
		.box {
		    width: 250px;
		    height: 350px;
		    border: 3px solid black;
		    padding: 10px;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    text-align: center;
		}
		
		.box h2 {
		    font-size: 20px;
		    margin-bottom: 10px;
		}
		
		.box h4 {
		    font-size: 16px;
		    color: #555;
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
        }

        .seat.selected {
            background-color: #4CAF50;
            color: white;
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
        }
        
        .button:hover {
            background-color: red;
            color: white;
        }

        footer {
            text-align: center;
            color:white;
            padding: 15px;
            background:black;
            border-top: 2px solid black;
            width: 100%;
            margin-top: auto;
        }
        .seat:hover {
            background-color:blue;
            cursor: pointer;
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
        <%
            TheatreEntity selectedTheatre = (TheatreEntity) request.getAttribute("theatre");
        %>
    
        <div class="left-section">
            <div class="box">
            	<h2><%= selectedTheatre.getName() %></h2>
            	<br>
            	<h4><%= selectedTheatre.getLocation() %></h4>
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
    
	function GotoTheatreInfo(){
		window.history.back();
	}

</script>
</html>