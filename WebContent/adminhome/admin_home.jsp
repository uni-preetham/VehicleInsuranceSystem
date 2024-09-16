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
header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
}

svg {
	height: 200px;
	width: 200px;
	margin: auto;
	padding: 30px 20px;
}
.btns {
	border: 2px solid rgb(29, 78, 216);
	border-radius: 40px;
	font-weight: bold;
	color: white;
background-color: rgba(29, 78, 216, 1);
	padding: 4px 16px;
}

.btns:hover{
background-color: rgba(29, 78, 216, 0);
	color: rgb(29, 78, 216);
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
	
		<!-- ---------------------------------------------------------------------------------- -->


	<section class="container d-flex justify-content-around"
		style="gap:40px">
	<div class="card" style="width: 18rem; background: rgba(255,255,255,0.8);">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
		<path
			d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z" /></svg>
		<div class="card-body">
			<h5 class="card-title">User Management</h5>
			<p class="card-text">Manage user accounts</p>
			<a href="<%=request.getContextPath()%>/userlist"
				class="btn btns">Go to User List</a>
		</div>
	</div>


	<div class="card" style="width: 18rem; background: rgba(255,255,255,0.8);">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
		<path
			d="M135.2 117.4L109.1 192l293.8 0-26.1-74.6C372.3 104.6 360.2 96 346.6 96L165.4 96c-13.6 0-25.7 8.6-30.2 21.4zM39.6 196.8L74.8 96.3C88.3 57.8 124.6 32 165.4 32l181.2 0c40.8 0 77.1 25.8 90.6 64.3l35.2 100.5c23.2 9.6 39.6 32.5 39.6 59.2l0 144 0 48c0 17.7-14.3 32-32 32l-32 0c-17.7 0-32-14.3-32-32l0-48L96 400l0 48c0 17.7-14.3 32-32 32l-32 0c-17.7 0-32-14.3-32-32l0-48L0 256c0-26.7 16.4-49.6 39.6-59.2zM128 288a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm288 32a32 32 0 1 0 0-64 32 32 0 1 0 0 64z" /></svg>
		<div class="card-body">
			<h5 class="card-title">User Vehicle Insurance</h5>
			<p class="card-text">Manage user insurance</p>
			<a
				href="<%=request.getContextPath()%>/UserInsuranceController?action=showallinsurances"
				class="btn btns">Go to Insurance List</a>
		</div>
	</div>

	<div class="card" style="width: 18rem; background: rgba(255,255,255,0.8);">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
		<path
			d="M0 64C0 28.7 28.7 0 64 0L224 0l0 128c0 17.7 14.3 32 32 32l128 0 0 288c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 64zm384 64l-128 0L256 0 384 128z" /></svg>
		<div class="card-body">
			<h5 class="card-title">Insurance Policies</h5>
			<p class="card-text">Manage insurance policies</p>
			<a href="<%=request.getContextPath()%>/PolicyController"
				class="btn btns">Manage policies</a>
		</div>
	</div>
	
	<div class="card" style="width: 18rem; background: rgba(255,255,255,0.8);">
		<svg fill="#000000" viewBox="0 0 32 32" id="icon" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><defs><style>.cls-1{fill:none;}</style></defs><title>policy</title><path d="M30,18A6,6,0,1,0,20,22.46v7.54l4-1.8926,4,1.8926V22.46A5.98,5.98,0,0,0,30,18Zm-4,8.84-2-.9467L22,26.84V23.65a5.8877,5.8877,0,0,0,4,0ZM24,22a4,4,0,1,1,4-4A4.0045,4.0045,0,0,1,24,22Z"></path><rect x="9" y="14" width="7" height="2"></rect><rect x="9" y="8" width="10" height="2"></rect><path d="M6,30a2.0021,2.0021,0,0,1-2-2V4A2.0021,2.0021,0,0,1,6,2H22a2.0021,2.0021,0,0,1,2,2V8H22V4H6V28H16v2Z"></path><rect id="_Transparent_Rectangle_" data-name="<Transparent Rectangle>" class="cls-1" width="32" height="32"></rect></g></svg>
		<div class="card-body">
			<h5 class="card-title">Pending applications</h5>
			<p class="card-text">Manage pending insurance</p>
			<a href="<%=request.getContextPath()%>/AdminInsuranceApproval?action=showPendingInsurances"
				class="btn btns">Show Pending</a>
		</div>
	</div>



	</section>
	<br/>
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