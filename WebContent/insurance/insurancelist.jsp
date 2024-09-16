<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insurance List</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<style>
header {
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
	
	
	<!-- -----------------------------------------------------------------------  -->
	
	
    <div class="container my-lg-3">
        <h1 class="text-white my-4 text-center">Your Insurances</h1>
        <table class="table table-bordered bg-white">
            <thead>
                <tr class="text-center bg-light">
                    <th>Vehicle Type</th>
                    <th>Policy Number</th>
                    <th>Start Date</th>
                    <th>Valid upto</th>
                    <th>IDV</th>
                    <th>Approval Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="insurance" items="${insuranceList}">
                <tr>
                    <td>${insurance.vehicleType}</td>
                    <td>${insurance.policyType}</td>
                    <td>${insurance.insuranceStartDate}</td>
                    <td>${insurance.insuranceEndDate}</td>
                    <td>${insurance.idv}</td>
                    <td>${insurance.insuranceApprovalStatus}</td>
                </tr>
            </c:forEach>
                <c:if test="${empty insuranceList}">
                    <tr>
                        <td colspan="6" class="text-center">No insurances found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
   
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
 <footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
