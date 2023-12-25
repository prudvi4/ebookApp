<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<!-- Image and text -->
			<nav class="navbar navbar-light">
				<a class="navbar-brand" href=""> <img src="logos/mainLogo.png"
					width="30" height="30" class="d-inline-block align-top" alt="">
					E-Book Application-Admin DashBoard
				</a>
			</nav>
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-3 text-right">
			<c:if test="${not empty userobj }">
				<a href="" class="btn btn-success"><i
					class="fa fa-user-circle m-1" aria-hidden="true"></i>${userobj.fullName }</a>
				<a href="" class="btn btn-danger"
					data-toggle="modal" data-target="#exampleModalCenter"><i
					class="fa fa-sign-out m-1" aria-hidden="true"></i>Logout</a>
			</c:if>

			<c:if test="${ empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fa fa-user-circle m-1" aria-hidden="true"></i>Login</a>
				<a href="register.jsp" class="btn btn-primary"><i
					class="fa fa-user-plus m-1" aria-hidden="true"></i>Register</a>
			</c:if>
		</div>
	</div>
</div>

<!-- Logout Popup Modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<h4 class="text-center"> Admin Sesion will be Logout?</h4>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Keep</button>
				<a  href="../LogoutServlet" type="button" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- Logout Popup Modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary bg-custom">
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home m-1" aria-hidden="true"></i>Home <span
					class="sr-only">(current)</span> </a></li>
		</ul>
	</div>
</nav>