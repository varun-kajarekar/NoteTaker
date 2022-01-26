<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
<!DOCTYPE html>

<html lang="en">
<head>
<title>Sign in</title>
<%@include file="Required/headcontent.jsp"%>
<link href="Required/logo.jpg" rel="icon">

<link href="Required/signin.css" rel="stylesheet">
</head>

<body>
<%@include file="Required/bootstap2.jsp"%>


	<br>
<div class="mb text-center">
<%
String message = (String)request.getAttribute("message");
if(message != null){
	out.print("<h6 style='color: red;'>"+"We couldn't find an account matching the username and password you entered. Please check your username and password and try again."+"</h6>");
}
%>
</div>
	<form class="form-signin text-center"
		action="<%=request.getContextPath()%>/NoteTaker" method="post">
		<h1 class="h3 mb-3 fw-normal">Welcome Back</h1>
		<hr class="my-4">
		<div class="form-floating">
			<input type="email" class="form-control" id="floatingInput"
				placeholder="username" name="username" required> <label
				for="floatingInput">Email</label>
		</div>
		<br>


		<div class="form-floating">
			<input type="password" class="form-control" placeholder="Password"
				name="password" required> <label for="floatingPassword">Password</label>
		</div>
		<br>


		<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
			in</button>
		<input type="hidden" name="action" value="loginsubmit">
		<hr class="my-4">
		<div class="form-floating">
			Don't have an account yet?<a class="nav-link active"
				href="${pageContext.request.contextPath}/NoteTaker?page=register1">Sign
				up now</a>
		</div>

	</form>

</body>
</html>
