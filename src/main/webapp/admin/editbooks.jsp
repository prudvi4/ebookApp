<%@page import="com.ebook.entity.BookVO"%>
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
<title>Admin-EditBooks : E-Book Application</title>
<%@ include file="allcss.jsp"%>
</head>

<body style="background-color: #f0f2f2;">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Admin : Edit Book</h4>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));

						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
						BookVO books = dao.getBookById(id);
						%>

						<form action="../BooksUpdServlet" method="post">
						<input type="hidden" name="id" value="<%= books.getBookId() %>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname"
									placeholder="Enter Book Name" required="required"
									value="<%=books.getBookname()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author"
									placeholder="Enter Author Name" required="required"
									value="<%=books.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price"
									placeholder="Enter Price" required="required"
									value="<%=books.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">

									<%
									if ("Active".equals(books.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">InActive</option>
									<%
									} else {
									%>
									<option value="Inactive">InActive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary mt-2">Update
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>