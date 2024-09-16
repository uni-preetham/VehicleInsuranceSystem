<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Insurance</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<style>
header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
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
    
    <!-- -------------------------------------------- -->
    
    
    <div class="container">
        <div class="row" style="gap: 40px;">
            <div class="col p-5 rounded "
			style="min-height: 22em; background: url('https://acko-home-prod.ackoassets.com/next_assets/84d93d8b3944191e572285324f3086a970e1048e/_next/static/images/Sara-853a3edabf17a62181187aca0bbbc008.png') 
			no-repeat center center;background-size: contain;">
		</div>
            <div class="col rounded"  style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
               <form action="<%=request.getContextPath()%>/UserInsuranceController?action=updateinsurance" method="post" 
                      class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center">
 <input type="hidden" name="action" value="buyinsurance">
 					<c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${errorMessage}" />
                        </div>
                    </c:if>
 
                     <input type="hidden" name="insuranceId" value="${existingInsurance.insuranceId}">
                    <!-- Policy Type Dropdown -->
                    <div class="form-group">
                        <label for="policy_type">Policy Type</label>
                        <select class="form-control" id="policy_type" name="policy_type" required>
                            <c:forEach var="policy" items="${sessionScope.users_policyTypes}">
                                <option value="${policy.policyNumber}">${policy.policyType}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Insurance Start Date Field -->
                    <div class="form-group">
                        <label for="insurance_start_date">Insurance Start Date</label>
                        <input type="date" style="width: 230px;" class="form-control" id="insurance_start_date" name="insurance_start_date" required>
                    </div>


                    <button type="submit" class="btn text-white font-weight-bold" style="background-color: rgb(29, 78, 216);">Update</button>
                </form>
            </div>
        </div>
    </div>

	<br />
	<br />
 <footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>    
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
