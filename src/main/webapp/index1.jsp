<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="Required/headcontent.jsp"%>
<link href="Required/logo.jpg" rel="icon">

<meta charset="ISO-8859-1">
<title>HOME</title>
</head>
<body>
	<%
String username = null;
if(request.getSession().getAttribute("username") == null){
	response.sendRedirect(request.getContextPath()+"/NoteTaker?page=login");
}
else{
	username = request.getSession().getAttribute("username").toString();
}
%>

	<nav class="navbar navbar-expand-lg navbar-light red">
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/NoteTaker?page=addnotes">NoteTaker</a>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page"
					href="${pageContext.request.contextPath}/NoteTaker?page=addnotes">Add
						Note</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/NoteTaker?page=viewnotes">View
						Notes</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/memberareacontroller?action=destroy">Log
						out</a></li>
			</ul>
		</div>
	</nav>




	<br>
	<br>
	<br>
	<div class="container">

		<div class="mb text-center">
			<%
String message = (String)request.getAttribute("message");
if(message != null){
	out.print("<h5>Note is succesfully added</h3>");
}

%>
		</div>

		<form action="NoteTaker" method="post">

			<div class="mb-3">
				<h5>
					<label for="exampleInputEmail1" class="form-label">Title</label>
				</h5>
				<input type="text" class="form-control" placeholder="Enter Title"
					required="required" name="title" size="50" />
			</div>


			<div class="mb-3">
				<h5>
					<label for="exampleInputPassword1" class="form-label">Note</label>
				</h5>
				<textarea class="form-control" rows="10" cols="5"
					placeholder="Enter your notes here!" name="notes" size="50"
					required="required"></textarea>
			</div>


			<div class="mb-3 text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
			<input type='hidden' name='username' value='<%=username%>' /> <input
				type='hidden' name='action' value='savenote' />

		</form>
	</div>
</body>
</html>