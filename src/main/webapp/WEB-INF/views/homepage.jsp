<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.movieticket.entity.MovieEntity" %>
<%@ page import="com.example.movieticket.entity.TheatreEntity" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    
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
.logo img {
    height: 50px; /* Set the height of the logo image */
    margin-right: 10px; /* Space between the image and text */
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
        .content {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 70px;
            padding: 40px;
            width: fit-content;
            margin: 0 auto;
        }

        .box {
            width: 200px;
            height: 250px;
            border: 2px solid orange;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            color: black;
        }

        .box:hover {
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
    <div class="content">
        <%
            ArrayList<MovieEntity> movieList = (ArrayList<MovieEntity>) request.getAttribute("movieList");
            ArrayList<TheatreEntity> theatreList = (ArrayList<TheatreEntity>) request.getAttribute("theatreList");

            if (movieList != null && !movieList.isEmpty()) {
                for (MovieEntity movie : movieList) {
        %>
        <div class="movie-container" onclick="GoToMovieInfo(<%= movie.getId() %>)">
            <div class="box">
                <img src="<%= movie.getMovieUrl() %>" alt="<%= movie.getTitle() %>" height="240px">
            </div>
            <p class="movie-name"><%= movie.getTitle() %></p>
        </div>
        <%
                }
            } else if (theatreList != null && !theatreList.isEmpty()) {
                for (TheatreEntity theatre : theatreList) {
        %>
        <div class="theatre-container" onclick="GoToTheatreInfo(<%= theatre.getId() %>)">
            <div class="box">
                <h3><%= theatre.getName() %></h3>
            </div>
            <p>Location: <br><%= theatre.getLocation() %></p>
        </div>
        <%
                }
            } else {
        %>
        <p class="no-results">No search results available.</p>
        <%
            }
        %>
    </div>
    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>
    <script>
        function GoToMovieInfo(movieId) {
            window.location.href = '/movieapp/movie-info/' + movieId;
        }

        function GoToTheatreInfo(theatreId) {
            window.location.href = '/movieapp/view-theatre/' + theatreId;
        }

        function GoToProfile() {
            window.location.href = '/movieapp/profile';
        }

        function searchStuff() {
            const movieTerm = document.getElementById("search-bar").value.trim();
            const theatreTerm = document.getElementById("search-bar2").value.trim();
            
            if(movieTerm && theatreTerm){
                alert("Can't search both movie and theatre at the same time.");
            }
            else if (movieTerm) {
                window.location.href = '/movieapp/search/' + movieTerm;
            } 
            else if (theatreTerm) {
                window.location.href = '/movieapp/search-theatre/' + theatreTerm;
            }
            else {
                alert("Please enter a movie or theatre name to search.");
            }
        }
    </script>
</html>