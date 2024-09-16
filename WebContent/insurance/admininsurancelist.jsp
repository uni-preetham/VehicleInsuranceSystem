<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>All User Insurances</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
.search-input {
	margin-bottom: 1rem;
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
	width: 100%;
}

.warning:hover {
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

	<div class="container">

		<div class="row">
			<div class="col d-flex align-items-center">
				<h1 class="text-white">All User Insurances</h1>
			</div>

			<div class="col">
				<!-- Search Input Field -->
				<div class="form-group search-input">
					<input type="text" id="searchInput"
						class="form-control  float-right w-50"
						placeholder="Search by keyword">
				</div>
			</div>
		</div>

		<!-- Insurance Table -->
		<table class="table table-bordered bg-light mt-3">
			<thead>
				<tr class="text-center">
					<th>User Name</th>
					<th>Insurance ID</th>
					<th>Vehicle Type</th>
					<th>Policy Type</th>
					<th>Insurance Start Date</th>
					<th>Valid upto</th>
					<th>IDV</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody id="insuranceTableBody">
				<c:forEach var="insurance" items="${allInsuranceList}">
					<tr class="text-center bg-white">
						<td>${insurance.userFname}</td>
						<td>${insurance.insuranceId}</td>
						<td>${insurance.vehicleType}</td>
						<td>${insurance.policyType}</td>
						<td>${insurance.insuranceStartDate}</td>
						<td>${insurance.insuranceEndDate}</td>
						<td>${insurance.idv}</td>
						<td><a
							href="<%=request.getContextPath()%>/UserInsuranceController?action=editinsurance&insuranceId=${insurance.insuranceId}"
							class="btn warning btn-sm">Renew</a> 
							<%-- <a
							href="<%=request.getContextPath()%>/UserInsuranceController?action=deleteinsurance&insuranceId=${insurance.insuranceId}"
							class="btn warning btn-sm">Reject</a> --%>
							</td>
					</tr>
				</c:forEach>
				<c:if test="${empty allInsuranceList}">
					<tr>
						<td colspan="8" class="text-center">No insurances found.</td>
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

	<!-- JavaScript for Filtering -->
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('searchInput');
        const tableBody = document.getElementById('insuranceTableBody');

        function filterTable() {
            const searchTerm = searchInput.value.toLowerCase();
            const rows = tableBody.getElementsByTagName('tr');

            for (let row of rows) {
                const cells = row.getElementsByTagName('td');
                let match = false;

                for (let cell of cells) {
                    if (cell.textContent.toLowerCase().includes(searchTerm)) {
                        match = true;
                        break;
                    }
                }

                row.style.display = match ? '' : 'none';
            }
        }

        searchInput.addEventListener('input', filterTable);
    });
</script>

</body>
</html>
