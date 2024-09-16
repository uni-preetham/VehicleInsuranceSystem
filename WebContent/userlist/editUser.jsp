<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Buy/Renew Vehicle Insurance Online</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
    .bg-blue-700 {
	background-color: rgb(29, 78, 216);
}

header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
}
    </style>
</head>
<body class="bg-success">
    <header class="container d-flex justify-content-between align-items-center my-lg-3">
        <a class="text-white font-weight-bold h3 nav-link" href="<%=request.getContextPath()%>/landing.jsp">AutoX</a>
        <nav class="navbar navbar-expand-sm">
            <div class="navbar-nav">
                <a class="nav-item nav-link h6 text-white" href="<%=request.getContextPath()%>/adminhome/admin_home.jsp">Home</a>
                <a href="<%=request.getContextPath()%>/products/products.jsp" class="nav-item nav-link h6 text-white">Our Policies</a>
                <a href="<%=request.getContextPath()%>/reasons/reasons.jsp" class="nav-item nav-link h6 text-white">Why choose us?</a>
            </div>
        </nav>
        <div>
            <a href="<%=request.getContextPath()%>/logout" class="btn btn-light font-weight-bold" style="border-radius: 30px;">Logout</a>
        </div>
    </header>
    
    <!-- -------------------------------------------------------------------- -->
    
    <div class="container">
        <div class="row" style="gap: 40px;">
            <div class="col p-5 rounded" style="min-height: 22em; background: url('https://acko-home-prod.ackoassets.com/next_assets/84d93d8b3944191e572285324f3086a970e1048e/_next/static/images/Saif-402b5e2dc15cc063fd28db9dc3d7f18b.png') no-repeat center center;background-size: contain;">
            </div>
            <div class="col rounded d-flex align-items-center" style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
                <form id="editUserForm" action="userlist" method="post" class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center">
                    <input type="hidden" name="action" value="update" />
                    <input type="hidden" name="userId" value="${user.userId}" />

                    <div class="form-group">
                        <input type="text" placeholder="Username" class="form-control" id="username" name="username" value="${user.username}" required />
                        <small class="form-text text-danger" id="usernameError"></small>
                    </div>

                    <div class="form-group">
                        <input type="email" placeholder="Email" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail}" required />
                        <small class="form-text text-danger" id="emailError"></small>
                    </div>

                    <div class="form-group">
                        <input type="text" placeholder="Phone number" class="form-control" id="userPhone" name="userPhone" value="${user.userPhone}" />
                        <small class="form-text text-danger" id="phoneError"></small>
                    </div>

                    <div class="form-group">
                        <input placeholder="First Name" type="text" class="form-control" id="userFname" name="userFname" value="${user.userFname}" required />
                        <small class="form-text text-danger" id="fnameError"></small>
                    </div>

                    <div class="form-group">
                        <input placeholder="Last Name" type="text" class="form-control" id="userLname" name="userLname" value="${user.userLname}" />
                        <small class="form-text text-danger" id="lnameError"></small>
                    </div>

                    <button type="submit" class="btn bg-blue-700 text-white font-weight-bold">Update</button>
                </form>
            </div>
        </div>
    </div>
    
    <footer class="sticky-bottom mt-5">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div>
    </footer>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('editUserForm');

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
                const email = document.getElementById('userEmail').value;
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
                const phone = document.getElementById('userPhone').value;
                const phoneError = document.getElementById('phoneError');
                const phonePattern = /^[6789]\d{9}$/;
                if (phone && !phonePattern.test(phone)) {
                    phoneError.textContent = 'Please enter a valid phone number.';
                    return false;
                }
                phoneError.textContent = '';
                return true;
            };

            const validateFirstName = () => {
                const firstName = document.getElementById('userFname').value.trim();
                const fnameError = document.getElementById('fnameError');
                if (firstName.length <= 1) {
                    fnameError.textContent = 'Please enter a valid name.';
                    return false;
                }
                fnameError.textContent = '';
                return true;
            };

            // Attach event listeners to input fields
            document.getElementById('username').addEventListener('input', validateUsername);
            document.getElementById('userEmail').addEventListener('input', validateEmail);
            document.getElementById('userPhone').addEventListener('input', validatePhone);
            document.getElementById('userFname').addEventListener('input', validateFirstName);

            form.addEventListener('submit', function(event) {
                let isValid = true;

                // Run all validations
                if (!validateUsername()) isValid = false;
                if (!validateEmail()) isValid = false;
                if (!validatePhone()) isValid = false;
                if (!validateFirstName()) isValid = false;

                // Prevent form submission if validation fails
                if (!isValid) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
