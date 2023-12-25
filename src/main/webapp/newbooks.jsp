<%@page import="com.ebook.entity.UserVO"%>
<%@page import="com.ebook.entity.BookVO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.dao.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books : E-Book Application</title>
<%@ include file="all_component/allcss.jsp"%>
<style type="text/css">
hr {
	border-color: #7FC6A4;
	font-size: 10px;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body style="background-color: #f7f7f7;">
<%
	UserVO user = (UserVO) session.getAttribute("userobj");
	%>
	<c:if test="${not empty addCart }">

		<div id="toast">${ addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>
	</c:if>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<h4 class="mt-3 text-center">
			<img src="assets/logos/mainLogo.png" width="30" height="30"
				class="d-inline-block align-top mr-2" alt="">New Books
		</h4>
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			List<BookVO> book = dao.getAllNewBook();
			for (BookVO books : book) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=books.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumbnail">
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
		</div>
	</div>

</body>
</html>