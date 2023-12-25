<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>




	<div class="container">
		<!-- Image and text -->
		<c:if test="${not empty userobj }">
		<nav class="navbar navbar-light justify-content-center">
			<a class="navbar-brand" href=""> <img
				src="assets/logos/mainLogo.png" width="30" height="30"
				class="d-inline-block align-top" alt=""> E-Book Application
				--> Welcome , <span class="text-primary">${userobj.fullName }</span> to ur
				dashboard
			</a>
		</nav>
		</c:if>


		<div class="row p-5">
			<!-- Profile Card  -->
			<div class="col-md-12">
				<a href="profiledetails.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa fa-id-card fa-2x" aria-hidden="true"></i>
							</div>
							<h4 class="text-info">Profile Details</h4>
							<p class="text-info">Edit your details</p>
						</div>
					</div>
				</a>
			</div>
		
		
		
		
			<!--Add Old Book Card  -->
			<div class="col-md-6 mt-3">
				<a href="selloldbooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa fa-book fa-2x" aria-hidden="true"></i>
							</div>
							<h4 class="text-primary">Your Old Book Section</h4>
							<p class="text-primary">Sell Old Books</p>
						</div>
					</div>
				</a>
			</div>
			
			<!--Edit Old Book Card  -->
			<div class="col-md-6 mt-3">
				<a href="editselloldbooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa fa-book fa-2x" aria-hidden="true"></i>
							</div>
							<h4 class="text-primary">Edit Old Books</h4>
							<p class="text-primary">Status of Old Books</p>
						</div>
					</div>
				</a>
			</div>
			
			


		

			<!-- Address Card  -->
			<div class="col-md-4 mt-3">
				<a href="addressdetails.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>
							</div>
							<h4 class="text-warning">Address Details</h4>
							<p class="text-warning">Edit Address</p>
						</div>
					</div>
				</a>
			</div>


			<!-- My Orders Card-->
			<div class="col-md-4 mt-3">
				<a href="myorders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa fa-gift fa-2x" aria-hidden="true"></i>
							</div>
							<h4 class="text-danger">My Orders</h4>
							<p class="text-danger">Track your Orders</p>
						</div>
					</div>
				</a>
			</div>


			<!-- Help Center Card  -->
			<div class="col-md-4 mt-3">
				<a href="customersupp.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-dark">
								<i class="fa fa-cogs fa-2x" aria-hidden="true"></i>
							</div>
							<h4 class="text-dark">Customer Support</h4>
							<p class="text-dark">24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>