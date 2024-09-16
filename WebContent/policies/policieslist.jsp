<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Policies</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
.form-group {
	width: 100%;
}

.bg-blue-700 {
	background-color: rgb(29, 78, 216);
}

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
	<div class="container my-lg-3">
	<div class="row">
            <div class="col d-flex align-items-center">
                <h1 class="text-white mb-lg-3">Insurance Policies</h1>
            </div>
            <div class="col">
                <!-- Search Input Field -->
                <div class="form-group search-input">
                    <a href="<%=request.getContextPath()%>/policies/addpolicy.jsp"
			class="float-right btn  bg-blue-700 text-white font-weight-bold"
			style="border-radius: 40px; margin: 10px 0;">Add New Policy</a>
                </div>
            </div>
        </div>
        
		

		<!-- Policy Table -->
		<table class="table table-bordered bg-light">
			<thead>
				<tr class="text-center bg-light">
					<th>Policy Number</th>
					<th>Policy Type</th>
					<th>Premium Amount</th>
					<th>IDV</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="policy" items="${policyList}">
					<tr class="text-center bg-white">
						<td>${policy.policyNumber}</td>
						<td>${policy.policyType}</td>
						<td>${policy.premiumAmount}</td>
						<td>${policy.idv}</td>
						<td><a
							href="PolicyController?action=editpolicy&policyNumber=${policy.policyNumber}"
							class="warning">Edit</a> <a
							href="PolicyController?action=deletepolicy&policyNumber=${policy.policyNumber}"
							class="danger">Delete</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty policyList}">
					<tr>
						<td colspan="6">No policies found.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<br/>
	<br/>

	<footer class="sticky-bottom mt-5">
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham
			A A. All rights reserved.</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
