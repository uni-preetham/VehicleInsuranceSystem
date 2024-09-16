<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy/Renew Vehicle Insurance Online</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />

<style>
#hero_img {
	height: 100%;
	width: 100%;
	object-fit: cover;
	border-radius: 5%;
}

.text-blue-700 {
	color: rgb(29, 78, 216);
}

.bg-blue-700 {
	background-color: rgb(29, 78, 216);
}

.navbar-nav .nav-link:hover {
	color: hsl(134, 62%, 28%) !important;
}

header{
background-color: rgba(255, 255, 255, 0.3);
border-radius: 40px;
}


</style>


	
	<!-- ---------------------------------------------------------------------------------- -->
	
</head>
<body class="bg-success">
	<header
		class="container d-flex justify-content-between align-items-center my-lg-3 ">
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
	

	<section class="hero container">
	<div class="row align-items-center">
		<div class="col-md-6 d-flex justify-content-center">
			<img id="hero_img" class="img-fluid mx-auto"
				src="https://cdn.dribbble.com/users/646089/screenshots/11459012/media/8af89ccb51ca9a851101ca57dc7430ce.gif"
				alt="" />
		</div>
		<div class="col-md-6 d-flex flex-column justify-content-center">
			<h1 class="text-white font-weight-bold">
				Need your car<br /> <span class="text-blue-700">insured</span>?
			</h1>
			<p class="lead text-white font-weight-normal text-justify">
				Secure your vehicle with our all-inclusive insurance plans. Enjoy
				peace of mind and dependable coverage for every mile you drive.</p>
		</div>
	</div>
	</section>


	<footer class="sticky-bottom mt-5">
	<div class="text-center p-3"
		style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A
		A. All rights reserved.</div>
	</footer>
	
	
	
	<!-- ---------------------------------------------------------------------------------- -->
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>