<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    
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

.auth-buttons {
    display: flex;
    gap: 10px;
}

main {
    flex-grow: 1;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

#edit-profile-container {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    text-align: left;
}

#edit-profile-container h1 {
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    color: #666;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 16px;
}

input:focus {
    border-color:black;
    outline: none;
}

button {
    width: 100%;
    padding: 10px;
    border: 2px solid black;
    background: none;
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
}

button:hover {
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
        <div class="auth-buttons"></div>
    </header>

    <main>
        <div id="edit-profile-container">
            <h1>Edit Profile</h1>

            <c:if test="${not empty message}">
                <p class="message success">${message}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="message error">${error}</p>
            </c:if>

            <form action="${pageContext.request.contextPath}/movieapp/profile/update" method="POST">
                <input type="hidden" name="userId" value="${userId}" />

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required />
                </div>

                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" required />
                </div>

                <button type="submit">Update Profile</button>
            </form>
        </div>

        <div id="action-buttons">
            <button onclick="GotoHome()">Back To Home</button>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
</body>

<script>
function GotoHome(){
    window.location.href = "/movieapp/home";
}
</script>

</html>