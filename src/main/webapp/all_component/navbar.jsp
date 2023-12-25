<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>




<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<!-- Image and text -->
			<nav class="navbar navbar-light">
				<a class="navbar-brand" href=""> <img
					src="assets/logos/mainLogo.png" width="30" height="30"
					class="d-inline-block align-top" alt=""> E-Book Application
				</a>
			</nav>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0 justify-content-center">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		
		<c:if test="${not empty userobj}">
		<div class="col-md-3">
			
			<a href="cart.jsp" class="btn btn-primary">
			<i class="fa fa-cart-arrow-down " aria-hidden="true"></i>Cart
			</a>
			
			<a href="" class="btn btn-success"><i class="fa fa-user-circle m-1"
				aria-hidden="true"></i> ${userobj.fullName} </a> 
				
				<a href="LogoutServlet" class="btn btn-warning"><i class="fa fa-sign-out" aria-hidden="true"></i>
				Logout</a>
		</div>
		</c:if>
		
		
		<c:if test="${empty userobj}">
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i class="fa fa-user-circle m-1"
				aria-hidden="true"></i>Login</a> <a href="register.jsp" class="btn btn-primary"><i
				class="fa fa-user-plus m-1" aria-hidden="true"></i>Register</a>
		</div>
		</c:if>
		
		
	</div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary bg-custom">
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa fa-home m-1" aria-hidden="true"></i>Home <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link" href="recentbooks.jsp"><i
					class="fa fa-book m-1" aria-hidden="true"></i>Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="newbooks.jsp"><i
					class="fa fa-sticky-note m-1" aria-hidden="true"></i>New Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="oldbooks.jsp"><i
					class="fa fa-paper-plane m-1" aria-hidden="true"></i>Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a class="btn btn-light mr-3" href="setting.jsp">
				<i class="fa fa-cog m-1" aria-hidden="true"></i>Setting
			</a>
			<a class="btn btn-light mr-3" href="">
				<i class="fa fa-phone m-1" aria-hidden="true"></i>Contact Us
			</a>
		</form>
	</div>
</nav>