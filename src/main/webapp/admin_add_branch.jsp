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
<title>Add New Branch</title>
</head>

<body>  
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
  <h4 class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> &nbsp;  Admin  &nbsp;</h4>   
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="MainController?task=admin_home">Home</a>
    </li>
  </ul>
     <a href="index.jsp" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
   
</nav>
<br>

<%
 String message=(String)request.getParameter("message");
 if(message!=null)
 {
	 %>
	    <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>	 
	 <% } %>
<div class="container">
<div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:80%;height:80%"> 
<h2>Add New Branch</h2><hr>
<h6>Kindly provide the following details</h6>
<form action="MainController" method="post">
  <div class="form-group">
    <label for="name">Name:</label>
    <input type="text" class="form-control" placeholder="Enter name" id="name" name="name" required>
  </div>
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" placeholder="Enter city" id="city" name="city" required>
  </div>
   <div class="form-group">
    <label for="state">State:</label>
    <input type="text" class="form-control" placeholder="Enter state" id="state" name="state" required>
  </div>
  <button type="submit" class="btn btn-primary" name="task" value="newBranch">Save</button>
</form>

</div>
</div>

</body>
</html>