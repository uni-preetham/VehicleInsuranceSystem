<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Buy/Renew Vehicle Insurance Online</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

<style>
.bg-blue-700 {
    background-color: rgb(29, 78, 216);
}

.navbar-nav .nav-link:hover {
    color: hsl(134, 62%, 28%) !important;
}

header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
}

.form-text.text-danger {
    display: none;
}

.form-text.text-danger.visible {
    display: block;
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

<section class="container">
    <div class="row" style="gap: 40px;">
        <div class="col rounded" style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
            <form action="<%=request.getContextPath()%>/${existingVehicle != null ? 'update' : 'insert'}"
                  class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center"
                  method="post" onsubmit="return validateForm();">

                <c:if test="${existingVehicle != null}">
                    <input type="hidden" name="vehicle_id" value="${existingVehicle.vehicleId}" />
                </c:if>

                <!-- Vehicle Type Field -->
                <div class="form-group">
                    <input type="text" class="form-control" id="vehicle_type" placeholder="Enter vehicle type" name="vehicle_type"
                           value="${existingVehicle != null ? existingVehicle.vehicleType : ''}" />
                    <small class="form-text text-danger" id="vehicleTypeError">Vehicle Type is required.</small>
                </div>

                <!-- Vehicle Color Field -->
                <div class="form-group">
                    <input type="text" class="form-control" id="vehicle_color" placeholder="Enter vehicle color" name="vehicle_color"
                           value="${existingVehicle != null ? existingVehicle.vehicleColor : ''}" />
                    <small class="form-text text-danger" id="vehicleColorError">Vehicle Color is required.</small>
                </div>

                <!-- Vehicle Plate Number Field -->
                <div class="form-group">
                    <input type="text" class="form-control" id="vehicle_plate_number" placeholder="Enter registration number"
                           name="vehicle_plate_number"
                           value="${existingVehicle != null ? existingVehicle.vehiclePlateNumber : ''}" />
                    <small id="plateNumberError" class="form-text text-danger">Invalid plate number.</small>
                </div>

                <!-- Vehicle Registration Date Field -->
                <div class="form-group">
                    <input type="date" class="form-control" style="width: 200px;" id="vehicle_registration_date" name="vehicle_registration_date" 
                           value="${existingVehicle != null ? existingVehicle.vehicleRegistrationDate : ''} " max=""/>
                    <small class="form-text text-danger" id="registrationDateError">Vehicle Registration Date is required.</small>
                </div>

                <button type="submit" class="btn bg-blue-700 text-white font-weight-bold">Register</button>
            </form>
        </div>
        <div class="col p-5 rounded "
             style="min-height: 22em; background: url('https://acko-home-prod.ackoassets.com/next_assets/84d93d8b3944191e572285324f3086a970e1048e/_next/static/images/Saif-402b5e2dc15cc063fd28db9dc3d7f18b.png') 
             no-repeat center center;background-size: contain;">
        </div>
    </div>
</section>
<br/>
<footer class="sticky-bottom mt-5">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div>
</footer>

<script>
// Set the max attribute of the date input to today's date
document.addEventListener('DOMContentLoaded', function () {
    const dateField = document.getElementById('vehicle_registration_date');
    const today = new Date().toISOString().split('T')[0];
    dateField.setAttribute('max', today);
});

// Real-time validation
function validateRegistrationDate() {
    const registrationDateField = document.getElementById('vehicle_registration_date');
    const registrationDateError = document.getElementById('registrationDateError');
    const today = new Date().toISOString().split('T')[0];

    if (registrationDateField.value === '' || registrationDateField.value > today) {
        registrationDateError.classList.add('visible');
    } else {
        registrationDateError.classList.remove('visible');
    }
}

    // Validate as the user types
    document.getElementById('vehicle_type').addEventListener('input', validateVehicleType);
    document.getElementById('vehicle_color').addEventListener('input', validateVehicleColor);
    document.getElementById('vehicle_plate_number').addEventListener('input', validatePlateNumber);
    document.getElementById('vehicle_registration_date').addEventListener('input', validateRegistrationDate);

    function validateVehicleType() {
        const vehicleTypeField = document.getElementById('vehicle_type');
        const vehicleTypeError = document.getElementById('vehicleTypeError');
        if (vehicleTypeField.value.trim() === '') {
            vehicleTypeError.classList.add('visible');
        } else {
            vehicleTypeError.classList.remove('visible');
        }
    }

    function validateVehicleColor() {
        const vehicleColorField = document.getElementById('vehicle_color');
        const vehicleColorError = document.getElementById('vehicleColorError');
        if (vehicleColorField.value.trim() === '') {
            vehicleColorError.classList.add('visible');
        } else {
            vehicleColorError.classList.remove('visible');
        }
    }

    function validatePlateNumber() {
        const plateNumberField = document.getElementById('vehicle_plate_number');
        const plateNumberError = document.getElementById('plateNumberError');
        const plateNumberRegex = /^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$/;
        if (!plateNumberRegex.test(plateNumberField.value.trim())) {
            plateNumberError.classList.add('visible');
        } else {
            plateNumberError.classList.remove('visible');
        }
    }

    function validateRegistrationDate() {
        const registrationDateField = document.getElementById('vehicle_registration_date');
        const registrationDateError = document.getElementById('registrationDateError');
        if (registrationDateField.value.trim() === '') {
            registrationDateError.classList.add('visible');
        } else {
            registrationDateError.classList.remove('visible');
        }
    }

    function validateForm() {
        validateVehicleType();
        validateVehicleColor();
        validatePlateNumber();
        validateRegistrationDate();

        return document.querySelectorAll('.form-text.text-danger.visible').length === 0;
    }
    
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
