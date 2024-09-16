<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy/Renew Vehicle Insurance Online</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
	
	
	<style>
	.warning {
	border: 2px solid #14A44D;
	border-radius: 30px;
	color: #14A44D;
	text-decoration: none;
	padding: 4px 16px;
	font-weight: bold;
	width: 40%;
}

header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
}

.warning:hover {
	border: 2px solid #14A44D;
	background: #14A44D;
	color: white;
	text-decoration: none;
	transition: 0.5s ease;
	background: #14A44D;
}

.danger {
	border: 2px solid #14A44D;
	border-radius: 30px;
	color: #14A44D;
	text-decoration: none;
	padding: 4px 16px;
	font-weight: bold;
	width: 50%;
}

.danger:hover {
	border: 2px solid #14A44D;
	background: #14A44D;
	color: white;
	text-decoration: none;
	transition: 0.5s ease;
	background: #14A44D;
}

	</style>
</head>
<body class="bg-success mx-auto">
	<header
		class="container d-flex justify-content-between align-items-center my-lg-3">
	<a class="text-white font-weight-bold h3 nav-link"
		href="<%=request.getContextPath()%>/landing.jsp">AutoX</a> <nav
		class="navbar navbar-expand-sm">
	<div class="navbar-nav">
		<a class="nav-item nav-link h6 text-white"
			href="<%=request.getContextPath()%>/home/home.jsp">Home</a>
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
	

	<section class="container rounded">
	<h1 class="text-center text-white my-4">Vehicle List</h1>
	<table class="table bg-white table-bordered rounded">
		<thead class="text-center bg-light">
			<th>Vehicle ID</th>
			<th>Vehicle Type</th>
			<th>Vehicle Color</th>
			<th>Vehicle Plate Number</th>
			<th>Registration Date</th>
			<th>Actions</th>
		</thead>
		<tbody>
			<c:forEach var="vehicle" items="${vehicleList}">
				<tr>
					<td>${vehicle.vehicleId}</td>
					<td><c:out value="${vehicle.vehicleType}" /></td>
					<td>${vehicle.vehicleColor}</td>
					<td>${vehicle.vehiclePlateNumber}</td>
					<td>${vehicle.vehicleRegistrationDate}</td>
					<td>

					<a class="btn warning font-weight-bold" href="edit?vehicle_id=<c:out value='${vehicle.vehicleId}' />">
					Edit
					</a>
					<a class="btn danger font-weight-bold" href="remove?vehicle_id=<c:out value='${vehicle.vehicleId}' />">
					Remove
					</a>
					</td>

				</tr>
			</c:forEach>
			<c:if test="${empty vehicleList}">
                    <tr>
                        <td colspan="5" class="text-center">No vehicles found.</td>
                    </tr>
                </c:if>
		</tbody>
	</table>
	</section>
 <footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>