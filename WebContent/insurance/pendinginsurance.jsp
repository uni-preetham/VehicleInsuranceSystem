<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pending Insurance Requests</title>
    
    <!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />    

<style>
header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
}

.warning {
	border: 2px solid #14A44D;
	border-radius: 30px;
	color: #14A44D;
	text-decoration: none;
	padding: 4px 16px;
	font-weight: bold;
	width: 40%;
}

.warning:hover {
	border: 2px solid #14A44D;
	background: #14A44D;
	color: white;
	text-decoration: none;
	transition: 0.5s ease;
	background: #14A44D;
}
/* 
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
} */
</style>
</head>
<body class="bg-success">
<header
		class="container d-flex justify-content-between align-items-center my-lg-3">
		<a class="text-white font-weight-bold h3 nav-link"
			href="<%=request.getContextPath()%>/landing.jsp">AutoX</a>
		<nav class="navbar navbar-expand-sm">
			<div class="navbar-nav">
				<a class="nav-item nav-link h6 text-white"
					href="<%=request.getContextPath()%>/adminhome/admin_home.jsp">Home</a> <a
					href="<%=request.getContextPath()%>/products/products.jsp"
					class="nav-item nav-link h6 text-white">Our Policies</a> <a
					href="<%=request.getContextPath()%>/reasons/reasons.jsp"
					class="nav-item nav-link h6 text-white">Why choose us?</a>
			</div>
		</nav>
		<div>
			<a href="<%=request.getContextPath()%>/logout"
				class="btn btn-light font-weight-bold" style="border-radius: 30px;">Logout</a>

		</div>
	</header>
	
	<!-- ------------------------------------------------- -->

<div class="container my-lg-3">
    <h2 class="mb-4 text-white">Pending Insurance Requests</h2>
    <table class="table table-bordered bg-white">
        <thead>
            <tr class="text-center text-dark bg-light">
                <th>Insurance ID</th>
                <th>Policy Number</th>
                <th>Vehicle ID</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Validity</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="insurance" items="${pendingInsuranceList}">
                <tr>
                    <td>${insurance.insuranceId}</td>
                    <td>${insurance.policyNumber}</td>
                    <td>${insurance.vehicleId}</td>
                    <td>${insurance.insuranceStartDate}</td>
                    <td>${insurance.insuranceEndDate}</td>
                    <td>${insurance.insuranceValidity}</td>
                    <td>
                        <form action="AdminInsuranceApproval" method="post">
                            <input type="hidden" name="insurance_id" value="${insurance.insuranceId}" />
                            <button type="submit" name="action" value="approve" class="btn warning btn-sm">Approve</button>
                            <button type="submit" name="action" value="reject" class="btn warning btn-sm">Reject</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty pendingInsuranceList}">
                    <tr>
                        <td colspan="7" class="text-center">No insurances found.</td>
                    </tr>
                </c:if>
        </tbody>
    </table>
</div>

<br/>
<br/>
<br/>
<br/>
<footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>  
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
