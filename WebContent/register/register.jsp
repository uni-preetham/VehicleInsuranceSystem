<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Buy/Renew Vehicle Insurance Online</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        
        .bg-blue-700 {
	background-color: rgb(29, 78, 216);
}
        .form-group {
            width: 100%;
        }
        
        header{
background-color: rgba(255, 255, 255, 0.3);
border-radius: 40px;
}
    </style>
</head>
<body class="bg-success">
    
<header
		class="container d-flex justify-content-between align-items-center my-lg-3">
	<a class="text-white font-weight-bold h3 nav-link"
		href="<%=request.getContextPath()%>/landing.jsp">AutoX</a> <nav
		class="navbar navbar-expand-sm">
	<div class="navbar-nav">
		<a class="nav-item nav-link h6 text-white"
			href="<%=request.getContextPath()%>/landing.jsp">Home</a> <a
			href="<%=request.getContextPath()%>/products/products.jsp"
			class="nav-item nav-link h6 text-white">Our Policies</a> <a
			href="<%=request.getContextPath()%>/reasons/reasons.jsp"
			class="nav-item nav-link h6 text-white">Why choose us?</a>
	</div>
	</nav>
	<div>
		<a href="<%=request.getContextPath()%>/Login"
			class="btn btn-light font-weight-bold" style="border-radius: 30px;">Login</a>
		<a class="btn bg-blue-700 text-white font-weight-bold"
			style="border-radius: 30px;"
			href="<%=request.getContextPath()%>/Register">Register</a>

	</div>
	</header>
	
		<!-- ---------------------------------------------------------------------------------- -->
	
    <div class="container">
        <div class="row" style="gap: 40px;">
            <div class="col p-5 rounded "
			style="min-height: 22em; background: url('https://acko-home-prod.ackoassets.com/next_assets/84d93d8b3944191e572285324f3086a970e1048e/_next/static/images/Saif-402b5e2dc15cc063fd28db9dc3d7f18b.png') 
			no-repeat center center;background-size: contain;">
		</div>
            <div class="col rounded d-flex align-items-center"
			style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
                <form id="registrationForm" class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center" action="<%=request.getContextPath()%>/Register" method="post">
                <c:if test="${not empty NOTIFICATION}">
                    <div class="alert alert-info mt-3">
                        ${NOTIFICATION}
                    </div>
                </c:if>
                    <!-- First Name Field -->
                    <div class="form-group">
                       <!--  <label for="user_fname">First Name*:</label> -->
                        <input type="text" class="form-control" id="user_fname" placeholder="Enter first name*" name="user_fname" />
                        <small class="form-text text-danger" id="fnameError"></small>
                    </div>

                    <!-- Last Name Field -->
                    <div class="form-group">
                       <!--  <label for="user_lname">Last Name:</label> -->
                        <input type="text" class="form-control" id="user_lname" placeholder="Enter last name" name="user_lname" />
                        <small class="form-text text-danger" id="lnameError"></small>
                    </div>

                    <!-- Email Field -->
                    <div class="form-group">
                        <!-- <label for="user_email">Email*:</label> -->
                        <input type="text" class="form-control" id="user_email" placeholder="Enter email*" name="user_email" />
                        <small class="form-text text-danger" id="emailError"></small>
                    </div>

                    <!-- Phone Number Field -->
                    <div class="form-group">
                        <!-- <label for="user_phone">Phone Number:</label> -->
                        <input type="text" class="form-control" id="user_phone" placeholder="Enter phone number" name="user_phone" />
                        <small class="form-text text-danger" id="phoneError"></small>
                    </div>

                    <!-- Username Field -->
                    <div class="form-group">
                      <!--   <label for="username">Username*:</label> -->
                        <input type="text" class="form-control" id="username" placeholder="Enter username*" name="username" />
                        <small class="form-text text-danger" id="usernameError"></small>
                    </div>

                    <!-- Password Field -->
                    <div class="form-group">
                        <!-- <label for="user_password">Password*:</label> -->
                        <input type="password" class="form-control" id="user_password" placeholder="Password*" name="user_password" />
                        <small class="form-text text-danger" id="passwordError"></small>
                    </div>

                    <button type="submit" class="btn bg-blue-700 text-white font-weight-bold">Register</button>
                </form>

                <!-- Display Notification -->
                
            </div>
        </div>
    </div>
 <footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('registrationForm');

            const validateFirstName = () => {
                const firstName = document.getElementById('user_fname').value.trim();
                const fnameError = document.getElementById('fnameError');
                if (firstName.length <= 1) {
                    fnameError.textContent = 'Please enter a valid name.';
                    return false;
                }
                fnameError.textContent = '';
                return true;
            };

            const validateUsername = () => {
                const username = document.getElementById('username').value.trim();
                const usernameError = document.getElementById('usernameError');
                if (username === "") {
                    usernameError.textContent = 'Username is required.';
                    return false;
                }
                usernameError.textContent = '';
                return true;
            };

            const validateEmail = () => {
                const email = document.getElementById('user_email').value;
                const emailError = document.getElementById('emailError');
                const emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
                if (!emailPattern.test(email)) {
                    emailError.textContent = 'Please enter a valid email address.';
                    return false;
                }
                emailError.textContent = '';
                return true;
            };

            const validatePhone = () => {
                const phone = document.getElementById('user_phone').value;
                const phoneError = document.getElementById('phoneError');
                const phonePattern = /^[6789]\d{9}$/;
                if (!phonePattern.test(phone)) {
                    phoneError.textContent = 'Please enter a valid phone number.';
                    return false;
                }
                phoneError.textContent = '';
                return true;
            };

            const validatePassword = () => {
                const password = document.getElementById('user_password').value;
                const username = document.getElementById('username').value.trim();
                const passwordError = document.getElementById('passwordError');

                if (!/(?=.*\d)/.test(password)) {
                    passwordError.textContent = 'Must include a number.';
                    return false;
                }
                
                if (!/(?=.*[!@#$%^&*])/.test(password)) {
                    passwordError.textContent = 'Must include one special character.';
                    return false;
                }
                
                if (password.length < 8) {
                    passwordError.textContent = 'Must be at least 8 characters long.';
                    return false;
                }
                
                if (password.includes(username)) {
                    passwordError.textContent = 'Cannot contain the username.';
                    return false;
                }

                passwordError.textContent = '';
                return true;
            };

            // Attach event listeners to input fields
            document.getElementById('user_fname').addEventListener('input', validateFirstName);
            document.getElementById('username').addEventListener('input', function() {
                validateUsername();
                validatePassword();
            });
            document.getElementById('user_email').addEventListener('input', validateEmail);
            document.getElementById('user_phone').addEventListener('input', validatePhone);
            document.getElementById('user_password').addEventListener('input', validatePassword);

            form.addEventListener('submit', function(event) {
                let isValid = true;

                // Run all validations
                if (!validateFirstName()) isValid = false;
                if (!validateUsername()) isValid = false;
                if (!validateEmail()) isValid = false;
                if (!validatePhone()) isValid = false;
                if (!validatePassword()) isValid = false;

                // Prevent form submission if validation fails
                if (!isValid) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
