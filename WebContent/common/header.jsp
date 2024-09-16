<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
.bg-blue-700 {
	background-color: rgb(29, 78, 216);
}

.navbar-nav .nav-link:hover {
	color: hsl(134, 62%, 28%) !important;
}

header {
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 30px;
}
</style>
</head>
<body class="bg-success">
	<header
		class="d-flex justify-content-between align-items-center my-lg-3 px-5 container">
	<a class="text-white font-weight-bold h3 nav-link"
		href="<%=request.getContextPath()%>/landing.jsp">AutoX</a> <nav
		class="navbar navbar-expand-sm">
	<div class="navbar-nav">
		<a class="nav-item nav-link h6 text-white"
			href="<%=request.getContextPath()%>/landing.jsp">Home</a> <a
			class="nav-item nav-link h6 text-white"
			href="<%=request.getContextPath()%>/products/products.jsp">Our
			Policies</a> <a class="nav-item nav-link h6 text-white"
			href="<%=request.getContextPath()%>/reasons/reasons.jsp">Why
			choose us?</a>
	</div>
	</nav>
	<div>
		<a href="<%=request.getContextPath()%>/Login"
			class="btn btn-light font-weight-bold">Login</a> <a
			class="btn bg-blue-700 text-white font-weight-bold"
			href="<%=request.getContextPath()%>/Register">Register</a>
	</div>
	</header>

	<hr>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>