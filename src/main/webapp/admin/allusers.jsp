<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-AllUsers : E-Book Application</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
<%@ include file="navbar.jsp"%>
<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
<h3 class="text-center"> Admin View : All Users</h3>
<table class="table mt-3">
  <thead class="thead-dark">
    <tr>
      <th scope="col">UserId</th>
      <th scope="col">UserFullName</th>
      <th scope="col">UserName</th>
      <th scope="col">UserEmail</th>
      <th scope="col">UserNumber</th>
      <th scope="col">UserAddress</th>
      <th scope="col">UserLandmark</th>
      <th scope="col">UserCity</th>
      <th scope="col">UserState</th>
      <th scope="col">UserPincode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Prudvi Raj</td>
      <td>prudvi04</td>
      <td>prudvi@gmail.com</td>
      <td>123456985</td>
      <td>Hyderabad,India</td>
      <td>Hitension Lane</td>
      <td>Hyderabad</td>
      <td>India</td>
      <td>500042</td>
    </tr>
    
   
  </tbody>
</table>


</body>
</html>