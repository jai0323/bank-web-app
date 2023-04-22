<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Admin Login</title>
</head>

<body>
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="index.jsp">Home</a>
    </li>
    
  </ul>
 </nav>
<br>
<div>
<% String message=request.getParameter("message"); 
if(message!=null && message.length()!=0)
{%>
 <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>
<%} %>
</div>
<div class="container">
  <div style="margin-left:30%;margin-right:30%">
    <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white">
      <h3>Administrator Login</h3><hr>
      <form action="MainController" >
  	    <div class="form-group">
         <label >Admin ID:</label>
  			<input type="text" class="form-control" id="admin_id" name="admin_id">
		</div>
		<div class="form-group">
		  <label for="password">Password:</label>
  			<input type="password" class="form-control" id="password" name="password">
		</div>
		<div class="form-group text-center">
		  <button type="submit" class="btn btn-primary" name="task" value="admin_login" > Login </button>&nbsp;&nbsp;
		</div>
     </form>
     </div>
 </div>
</div>


</body>
</html>