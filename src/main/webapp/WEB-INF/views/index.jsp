<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color:white;
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
    background: red;
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
    border: 2px solid white;
    padding: 10px 15px;
    font-weight: bold;
    cursor: pointer;
    background: none;
    color: white;
}

.auth-buttons button:hover {
    background-color: black;
    color: white;
}

.container {
    max-width: 400px;
    background: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin: auto;
    margin-top: 50px;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

.form-group {
    margin-bottom: 20px;
    text-align: left;
}

label {
    display: block;
    margin-bottom: 5px;
    color: #666;
}

input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
}

input:focus {
    border-color: black;
    outline: none;
}

button {
    width: 100%;
    padding: 12px;
    border: 2px solid black;
    background: none;
    color: black;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
}

button:hover {
    background-color: black;
    color: white;
}

        footer {
            text-align: center ;
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
       
      <div class="logo">
    <img src="https://as2.ftcdn.net/v2/jpg/01/68/46/15/1000_F_168461551_pyiS0OjsgzoEvZly7VXBoULmoHxoquCW.jpg" alt="MovieSpace Logo" style="height: 50px; vertical-align: middle;">
   
</div>
       
        <div class="auth-buttons">
            <button onclick="GotoLogin()">Login</button>
            <button onclick="GotoSignup()">Sign Up</button>
        </div>
    </header>

    <div class="container">
        <h2>Login</h2>
        <form action="/movieapp/auth" method="post">
            <div class="form-group">
                <label for="phone">Enter your phone number</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="password">Enter your password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>

<script>
function GotoLogin(){
	window.location.href = '/movieapp/login';
}

function GotoSignup(){
	window.location.href = '/movieapp/signup';
}
</script>

</html>