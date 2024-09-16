<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login Page</title>

<!-- Favicon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Bootstrap CSS -->
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
                <a class="nav-item nav-link h6 text-white" href="<%=request.getContextPath()%>/landing.jsp">Home</a>
                <a href="<%=request.getContextPath()%>/products/products.jsp" class="nav-item nav-link h6 text-white">Our Policies</a>
                <a href="<%=request.getContextPath()%>/reasons/reasons.jsp" class="nav-item nav-link h6 text-white">Why choose us?</a>
            </div>
        </nav>
        <div>
            <a href="<%=request.getContextPath()%>/Login" class="btn btn-light font-weight-bold" style="border-radius: 30px;">Login</a>
            <a class="btn bg-blue-700 text-white font-weight-bold" style="border-radius: 30px;" href="<%=request.getContextPath()%>/Register">Register</a>
        </div>
    </header>

    <!-- Form Section -->
    <div class="container">
        <div class="row" style="gap: 40px;">
            <div class="col rounded d-flex align-items-center"
                style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
                <form class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center"
                    action="<%=request.getContextPath()%>/Login" method="post">

                    <!-- Username Field -->
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" placeholder="User Name" name="username" />
                    </div>

                    <!-- Password Field with View Button -->
                    <div class="form-group position-relative">
                        <input type="password" class="form-control position-relative" id="password" placeholder="Password" name="password" />
                        <button type="button" class="btn btn-sm position-absolute" id="togglePassword"
                            style="right: 10px;top: 50%; transform: translateY(-50%); "><i class="fa-solid fa-eye"></i></button>

                        <%
                            String passwordErr = "";
                            if (request.getAttribute("errorMessage") != null) {
                                passwordErr = request.getAttribute("errorMessage").toString();
                            }
                        %>
                        <small id="passwordError" class="form-text text-danger"><%=passwordErr%></small>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn bg-blue-700 text-white font-weight-bold">Login</button>
                </form>
            </div>

            <!-- Image Section -->
            <div class="col p-5 rounded"
                style="background: url('https://cdn.dribbble.com/users/646089/screenshots/11459012/media/8af89ccb51ca9a851101ca57dc7430ce.gif') no-repeat center center; background-size: cover;">
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="sticky-bottom mt-5">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div>
    </footer>

    <!-- JS for Password Toggle -->
    <script>
        const passwordField = document.getElementById('password');
        const togglePasswordBtn = document.getElementById('togglePassword');

        togglePasswordBtn.addEventListener('click', function () {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="fa-solid fa-eye"></i>' : '<i class="fa-solid fa-eye-slash"></i>';
        });
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
