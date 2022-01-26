<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Note"%>

<!DOCTYPE html>
<html>
<head>
<link href="Required/logo.jpg" rel="icon">

<%@include file="Required/headcontent.jsp"%>
<meta charset="ISO-8859-1">
<title>View Notes</title>
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
		<% 
int i =0;
List<Note> file = (List<Note>)request.getAttribute("notes");
for(Note n : file){
	String usern = n.getUsername();
	if(usern != null){
	String user = username+n.getId();
	
	if(usern.equals(user)){
		i++;
	out.print(
	  "<button class='btn btn-primary ' type='button' data-bs-toggle='collapse' data-bs-target='#collapseExample' style='width: 35%;'>"+
		n.getTitle()+
	  "<br></button>"+
		
	"<div class='collapse-show ' id='collapseExample'>"+
	  "<div class='card card-body'>"
	  
	   +n.getContent()+"<a href='"+request.getContextPath()+"/memberareacontroller?action=delete&nid="+n.getId()+"'>Delete</a>"+
	  "</div></div><br><br>"
	  
	  );
	}
	}
}




if(i==0){
	out.print(
			  "<button class='btn btn-primary ' type='button' data-bs-toggle='collapse' data-bs-target='#collapseExample' style='width: 35%;'>"
			    +"Message"+
			  "<br></button>"+
			"<div class='collapse-show ' id='collapseExample'>"+
			  "<div class='card card-body'>"
			    +"Thank you very much for choosing NoteTaker!"+"<br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- Varun Kajrekar"+
			  "</div></div><br><br>"
			  );
}
%>
	</div>
</body>
</html>