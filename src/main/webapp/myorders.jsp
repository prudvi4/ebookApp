<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>
	<div class="container p-1">
		<h4 class="text-primary text-center">Orders List</h4>
		<table class="table mt-3">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Seller Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
					<td>Prudvi</td>
					<td>Java</td>
					<td>Prudvi</td>
					<td>250</td>
					<td>COD</td>
				</tr>
			</tbody>
		</table>
	</div>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>