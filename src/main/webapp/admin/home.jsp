<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin DashBoard : E-Book Application</title>
<%@ include file="allcss.jsp"%>

<style type="text/css">
a{
text-decoration: none;
color: black;
}

a:hover{
text-decoration: none;
color: black;

}

</style>

</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="addbooks.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa fa-plus-square fa-3x text-primary" aria-hidden="true"></i> <br>
						<h4>Add Books</h4>
						----------
					</div>
				</div>
				</a>
			</div>
			
			
			<div class="col-md-3">
			<a href="allbooks.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa fa-book fa-3x text-danger" aria-hidden="true"></i> <br>
						<h4>All Books</h4>
						----------
					</div>
				</div>
			</a>
			</div>
			
			<div class="col-md-3">
			<a href="allorders.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa fa-gift fa-3x text-warning" aria-hidden="true"></i> <br>
						<h4>All Orders</h4>
						----------
					</div>
				</div>
			</a>
			</div>
			
			
			
			<div class="col-md-3">
			<a href="allusers.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa fa-users fa-3x text-info" aria-hidden="true"></i> <br>
						<h4>All Users</h4>
						----------
					</div>
				</div>
			</a>
			</div>
			
			
		</div>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>