<%@page import="com.ebook.entity.BookVO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.dao.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book Details Page : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("assets/images/banner.jpg");
	background-repeat: no-repeat;
	height: 350px;
	background-position: center;
	background-size: cover;
}

hr {
	border-color: #7FC6A4;
	font-size: 10px;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));

	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	BookVO books = dao.getBookById(bid);
	%>

	<div class="container ">
		<div class="row p-5 ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book/<%=books.getPhoto()%>"
					style="height: 150px; width: 100px"><br>
				<h4>
					Book Name :
					<%=books.getBookname()%></h4>
				<h4>
					Author Name :
					<%=books.getAuthor()%></h4>
				<h4>
					Seller By :
					<%=books.getUserEmail()%></h4>
				<h4>
					Category Name :
					<%=books.getBookCategory()%></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2 class="text-danger"><%=books.getBookname()%></h2>

				<%
				if ("Old Book".equals(books.getBookCategory())) {
				%>
				<h5>Contact to Seller By:</h5>
				<h5>
					<i class="fa fa-envelope" aria-hidden="true"></i>Email:
					<%=books.getUserEmail()%></h5>

				<div class="row mt-4">
					<div class="col-md-3 text-primary text-center p-1">
						<i class="fa fa-truck fa-2x" aria-hidden="true"></i>
						<p class="text-primary">Free Delivery</p>
					</div>
					<div class="col-md-3 text-info text-center p-1">
						<i class="fa fa-undo fa-2x" aria-hidden="true"></i>
						<p class="text-info">Return</p>
					</div>
					<div class="col-md-3 text-warning text-center p-1">
						<i class="fa fa-money fa-2x" aria-hidden="true"></i>
						<p class="text-warning">COD</p>
					</div>
					<div class="col-md-3 text-dark text-center p-1">
						<i class="fa fa-credit-card fa-2x" aria-hidden="true"></i>
						<p class="text-dark">Credit/Debit Card</p>
					</div>
				</div>

				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success btn-sm ml-5">Continue
						Shopping</a> <a href="" class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books.getPrice()%></a>
				</div>


				<%
				} else {
				%>
				<div class="row mt-4">
					<div class="col-md-3 text-primary text-center p-1">
						<i class="fa fa-truck fa-2x" aria-hidden="true"></i>
						<p class="text-primary">Free Delivery</p>
					</div>
					<div class="col-md-3 text-info text-center p-1">
						<i class="fa fa-undo fa-2x" aria-hidden="true"></i>
						<p class="text-info">Return</p>
					</div>
					<div class="col-md-3 text-warning text-center p-1">
						<i class="fa fa-money fa-2x" aria-hidden="true"></i>
						<p class="text-warning">COD</p>
					</div>
					<div class="col-md-3 text-dark text-center p-1">
						<i class="fa fa-credit-card fa-2x" aria-hidden="true"></i>
						<p class="text-dark">Credit/Debit Card</p>
					</div>
				</div>

				<div class="text-center p-3">
					<a href="" class="btn btn-success btn-sm ml-5"><i
						class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add Cart</a> <a
						href="" class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books.getPrice()%></a>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>













</body>
</html>