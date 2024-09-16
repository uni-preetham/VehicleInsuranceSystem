<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Buy/Renew Vehicle Insurance Online</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />

<style>
.text-blue-700 {
	color: rgb(29, 78, 216);
}

.bg-blue-700 {
	background-color: rgb(29, 78, 216);
}

header{
background-color: rgba(255, 255, 255, 0.3);
border-radius: 40px;
}

.cards {
	gap: 40px;
	margin: 10px 0;
}

.button {
	border: 2px solid #14A44D;
	border-radius: 30px;
	color: #14A44D;
	text-decoration: none;
	padding: 8px 16px;
	font-weight: bold;
}

.button:hover {
	border: 2px solid #14A44D;
	background: #14A44D;
	color: white;
	text-decoration: none;
	transition: 0.5s ease;
	background: #14A44D;
}

.navbar-nav .nav-link:hover {
	color: hsl(134, 62%, 28%) !important;
}
</style>

	<!-- ---------------------------------------------------------------------------------- -->

</head>
<body class="bg-success">

	<header
		class="container d-flex justify-content-between align-items-center my-lg-3">
	<a class="text-white font-weight-bold h3 nav-link"
		href="<%=request.getContextPath()%>/landing.jsp">AutoX</a> <nav
		class="navbar navbar-expand-sm">
	<div class="navbar-nav">
		<a class="nav-item nav-link h6 text-white"
			href="<%=request.getContextPath()%>/home/home.jsp">Home</a>
		<!-- Vehicle Details Dropdown -->
		<div class="nav-item dropdown">
			<a class="nav-link dropdown-toggle h6 text-white" href="#"
				id="vehicleDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Vehicle Details </a>
			<div class="dropdown-menu" aria-labelledby="vehicleDropdown">
				<a class="dropdown-item" href="<%=request.getContextPath()%>/list">Show Vehicles</a> <a class="dropdown-item"
					href="<%=request.getContextPath()%>/vehicle/vehicle.jsp">Register
					your Vehicles</a>
			</div>
		</div>

		<!-- Insurance Details Dropdown -->
		<div class="nav-item dropdown">
			<a class="nav-link dropdown-toggle h6 text-white" href="#"
				id="insuranceDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Insurance Details </a>
			<div class="dropdown-menu" aria-labelledby="insuranceDropdown">
			 <a class="dropdown-item"
					href="<%=request.getContextPath()%>/UserInsuranceController?action=showinsurances">Show
					Insurances</a>
				<a class="dropdown-item"
					href="<%=request.getContextPath()%>/UserInsuranceController?action=buyinsurance">Buy
					an Insurance</a>
			</div>
		</div>
		<div class="nav-item dropdown">
			<a class="nav-link dropdown-toggle h6 text-white" href="#"
				id="insuranceDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Details </a>
			<div class="dropdown-menu" aria-labelledby="insuranceDropdown">
				<a href="<%=request.getContextPath()%>/products/products.jsp"
					class="dropdown-item">Our Policies</a> <a
					href="<%=request.getContextPath()%>/reasons/reasons.jsp"
					class="dropdown-item">Why choose us?</a>
			</div>
		</div>
	</div>
	</nav>
	<div>
		<a href="<%=request.getContextPath()%>/logout"
			class="btn btn-light font-weight-bold" style="border-radius: 30px;">Logout</a>
	</div>
	</header>



	<!-- ---------------------------------------------------------------------------------- -->

	<section class="container">
	<div class="row" style="gap: 40px;">
		<div class="col p-5 rounded h-100 "
			style="min-height: 22em; background: url('https://central-frontend-prod.ackoassets.com/_next_static/images/building-block-assets/desktop-infographic.svg') no-repeat center center; background-size: contain;";
background-size:cover;
></div>


		<div
			class="col p-5 d-flex flex-column align-items-center justify-content-center rounded"
			style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
			<%
				String userfname = session.getAttribute("userfname").toString();
			%>
			<h1 class="text-dark">${userfname}'s Dashboard</h1>

			<div class="cards d-flex flex-row">

				<a href="<%=request.getContextPath()%>/vehicle/vehicle.jsp"
					class="button">Register Vehicle </a> <a
					href="<%=request.getContextPath()%>/UserInsuranceController?action=buyinsurance"
					class="button"> Buy Insurance </a>

			</div>
		</div>
	</div>
	</section>
	<br/>

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
