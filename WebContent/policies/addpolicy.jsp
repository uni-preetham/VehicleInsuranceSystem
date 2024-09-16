<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><c:out value="${policy != null ? 'Edit' : 'Add'}" /> Insurance Policy</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

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
    <div class="container">
        <div class="row" style="gap: 40px;">
            <div class="col p-5 rounded "
			style="min-height: 22em; background: url('https://acko-home-prod.ackoassets.com/next_assets/84d93d8b3944191e572285324f3086a970e1048e/_next/static/images/Sara-853a3edabf17a62181187aca0bbbc008.png') 
			no-repeat center center;background-size: contain;">
		</div>
            <div class="col rounded" style="gap: 20px; background-color: rgba(255, 255, 255, 0.8); min-height: 22em;">
                <form action="<%=request.getContextPath()%>/PolicyController?action=<c:out value="${policy != null ? 'updatepolicy' : 'insertpolicy'}" />"
                    method="post"
                    class="rounded py-5 px-5 mx-auto d-flex flex-column mx-auto align-items-center justify-content-center">

                    <!-- Hidden Field for Policy Number (Only for Edit) -->
                    <c:if test="${policy != null}">
                        <input type="hidden" name="policyNumber" value="${policy.policyNumber}">
                    </c:if>

                    <!-- Policy Type Field -->
                    <div class="form-group">
                        <label for="policyType">Policy Type</label>
                        <input type="text" class="form-control" id="policyType" name="policyType" 
                               value="<c:out value='${policy != null ? policy.policyType : ""}' />" required>
                    </div>
                    
                    <!-- Premium Amount Field -->
                    <div class="form-group">
                        <label for="premiumAmount">Premium Amount</label>
                        <input type="number" step="0.01" class="form-control" id="premiumAmount" name="premiumAmount" 
                               value="<c:out value='${policy != null ? policy.premiumAmount : ""}' />" required>
                    </div>

                    <!-- IDV Field -->
                    <div class="form-group">
                        <label for="idv">Insured Declared Value (IDV)</label>
                        <input type="number" step="0.01" class="form-control" id="idv" name="idv" 
                               value="<c:out value='${policy != null ? policy.idv : ""}' />" required>
                    </div>
                    
                    <button type="submit" class="btn text-white font-weight-bold" style="background-color: rgb(29, 78, 216);">
                        <c:out value="${policy != null ? 'Update' : 'Submit'}" />
                    </button>
                </form>
            </div>
        </div>
    </div>
 <footer class="sticky-bottom mt-5"> <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div></footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
