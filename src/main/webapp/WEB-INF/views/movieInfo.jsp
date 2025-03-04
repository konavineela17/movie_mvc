<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.movieticket.entity.MovieEntity" %>
<%@ page import="com.example.movieticket.entity.TheatreEntity" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Info</title>
    
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
            border: 2px solid white;
            padding: 10px 15px;
            font-weight: bold;
            cursor: pointer;
            background: white;
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
            flex: 1;
        }

        .box {
            width: 250px;
            height: 250px;
            border: 3px solid black;
            padding: 10px;
        }

        .info {
            width: 250px;
            border: 2px solid black;
            padding: 10px;
        }

        .theatre-selection {
            flex: 2;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .theatre-selection h1 {
            font-size: 24px;
            color: black;
        }

        .theatre-selection button {
            padding: 15px 20px;
            border: 2px solid black;
            background-color:lightpink;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
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

        .theatre-selection button:hover {
        background-color: lightpink;
        color:blue;
}

</style>
<body>
    <header>
        <a href="<%= request.getContextPath() %>/movieapp/home" class="logo">
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
            MovieEntity selectedMovie = (MovieEntity) request.getAttribute("selectedMovie");
        	ArrayList<TheatreEntity> theatreList = (ArrayList<TheatreEntity>) request.getAttribute("theatreList");
        %>
        <div class="left-section">
            <img src="<%= selectedMovie.getMovieUrl() %>" alt="<%= selectedMovie.getTitle() %>" style="width: 250px; height: 350px; object-fit: cover; border: 2px solid black; border-radius: 10px;">
            <h2><%= selectedMovie.getTitle() %></h2>
            <p>Release Date: <%= selectedMovie.getReleaseDate() %></p>
            <p>Duration: <%= selectedMovie.getDuration() %> minutes</p>
            <p>Genre: <%= selectedMovie.getGenre() %></p>
            <p>Description: <%= selectedMovie.getDescription() %></p>
        </div>

        <div class="theatre-selection">
            <h1>Select Theatre:</h1>
            <% 
            	for(TheatreEntity t : theatreList){
            %>
            <button onclick="GotoTheatre(<%= t.getId() %>, <%= selectedMovie.getId() %>)"><%= t.getName() %> - <%= t.getLocation() %></button>
			<%
            	}
			%>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>
<script>
function GotoTheatre(theatreId, movieId) {
    window.location.href = '/movieapp/theatre-info/' + theatreId + '/' + movieId;
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