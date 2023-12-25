<%@page import="com.ebook.entity.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.entity.UserVO"%>
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
<title>Edit Status of Old Books : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<h4 class="text-center text-info">Status of Old Books</h4>
		<c:if test="${not empty succMsg}">
			<p class="text-center text-success">${succMsg }</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty failedMsg}">
			<p class="text-center text-danger">${failedMsg }</p>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<table class="table mt-4">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Book Id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Seller Name</th>
					<th scope="col">Category Name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				UserVO user = (UserVO) session.getAttribute("userobj");
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
				List<BookVO> book = dao.getAllBooksOldByUserId(user.getEmail(), "Old Book");
				for (BookVO values : book) {
				%>
				<tr>
					<th><%=values.getBookId()%></th>
					<th><%=values.getBookname()%></th>
					<th><%=values.getAuthor()%></th>
					<th><%=values.getUserEmail()%></th>
					<th><%=values.getBookCategory()%></th>
					<td><a href="DeleteOldBookById?bid=<%=values.getBookId()%>&&email=<%=values.getUserEmail() %>"
						class="btn btn-sm btn-danger"><i class="fa fa-trash m-1"
							aria-hidden="true"></i>Delete Book</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>




	<%@ include file="all_component/footer.jsp"%>
</body>
</html>