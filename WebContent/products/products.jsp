<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insurance Policies</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
.card {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease-in-out, background 0.3s ease-in-out;
	backdrop-filter: blur(10px);
}

.card:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: scale(1.05);
}

.card-body {
	position: relative;
	padding: 20px;
}

.card-title {
	font-size: 1.5rem;
	font-weight: bold;
}

.card-text {
	opacity: 0;
	visibility: hidden;
	transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
}

.card:hover .card-text {
	opacity: 1;
	visibility: visible;
}

.card h2 {
	margin-bottom: 0;
}

.navbar-nav .nav-link:hover {
	color: hsl(134, 62%, 28%) !important;
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
	</nav> </header>


	<div class="container mt-5">
		<h1 class="text-center mb-4 text-white text-center">Our Insurance
			Policies</h1>

		<div class="row">
			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">Liability Insurance</h2>
						<p class="card-text text-justify">Protect yourself from
							financial loss due to legal claims. Our Liability Insurance
							covers bodily injury and property damage to others, ensuring you
							are safeguarded against unforeseen accidents and legal expenses.
							Whether it's a minor fender-bender or a major incident, we've got
							you covered.</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">Collision Insurance</h2>
						<p class="card-text text-justify">Drive with confidence
							knowing that our Collision Insurance will take care of your
							vehicle repairs or replacement costs in the event of an accident.
							This coverage is essential for protecting your investment,
							regardless of who is at fault. Get back on the road quickly and
							without financial strain.</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">Comprehensive
							Insurance</h2>
						<p class="card-text text-justify">Experience complete
							protection with our Comprehensive Insurance. This policy covers a
							wide range of incidents beyond collisions, including theft,
							vandalism, natural disasters, and more. Safeguard your vehicle
							against all potential risks and enjoy the freedom of worry-free
							driving.</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white mb-2">
						<h2 class="card-title text-center mb-2">Personal Insurance</h2>
						<p class="card-text text-justify">Your well-being is our
							priority. Our Personal Insurance plans offer comprehensive
							coverage for medical expenses, lost wages, and other personal
							losses resulting from an accident. Ensure peace of mind for you
							and your loved ones with our tailored personal insurance
							solutions.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="sticky-bottom mt-5">
	<div class="text-center p-3"
		style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A
		A. All rights reserved.</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
