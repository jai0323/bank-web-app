<%@page import="java.util.List"%>
<%@page import="com.banking.beans.*"%>
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
<title>Customer Details</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
     <%
  Officer officer=(Officer)session.getAttribute("officer");
  %>
<a href="#" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  Admin  &nbsp;</h4> </a>
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
     <a class="nav-link text-white " href="MainController?task=officer_home">Home   &nbsp;&nbsp;|</a> 
    </li>
    <li class="nav-item ">
      <a class="nav-link text-white" href="#">About   &nbsp;&nbsp;|</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">Contact  &nbsp; &nbsp;|</a>
    </li>
     
  </ul>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>
<%
 String message=(String)request.getParameter("message");
 if(message!=null)
 {
	 %> <br>
	    <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>
			 
	 <% 
 }
 %>

<div class="col-sm-4">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%;margin-left:33%">
     
        <form action="MainController" method="post">
        <div class="form-group">
		    <label for="acc_no">Account No.:</label>
		    <input type="text" class="form-control"  id="acc_no" name="acc_no" placeholder="Enter the Account No." required>
		    </div>
		    <button type="submit" class="btn btn-success" name="task" value="search_account">Search</button>
		
	    </form>
	  </div>	
 </div>

<%
User acc=(User)request.getAttribute("account");
if(acc!=null)
{
%>
<br>
<div class="col-sm-12">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%;margin-left:5%">
      <h4>Customer Account Details</h4><hr>
        <form action="MainController" method="post">
        <div class="form-group">
		    <label for="acc_no">Account No.:</label>
		    <label for="acc_no"><%=acc.getAcc_no() %></label>
		    <input type="hidden" class="form-control"  id="acc_no" name="acc_no" value="<%=acc.getAcc_no() %>" required>
		  </div>
		  <div class="form-group">
		    <label for="name">Name:</label>
		    <input type="text" class="form-control"  id="name" name="name" value="<%=acc.getName() %>" required>
		  </div>
		  <div class="form-group">
		    <label for="emailid">Email address:</label>
		    <input type="email" class="form-control" id="email" name="emailid" value="<%=acc.getEmailid()%>" required>
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" value="<%=acc.getPassword() %>" id="pwd" name="password" required>
		  </div>
		  <div class="form-group">
		  <label for="gender">Gender:</label>		   
			 <input type="text" class="form-control" value="<%=acc.getGender()%>"  id="gender" name="gender" required> 
		</div>		  
		  <div class="form-group">
		    <label for="address">Address:</label>
		    <input type="text" class="form-control" value="<%=acc.getAddress() %>"  id="address" name="address" required>
		  </div>
		   <div class="form-group">
		    <label for="city">City:</label>
		    <input type="text" class="form-control" value="<%=acc.getCity() %>"  id="city" name="city" required>
		  </div>
		   <div class="form-group">
		    <label for="state">State:</label>
		    <input type="text" class="form-control" value="<%=acc.getState() %>"  id="state" name="state" required>
		  </div>
		   <div class="form-group">
		    <label for="pno">Mobile:</label>
		    <input type="text" class="form-control" value="<%=acc.getPno() %>"  id="pno" name="pno" required>
		  </div>
		  <div class="form-group">
		    <label for="Adhaar">Adhaar:</label>
		    <input type="text" class="form-control" value="<%=acc.getAdhaar() %>"  id="adhaar" name="adhaar" required>
		  </div>
		  <div class="form-group">
		    <label for="PAN">PAN:</label>
		    <input type="text" class="form-control" value="<%=acc.getPan() %>"  id="pan" name="pan" required>
		  </div>
		  <button type="submit" class="btn btn-danger" name="task" value="apply_changes">Apply Changes</button>
		</form>
		</div>        	  
      </div>
<%
}
%>

</body>
</html>