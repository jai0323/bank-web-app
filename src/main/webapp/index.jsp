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
<title>Fast Money</title>
</head>

<body class="bg-light">
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
<div class="container ">
	<div class="row ">
		<div class="col-sm-4 text-center">
		<a href="administrator_index.jsp" class="btn btn-outline-info btn-lg" >Administrator</a>
		</div>
		<div class="col-sm-4 text-center">
		<a href="employee_login.jsp" class="btn btn-outline-info btn-lg">Officer</a>
		</div>
		<div class="col-sm-4 text-center">
		<a href="customer_index.jsp" class="btn btn-outline-info btn-lg">Customer</a>
		</div>
	</div>
</div>
<br>

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

</body>
</html>