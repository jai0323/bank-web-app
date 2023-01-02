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
<title>IIB</title>
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
      <a class="nav-link text-white " href="#">Home</a>
    </li>
    <li class="nav-item ">
      <a class="nav-link text-white" href="#">About</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">Contact</a>
    </li>
  </ul>
   
</nav>
<br>
<div class="container">
<div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:80%;height:80%"> 
<h2>Account Opening From</h2><hr>
<h6>Kindly provide the following details</h6>
<form action="MainController" method="post">
  <div class="form-group">
    <label for="name">Name:</label>
    <input type="text" class="form-control" placeholder="Enter name" id="name" name="name" required>
  </div>
  <div class="form-group">
    <label for="emailid">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email" name="emailid" required>
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
  </div>
  <div class="form-group">
  <label for="gender">Gender:</label><br>
   <div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="gender" value="Male">Male</label>
</div>
<div class="form-check-inline">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="gender" value="Female">Female</label>
</div>
<div class="form-check-inline disabled">
  <label class="form-check-label">
    <input type="radio" class="form-check-input" name="gender" value="Others">Others</label>
</div>
   
  </div>
  
  <div class="form-group">
    <label for="address">Address:</label>
    <input type="text" class="form-control" placeholder="Enter address" id="address" name="address" required>
  </div>
   <div class="form-group">
    <label for="city">City:</label>
    <input type="text" class="form-control" placeholder="Enter city" id="city" name="city" required>
  </div>
   <div class="form-group">
    <label for="state">State:</label>
    <input type="text" class="form-control" placeholder="Enter state" id="state" name="state" required>
  </div>
   <div class="form-group">
    <label for="pno">Mobile:</label>
    <input type="text" class="form-control" placeholder="Enter mobile" id="pno" name="pno" required>
  </div>
  <div class="form-group">
    <label for="Adhaar">Adhaar:</label>
    <input type="text" class="form-control" placeholder="Enter Adhaar" id="adhaar" name="adhaar" required>
  </div>
  <div class="form-group">
    <label for="PAN">PAN:</label>
    <input type="text" class="form-control" placeholder="Enter PAN" id="pan" name="pan" required>
  </div>
  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" required>I declare given information in valid and if not required action can be taken against me.
    </label>
  </div>
  <button type="submit" class="btn btn-primary" name="task" value="newAccount">Submit</button>
</form>

</div>
</div>

</body>
</html>