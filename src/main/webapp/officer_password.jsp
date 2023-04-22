<%@page import="com.banking.beans.Employee"%>
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
<title>Change Password</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
      <%
      Employee emp=(Employee)session.getAttribute("employee");
      String task;
      if(emp.getPost().equalsIgnoreCase("Manager"))
    	  task="manager_home";
      else if(emp.getPost().equalsIgnoreCase("officer"))
    	  task="officer_home";
      else
    	  task="cashier_home";
  %>
<a href="#" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  <%=emp.getName() %>  &nbsp;</h4> </a>
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="MainController?task=<%=task%>">Home   &nbsp;&nbsp;|</a> 
    </li>
  </ul>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>

<br>
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
<div class="container">
 <div class="col-sm-7">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%">
      <h3>Change Password</h3><hr>
			<form action="MainController" method="post">
			  <div class="form-group">
			    <label >Current Password:</label>
			    <input type="text" class="form-control" placeholder="Enter current password" id="password" name="password">
			  </div>
			  <div class="form-group">
			    <label for="pwd">New Password:</label>
			    <input type="text" class="form-control" placeholder="Enter new password" id="newpassword" name="newpassword">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Confirm Password:</label>
			    <input type="text" class="form-control" placeholder="Re-enter password " id="repassword" name="repassword">
			  </div>
			  <button type="submit" class="btn btn-success" name="task" value="officer_password">Done</button>
			</form>
       </div> 
    </div>
</div>




</body>


</html>