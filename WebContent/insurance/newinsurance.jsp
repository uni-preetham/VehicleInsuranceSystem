<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Insurance</title>
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
	
	
    <div class="container">
        <div class="row" style="gap: 40px;">
            <div class="col p-5 rounded "
			style="min-height: 22em; background: url('https://acko-home-prod.ackoassets.com/next_assets/84d93d8b3944191e572285324f3086a970e1048e/_next/static/images/Sara-853a3edabf17a62181187aca0bbbc008.png') 
			no-repeat center center;background-size: contain;">
		</div>
		
		 
            <div class="col rounded" style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
                <form action="<%=request.getContextPath()%>/UserInsuranceController" method="post"
                      class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center">
 <input type="hidden" name="action" value="buyinsurance">
 					<c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${errorMessage}" />
                        </div>
                    </c:if>
 
                    <!-- Vehicle ID Field -->
                    <div class="form-group">
                        <label for="vehicle_id">Vehicle ID</label>
                        <input type="number" style="width: 230px;" class="form-control" id="vehicle_id" name="vehicle_id" required>
                    </div>
                    
                    <!-- Policy Type Dropdown -->
                    <div class="form-group">
                        <label for="policy_type">Policy Type</label>
                        <select class="form-control" id="policy_type" name="policy_type" required>
                        <option value="" disabled selected>Select policy</option>
                            <c:forEach var="policy" items="${sessionScope.users_policyTypes}">
                                <option value="${policy.policyNumber}">${policy.policyType}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn text-white font-weight-bold" style="background-color: rgb(29, 78, 216);">Buy</button>
                </form>
            </div>
        </div>
    </div>
    <br/>

      <footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
