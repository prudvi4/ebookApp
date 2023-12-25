<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot UserName : E-Book Application</title>

<%@ include file="all_component/allcss.jsp"%>
</head>
<body>

	<!-- Navbar for only for Forgot Username So creating different Navbar for this -->

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-3">
				<!-- Image and text -->
				<nav class="navbar navbar-light">
					<a class="navbar-brand" href=""> <img
						src="assets/logos/mainLogo.png" width="30" height="30"
						class="d-inline-block align-top" alt=""> E-Book
						Application-Forgot UserName
					</a>
				</nav>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary bg-custom">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href=""><i
						class="fa fa-home m-1" aria-hidden="true"></i>Home <span
						class="sr-only">(current)</span> </a></li>
			</ul>
			<div class="col-md-1">
				<a href="login.jsp" class="btn btn-danger"><i class="fa fa-sign-out m-1"
					aria-hidden="true"></i>Login</a>
			</div>
		</div>
	</nav>

	<!-- Navbar for only for Forgot Username So creating different Navbar for this -->

	<!-- Forgot UserName Form  -->
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center">Forgot UserName</h5>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty userobj}">
							<p class="text-center text-success">UserName:${userobj.userName }</p>
							<c:remove var="userobj" scope="session" />
						</c:if>
						<form action="ForUserNameServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1" class="text-center">Enter
									Email:</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Email" name="email" required="required">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Check</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>