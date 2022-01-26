<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="Required/headcontent.jsp"%>
<link href="Required/logo.jpg" rel="icon">

<link href="Required/signin.css" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	


	<%@include file="Required/bootstap2.jsp"%>
	<br>
	<div class="mb text-center">
	<%
String message = (String)request.getAttribute("message");
if(message != null){
	out.print("<h6 style='color: red;'>"+"EMAIL IS ALREADY REGISTERED"+"</h6>");
}
%>
	</div>
	
	<form class="form-signin text-center"
		action="<%=request.getContextPath()%>/NoteTaker" method="post">
		<h1 class="h3 mb-3 fw-normal">Create Account</h1>
		<hr class="my-4">
		<div class="form-floating">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="username" name="name" required> <label
				for="floatingInput">First name</label>
		</div>
		<br>
		<div class="form-floating">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="username" name="name1" required> <label
				for="floatingInput">Last name</label>
		</div>
		<br>

		<div class="form-floating">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="username" name="username" required> <label
				for="floatingInput"> Email</label>
		</div>
		<br>

		<div class="form-floating">
			<input type="password" class="form-control" placeholder="Password"
				name="password" required> <label for="floatingPassword">Password</label>
		</div>
		<br>
		<button class="w-100 btn btn-lg btn-primary" type="submit">Create
			Account</button>

		<input type="hidden" name="action" value="register">
		<hr class="my-4">
		<div class="form-floating">
			Already have an account?<a class="nav-link active"
				href="${pageContext.request.contextPath}/NoteTaker?page=login">Sign
				in now</a>
		</div>

	</form>




</body>
</html>