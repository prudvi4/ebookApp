<%@page import="com.ebook.entity.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-AllBooks : E-Book Application</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>


	<h3 class="text-center">Admin View : All Book</h3>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger">${failedMsg }</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<table class="table mt-3">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Book Id</th>
				<th scope="col">Book Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Category</th>
				<th scope="col">Status</th>
				<th scope="col">Book Added By</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> books = dao.getBooks();

			for (BookVO book : books) {
			%>
			<tr>
				<td><%=book.getBookId()%></td>
				<td><img alt="" src="../book/<%=book.getPhoto()%>"
					style="width: 50px; height: 50px"></td>
				<td><%=book.getBookname()%></td>
				<td><%=book.getAuthor()%></td>
				<td><%=book.getPrice()%></td>
				<td><%=book.getBookCategory()%></td>
				<td><%=book.getStatus()%></td>
				<td><%=book.getUserEmail()%></td>
				<td><a href="editbooks.jsp?id=<%=book.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
					 <a href="../DeleteBookServlet?id=<%= book.getBookId() %>"
					class="btn btn-sm btn-danger"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
			</tr>
			<%
			}
			%>



		</tbody>
	</table>


</body>
</html>