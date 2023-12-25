<%@page import="java.util.List"%>
<%@page import="com.ebook.entity.CartVO"%>
<%@page import="com.ebook.entity.UserVO"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.dao.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>



	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 ">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Cart Details</h3>
						<c:if test="${not empty succMsg}">
							<div class="alert alert-success" role="alert">${succMsg }</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg}">
							<div class="alert alert-danger" role="alert">${failedMsg }</div>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Book Image</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author Name</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								UserVO user = (UserVO) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
								List<CartVO> list = dao.getCartDetailsByUser(user.getId());
								Double totalPrice = 0.00;
								for (CartVO cart : list) {
									totalPrice = cart.getTotalprice();
								%>
								<tr>
									<th><%=cart.getCid()%></th>
									<th><%=cart.getBookName()%></th>
									<td><%=cart.getAuthorName()%></td>
									<td><%=cart.getPrice()%></td>
									<td><a href="RemoveBookCart?bid=<%=cart.getBid()%>&&uid=<%= cart.getUid() %>&&cid=<%= cart.getCid() %>"
										class="btn btn-sm btn-danger"><i class="fa fa-trash"
											aria-hidden="true"></i>Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total:-</td>
									<td></td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Confirm Details</h3>
						<form action="" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email"
										class="form-control" id="inputEmail4" value="<%= user.getEmail() %>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Name</label> <input type="text"
										class="form-control" id="inputPassword4" value="<%= user.getFullName() %>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Mobile No</label> <input
										type="number" class="form-control" id="inputPassword4" value="<%= user.getNumber() %>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputZip">Zip</label> <input type="text"
										class="form-control" id="inputZip">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress">
							</div>
							<div class="form-group">
								<label for="inputAddress2">Landmark</label> <input type="text"
									class="form-control" id="inputAddress2">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">State</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
							</div>

							<div class="form-group">
								<label for="paymenttype">Payment Type</label> <select
									class="form-control" id="paymenttype">
									<option>---Select---</option>
									<option>Cash On Delivery</option>
									<option>Credit Card</option>
									<option>Debit Card</option>
								</select>
							</div>

							<div class="text-center">
								<a type="submit" class="btn btn-primary"> <i
									class="fa fa-undo m-1" aria-hidden="true"></i>Continue Shopping
								</a> <a type="submit" class="btn btn-warning"><i
									class="fa fa-check-square-o m-1" aria-hidden="true"></i>Check
									Out</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>