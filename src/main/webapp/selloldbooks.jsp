<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Books : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">User : Add Old Book</h4>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<form action="AddOldBookServlet" method="post" enctype="multipart/form-data">
						<input type="hidden" name="userEmail" value="${userobj.email }">						
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname"
									placeholder="Enter Book Name" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author"
									placeholder="Enter Author Name" required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price"
									placeholder="Enter Price" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleInputPassword1" placeholder="Confirm Your Password"
									name="bimg" required="required">
							</div>
							<button type="submit" class="btn btn-primary mt-2">Add
								Old Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>





	<%@ include file="all_component/footer.jsp"%>
</body>
</html>