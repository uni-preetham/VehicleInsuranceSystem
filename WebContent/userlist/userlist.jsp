<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buy/Renew Vehicle Insurance Online</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
    .warning {
	border: 2px solid #14A44D;
	border-radius: 30px;
	color: #14A44D;
	text-decoration: none;
	padding: 4px 16px;
	font-weight: bold;
	width: 40%;
}

header {
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 40px;
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

.search-input {
	margin-bottom: 1rem;
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

    <div class="container">
        <div class="row">
            <div class="col d-flex align-items-center">
                <h1 class="text-white">User List</h1>
            </div>
            <div class="col">
                <!-- Search Input Field -->
                <div class="form-group search-input">
                    <input type="text" id="searchInput" class="form-control float-right w-50" placeholder="Search by keyword">
                </div>
            </div>
        </div>
        <table class="table table-bordered bg-light mt-3">
            <thead>
                <tr class="text-center">
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <c:forEach var="user" items="${usersList}">
                    <tr class="text-center bg-white">
                        <td>${user.userId}</td>
                        <td>${user.userFname}</td>
                        <td>${user.userLname}</td>
                        <td>${user.username}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.userPhone}</td>
                        <td>
                            <a href="userlist?action=edit&userId=${user.userId}" class="btn warning">Edit</a>
                            <a href="userlist?action=delete&userId=${user.userId}" class="btn danger">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty usersList}">
                    <tr>
                        <td colspan="7" class="text-center">No users found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>

    <footer class="sticky-bottom mt-5">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">© 2024 Preetham A A. All rights reserved.</div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript for Filtering -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('searchInput');
        const tableBody = document.getElementById('userTableBody');

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
