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
<title>Recent Books : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
<style type="text/css">
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

	<div class="container-fluid">
	<h4 class="mt-3 text-center">
			<img src="assets/logos/mainLogo.png" width="30" height="30"
				class="d-inline-block align-top mr-2" alt="">Recent Books
		</h4>
		<div class="row p-3">
			
			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> book1 = dao1.getAllRecentBook();
			for (BookVO books1 : book1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=books1.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumbnail">
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
							<a href="viewbook.jsp?bid=<%=books1.getBookId() %>" class="btn btn-success btn-sm ml-5">View Book</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books1.getPrice() %></a>
						</div>
						<%
						} else {
						%>
						<p>
							Category Name:
							<%=books1.getBookCategory()%>
						</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i
								class="fa fa-cart-arrow-down" aria-hidden="true"></i>Add Cart</a> <a
								href="viewbook.jsp?bid=<%=books1.getBookId() %>" class="btn btn-success btn-sm ml-1">View Book</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books1.getPrice()%></a>
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
		</div>
	</div>
</body>
</html>