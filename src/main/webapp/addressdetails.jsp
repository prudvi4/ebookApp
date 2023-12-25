<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Details : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-warning">Add Address</h3>
						<form action="">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4"
										placeholder="1234 Main St">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Apartment, studio, or floor">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group col-md-4">
									<label for="inputCity">State</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group col-md-4">
									<label for="inputZip">Zip</label> <input type="text"
										class="form-control" id="inputZip">
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning">Add
									Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="all_component/footer.jsp"%>
</body>
</html>