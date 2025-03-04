<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking - Payment</title>
    
</head>
<style>
/* Reset and General Styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Body Styling */
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

/* Main Content */
main {
    flex-grow: 1;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: pink;
}

.payment-section {
    display: flex;
    flex-direction: column;
    gap: 15px;
    border: 2px solid black;
    padding: 20px;
    max-width: 450px;
    background: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    width: 100%;
}

.payment-title {
    font-size: 1.8rem;
    font-weight: bold;
    text-align: center;
    color: #333;
}

/* Form Styling */
.form-group {
    margin-bottom: 1.2rem;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

.form-group input {
    width: 100%;
    padding: 0.8rem;
    border: 2px solid black;
    border-radius: 4px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
    box-sizing: border-box;
}

.row {
    display: flex;
    gap: 1rem;
    margin-bottom: 1rem;
}

.row .form-group {
    flex: 1;
}

.buttons-container {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 10px;
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
    <main>
        <section class="payment-section">
            <h2 class="payment-title">Payment Price: &#8377;${totalPrice}</h2>
            <br>
            <form id="payment-form">
                <div class="form-group">
                    <label for="card-number">Card Number:</label>
                    <input type="text" id="card-number" required pattern="\d{16}" placeholder="1234 5678 9012 3456" aria-label="Card Number">
                </div>
                <div class="form-group">
                    <label for="cardholder-name">Cardholder Name:</label>
                    <input type="text" id="cardholder-name" required placeholder="John Doe" aria-label="Cardholder Name">
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="expiry">MM/YY:</label>
                        <input type="text" id="expiry" required pattern="\d{2}/\d{2}" placeholder="MM/YY" aria-label="Expiry Date">
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" required pattern="\d{3}" placeholder="123" aria-label="CVV">
                    </div>
                </div>
                <div class="buttons-container">
                    <button type="button" class="button" onclick="handlePayment('${totalPrice}')">Pay</button>
                    <button type="button" class="button" onclick="GotoOrderSummary()">Cancel</button>
                </div>
            </form>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 My Movie Booker</p>
    </footer>
    <script>
        function handlePayment(totalPrice) {
            const cardNumber = document.getElementById('card-number');
            const cardholderName = document.getElementById('cardholder-name');

            if (!cardNumber.checkValidity() || !cardholderName.checkValidity()) {
                alert('Please fill out all fields correctly.');
                return;
            }

            window.location.href = '/movieapp/payments/confirm/' + totalPrice;
        }

        function GotoOrderSummary() {
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
</body>
</html>