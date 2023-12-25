<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="all_component/navbar.jsp"%>

	<nav class="navbar navbar-light justify-content-center">
		<a class="navbar-brand" href=""> <img
			src="assets/logos/mainLogo.png" width="30" height="30"
			class="d-inline-block align-top" alt=""> E-Book Application
		</a>
	</nav>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5>Create Account</h5>
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg}">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty checkMsg}">
						<p class="text-center text-danger">${checkMsg }</p>
						<c:remove var="checkMsg" scope="session"/>
						</c:if>
						
						
						<form action="RegServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fullname"
									placeholder="Enter FullName" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="username"
									placeholder="Enter FullName" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email"
									placeholder="Enter Valid Email" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Mobile Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="number"
									placeholder="Enter Mobile Number" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Your Password" name="password"
									required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Re-Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Confirm Your Password" name="repassword"
									required="required">
							</div>

							<div class="form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Terms and Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary mt-2">Sign
								Up</button>

							<p class="mt-1">
								Already have an account? <a href="login.jsp">Login</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="all_component/footer.jsp"%>

</body>
</html>