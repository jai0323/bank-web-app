<%@page import="com.banking.beans.User"%>
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
<title>Home Page</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
  <%
  User customer=(User)session.getAttribute("user");
  %>
  <a href="MainController?task=myAccountDetails" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  Customer  &nbsp;</h4> </a>
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="customer_welcome.jsp">Home   &nbsp;&nbsp;|</a> 
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=transferPage">Pay   &nbsp;&nbsp;|</a>
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=myAccountDetails">Account   &nbsp;&nbsp;|</a>
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=changepassword">Change Password  </a>
    </li>

  </ul>
   <a href="MainController?task=logout_user" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>

<% String message=(String)request.getAttribute("message"); 
if(message!=null && message.length()!=0)
{%>

 <div class="col-sm-12">
 
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%;margin-top: 15px " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  
		  <strong><%=message %></strong>
		</div>
		</div>
	
<%} %>
<div id="demo" class="carousel slide " data-ride="carousel" >

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner " style="height:400px">
    <div class="carousel-item active">
     <img src="images/1.png" alt="poster_1">
		  <div class="carousel-caption">
		    <h3></h3>
		    <p></p>
		  </div>
      
    </div>
    <div class="carousel-item">
     <img src="images/2.png" alt="poster_2">
		  <div class="carousel-caption">
		    <h3></h3>
		    <p></p>
		  </div>
    </div>
   
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
<br/>

<!-- Main section  -->
<div class="container">
  <div class="row">

    <div class="col-sm-3">
    
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-light text-secondary" style="width:90%;height:70%">
      <a href="MainController?task=transferPage">
       <h3>Transfer</h3>
       <p> pay to another account</p>
       </a>
    </div>
    </div>
   
    <div class="col-sm-3">
    <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-light text-secondary" style="width:90%;height:70%">
       <a href="MainController?task=passbook">
      <h3>Passbook</h3>
      <p>To view all transaction</p>
      </a>
    </div>
    </div>
    <div class="col-sm-3">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-light text-secondary" style="width:90%;height:70%">
        <a href="MainController?task=daily_report">
       <h3>Daily Report</h3>
      <p> To view today's transaction</p>
      </a>
    </div>
    </div>
    <div class="col-sm-3">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-light text-secondary" style="width:90%;height:70%">
       <a href="MainController?task=query_report">
      <h3>Query Report </h3>
      <p> Daily  basis query report</p>
      </a>
    </div>
    </div>
  </div>
</div>

</body>
</html>