<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insurance Q&A</title>
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

header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
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
		<h1 class="text-center mb-4 text-white">Insurance Q&A</h1>

		<div class="row">
			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">Why should people
							take insurance?</h2>
						<p class="card-text text-justify">Insurance provides financial
							protection against unexpected events. It helps cover the costs of
							accidents, illnesses, and other unforeseen circumstances,
							ensuring that you and your loved ones are not burdened with
							significant expenses. By taking insurance, you can have peace of
							mind knowing that you are prepared for the unexpected.</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">What happens when I
							give or take insurance?</h2>
						<p class="card-text text-justify">When you take insurance, you
							enter into a contract with an insurance company. You pay a
							premium, and in return, the insurance company agrees to cover
							certain risks as specified in the policy. If an insured event
							occurs, you can file a claim, and the insurance company will
							provide compensation according to the terms of the policy. When
							you give insurance, you are essentially providing this financial
							protection to others.</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">How many plans are
							available? What kinds of plans are there?</h2>
						<p class="card-text text-justify">There are various types of
							insurance plans available to meet different needs. Some common
							types include:</p>
						<ul class="card-text text-justify">
							<li><strong>Health Insurance:</strong> Covers medical
								expenses for illnesses and injuries.</li>
							<li><strong>Life Insurance:</strong> Provides financial
								support to beneficiaries in the event of the policyholder's
								death.</li>
							<li><strong>Auto Insurance:</strong> Covers damages and
								liabilities related to vehicle accidents.</li>
							<li><strong>Home Insurance:</strong> Protects against
								damages to your home and personal property.</li>
							<li><strong>Travel Insurance:</strong> Covers trip-related
								risks such as cancellations, medical emergencies, and lost
								luggage.</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card h-100">
					<div class="card-body text-white">
						<h2 class="card-title text-center mb-2">Is taking insurance
							good?</h2>
						<p class="card-text text-justify">Yes, taking insurance is
							generally a good idea. It provides a safety net that can help you
							manage financial risks and uncertainties. While it requires
							paying premiums, the benefits of having coverage in times of need
							often outweigh the costs. Insurance can help you avoid
							significant financial hardship and ensure that you and your loved
							ones are protected.</p>
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
