<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking - Thank You</title>
   
</head>
<style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: lightpink;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
            justify-content: center;
            align-items: center;
            text-align: center;
            color:black;
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

        main {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 20px;
        }

        .thank-you-message {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .home-button {
            padding: 15px 25px;
            font-weight: bold;
            cursor: pointer;
            border: 2px solid black;
            background: white;
            margin-top: 20px;
        }

        .home-button:hover {
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

    <main>
        <h2 class="thank-you-message">Thank You for Your Booking!</h2>
        <button class="home-button" onclick="GotoHome()">Go to Home</button>
    </main>

    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>
<script>
function GotoHome(){
	window.location.href = '/movieapp/home';
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