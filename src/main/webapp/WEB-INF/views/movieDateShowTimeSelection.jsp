<%@ page import="com.example.movieticket.entity.TheatreEntity, java.util.List, com.example.movieticket.entity.ShowTimeEntity" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theatre Information</title>
    
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
}

.search-box {
    padding: 10px;
    border: 2px solid black;
}

#search-bar, #search-bar2 {
    padding: 10px;
    border: 2px solid black;
    font-size: 16px;
}


.profile-btn {
    border: 2px solid black;
    padding: 10px 15px;
    font-weight: bold;
    cursor: pointer;
}

.main-container {
    display: flex;
    padding: 20px;
    gap: 20px;
    width: 100%;
    flex-grow: 1;
    flex-direction: column;
    align-items: center;
}

.content-container {
    display: flex;
    gap: 20px;
    width: 100%;
}

/* Left Section for Movie Details */
.left-section {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Box containing movie image and details */
.box {
    width: 300px;
    height: 500px; /* Increased height */
    border: 3px solid orange;
    padding: 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    background-color: white;
}

.movie-details {
    width: 100%;
    text-align: left; /* Aligns labels to the left */
    padding-top: 10px;
}

.movie-image {
    width: 100%;
    height: 60%; /* Adjusted to fit properly */
    object-fit: cover; /* Ensures proper fit without distortion */
    border-radius: 5px;
}

.box h3 {
    font-size: 16px;
    margin-top: 8px;
    font-weight: normal;
    width: 100%;
    text-align: left; /* Ensures movie title is also left-aligned */
}

/* Right Section for Seat Selection */
#seats-selection {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    gap: 20px;
    border: 2px solid black;
    padding: 20px;
    width: 100%;
}

.dropdown-container {
    width: 100%;
}

select {
    width: 100%;
    padding: 10px;
    border: 2px solid black;
    font-size: 16px;
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
        </a>
 <div class="nav-links">
    <input type="text" placeholder="Search Movie" id="search-bar" class="search-box">
    <input type="text" placeholder="Search Theatre" id="search-bar2" class="search-box">
    <button class="profile-btn" onclick="searchStuff()">Search</button>
</div>

        <button class="profile-btn" onclick="GoToProfile()">Profile</button>
    </header>

    <main class="main-container">
        <%
            TheatreEntity selectedTheatre = (TheatreEntity) request.getAttribute("selectedTheatre");
            List<ShowTimeEntity> datesAndTimes = (List<ShowTimeEntity>) request.getAttribute("datesAndTimes");

            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <div class="content-container">
            
            <div class="left-section">
                <div class="box">
                    <img class="movie-image" src="${movieInfo.getMovieUrl()}" alt="${movieInfo.getTitle()}">
                    <h3><strong>Theatre:</strong> ${selectedTheatre.getName()}</h3>       
                    <h3><strong>Movie:</strong> ${movieInfo.getTitle()}</h3>  
                    <h3><strong>Release Date:</strong> ${movieInfo.getReleaseDate()}</h3>         
                    <h3><strong>Duration: </strong>${movieInfo.getDuration()}</h3>      
                    <h3><strong>Genre:</strong> ${movieInfo.getGenre()}</h3>      
                    <h3><strong>About:</strong> ${movieInfo.getDescription()}</h3> 
                </div>
            </div>

            <div id="seats-selection">
                <h4>Select Date:</h4>
                <div class="dropdown-container">
                    <select id="dateDropdown" onchange="populateShowtimes()">
                        <option value="">Select Date</option>
                        <% for (ShowTimeEntity showtime : datesAndTimes) { %>
                            <option value="<%= dateFormatter.format(showtime.getStartDate()) %>">
                                <%= dateFormatter.format(showtime.getStartDate()) %>
                            </option>
                        <% } %>
                    </select>
                </div>

                <h4>Select Show Time:</h4>
                <div class="dropdown-container">
                    <select id="timeDropdown">
                        <option value="">Select Show Time</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="buttons-container">
            <button class="button" onclick="GotoSeatSelection(<%= selectedTheatre.getId() %>)">Continue</button>
            <button class="button" onclick="GotoMovieInfo()">Cancel</button>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>

    <script>
        var showtimesData = {};
        <% for (ShowTimeEntity showtime : datesAndTimes) { %>
            var date = "<%= dateFormatter.format(showtime.getStartDate()) %>";
            var time = "<%= showtime.getStartTime() %>";
            if (!showtimesData[date]) {
                showtimesData[date] = [];
            }
            showtimesData[date].push(time);
        <% } %>

        function populateShowtimes() {
            var dateDropdown = document.getElementById("dateDropdown");
            var timeDropdown = document.getElementById("timeDropdown");
            var selectedDate = dateDropdown.value;

            timeDropdown.innerHTML = '<option value="">Select Show Time</option>';

            if (selectedDate && showtimesData[selectedDate]) {
                showtimesData[selectedDate].forEach(function(time) {
                    var option = document.createElement("option");
                    option.value = time;
                    option.textContent = time;
                    timeDropdown.appendChild(option);
                });
            }
        }

        function GotoSeatSelection(theatreId) {
            var selectedDate = document.getElementById("dateDropdown").value;
            var selectedTime = document.getElementById("timeDropdown").value;

            if (!selectedDate || !selectedTime) {
                alert("Please select both date and time before continuing!");
                return;
            }

            window.location.href = "/movieapp/seat-selection-movie/" + selectedDate + "/" + selectedTime + "/" + theatreId;
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
        
        function GotoMovieInfo(){
        	window.history.back();
        }
    </script>
</body>
</html>