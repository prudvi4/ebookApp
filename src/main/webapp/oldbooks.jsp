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
<title>Old Books : E-Book Application</title>
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
				class="d-inline-block align-top mr-2" alt="">Old Books
		</h4>
		<div class="row p-3">
		<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> book2 = dao2.getOldBook();
			for (BookVO books2 : book2) {%>
				<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%= books2.getPhoto() %>"
							style="width: 100px; height: 150px" class="img-thumbnail">
						<p>Book: <%= books2.getBookname() %></p>
						<p>Author Name: <%=books2.getAuthor() %></p>
						<p>Seller Name: <%=books2.getUserEmail() %></p>
						<p>Category Name: <%=books2.getBookCategory() %></p>
						<div class="row">
							<a href="viewbook.jsp?bid=<%=books2.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><span>&#8377;</span><%=books2.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			<% }
			%>
			
		</div>
	</div>
</body>
</html>