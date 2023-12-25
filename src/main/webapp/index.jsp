<%@page import="com.ebook.entity.UserVO"%>
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
<title>Home Page : E-Book Application</title>
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
	<%
	UserVO user = (UserVO) session.getAttribute("userobj");
	%>




	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img"></div>

	<!-- Start Recent Book Section -->
	<div class="container">
		<h4 class="mt-3 text-center">
			<img src="assets/logos/mainLogo.png" width="30" height="30"
				class="d-inline-block align-top mr-2" alt="">Recent Books
		</h4>
		<div class="row">
			<!-- 1st Card -->

			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> book1 = dao1.getRecentBook();
			for (BookVO books1 : book1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=books1.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p>
							Book:
							<%=books1.getBookname()%>
						</p>
						<p>
							Author Name:
							<%=books1.getAuthor()%>
						</p>
						<p>
							Seller Name:
							<%=books1.getUserEmail()%>
						</p>
						<p>
							<%
							if (books1.getBookCategory().equals("Old Book")) {
							%>
							Category Name:
							<%=books1.getBookCategory()%>
						</p>
						<div class="row ">
							<a href="viewbook.jsp?bid=<%=books1.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Book</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books1.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<p>
							Category Name:
							<%=books1.getBookCategory()%>
						</p>
						<div class="row">

							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="CartServlet?bid=<%= books1.getBookId() %>&&uid=<%= user.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add Cart</a>
							<%
							}
							%>

							<a href="viewbook.jsp?bid=<%=books1.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Book</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books1.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<!-- Books Card End -->
		</div>
		<div class="text-center mt-2">
			<a href="recentbooks.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- End Recent Book Section -->



	<hr>


	<!-- Start New Book Section -->

	<%

	%>

	<div class="container">
		<h4 class="mt-3 text-center">
			<img src="assets/logos/mainLogo.png" width="30" height="30"
				class="d-inline-block align-top mr-2" alt="">New Books
		</h4>
		<div class="row">
			<!-- 1st Card -->
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> book = dao.getNewBook();
			for (BookVO books : book) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=books.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p>
							Book:
							<%=books.getBookname()%>
						</p>
						<p>
							Author Name:
							<%=books.getAuthor()%>
						</p>
						<p>
							Seller Name:
							<%=books.getUserEmail()%>
						</p>
						<p>
							Category Name:
							<%=books.getBookCategory()%>
						</p>
						<div class="row">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="CartServlet?bid=<%= books.getBookId() %>&&uid=<%= user.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add Cart</a>
							<%
							}
							%>								
								<a
								href="viewbook.jsp?bid=<%=books.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Book</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


			<!-- Books Card End -->
		</div>
		<div class="text-center mt-2">
			<a href="newbooks.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- End New Book Section -->

	<hr>

	<!-- Start Old Book Section -->
	<div class="container">
		<h4 class="mt-3 text-center">
			<img src="assets/logos/mainLogo.png" width="30" height="30"
				class="d-inline-block align-top mr-2" alt="">Old Books
		</h4>
		<div class="row">
			<!-- 1st Card -->
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> book2 = dao2.getOldBook();
			for (BookVO books2 : book2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="assets/books/c1.jpg"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p>
							Book:
							<%=books2.getBookname()%></p>
						<p>
							Author Name:
							<%=books2.getAuthor()%></p>
						<p>
							Seller Name:
							<%=books2.getUserEmail()%></p>
						<p>
							Category Name:
							<%=books2.getBookCategory()%></p>
						<div class="row">
							<a href="viewbook.jsp?bid=<%=books2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books2.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




			<!-- Books Card End -->
		</div>
		<div class="text-center mt-2">
			<a href="oldbooks.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- End Old Book Section -->

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>