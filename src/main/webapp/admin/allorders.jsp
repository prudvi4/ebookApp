<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-AllOrders : E-Book Application</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
<%@ include file="navbar.jsp"%>
<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
<h3 class="text-center"> Admin View : All Orders</h3>
<table class="table mt-3">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">User Name</th>
      <th scope="col">User Email</th>
      <th scope="col">User Address</th>
      <th scope="col">User Number</th>
      <th scope="col">User Ordered Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">BOOK-ORD-009</th>
      <td>Prudvi</td>
      <td>prudvi@gmail.com</td>
      <td>Hyderabad,India</td>
      <td>123456985</td>
      <td>Java</td>
      <td>Dennis</td>
      <td>250</td>
      <td>COD</td>
    </tr>
    
   
  </tbody>
</table>


</body>
</html>