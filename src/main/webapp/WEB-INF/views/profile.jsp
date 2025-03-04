<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
   
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

        .auth-buttons {
            display: flex;
            gap: 10px;
        }

        .auth-buttons button {
            border: 2px solid black;
            padding: 10px 15px;
            font-weight: bold;
            cursor: pointer;
            background: none;
            color: black;
        }

        .auth-buttons button:hover {
            background-color: black;
            color: white;
        }

        main {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #profile-area {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: left;
        }

        #profile-area h1 {
            margin-bottom: 20px;
            color: #333;
        }

        #profile-area h4 {
            margin-bottom: 10px;
            color: #666;
        }

        #profile-area button {
            width: 100%;
            padding: 10px;
            border: 2px solid black;
            background: none;
            color: black;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        #profile-area button:hover {
            background-color: black;
            color: white;
        }

        #action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        #action-buttons button {
            padding: 10px 15px;
            border: 2px solid black;
            background: none;
            color: black;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        #action-buttons button:hover {
            background-color: black;
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
</style>

<body>
    <header>
        <a href="${pageContext.request.contextPath}/movieapp/home" class="logo">
        <img src="https://as2.ftcdn.net/v2/jpg/01/68/46/15/1000_F_168461551_pyiS0OjsgzoEvZly7VXBoULmoHxoquCW.jpg" alt="MovieSpace" style="height: 50px; vertical-align: middle;"></a>
        <div class="auth-buttons"></div>
    </header>

    <main>
        <section id="profile-area">
            <h1>User Profile</h1>
            <h4>Name: ${currentUser.getUsername().toUpperCase()}</h4>
            <h4>Phone Number: ${currentUser.getPhoneNumber()}</h4>
            <h4>Email: ${currentUser.getEmail()}</h4>

            <button onclick="GotoBookingHistory(${currentUser.getId()})">Bookings</button>
        </section>

        <div id="action-buttons">
            <button onclick="GotoEdit()">Edit</button>
            <button onclick="GotoLogin()">Logout</button>
            <button onclick="GotoHome()">Back</button>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>

<script>
function GotoEdit(){
	window.location.href="/movieapp/profile/edit";
}
function GotoBookingHistory(userId){
    window.location.href="/movieapp/booking-history/" + userId;
}

function GotoLogin(){
    window.location.href="/movieapp/logout";
}

function GotoHome(){
	window.history.back();
}

</script>

</html>