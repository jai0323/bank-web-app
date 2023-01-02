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
<title>Home Page</title>
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
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=customer_details">Account Details &nbsp;&nbsp;|</a>
    </li>
    <li class="nav-item ">
      <a class="nav-link text-white" href="#">About   &nbsp;&nbsp;|</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">Contact  &nbsp; &nbsp;|</a>
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="officer_password.jsp">Change Password  </a>
    </li>

  </ul>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>

<br>

<div class="container">
 <div class="col-sm-7">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%">
      <h3>Query</h3><hr>
      <%
      Query q=(Query)request.getAttribute("query");
      %>
			<form action="MainController" method="post">
	         <div class="form-group">
		    <label >Query ID :  <%=q.getQ_id() %></label>
		    <input type="hidden" name=q_id value=<%=q.getQ_id() %>>
		      </div>
		  <div class="form-group">
		    <label >Account :  <%=q.getName() %></label>
		      </div>
		      <div class="form-group">
		    <label >Category :  <%=q.getCategory() %></label>
		      </div>
		      <div class="form-group">
		    <label >Query :  <%=q.getQuery() %></label>
		      </div>
			  <div class="form-group">
			    <label for="pwd">Reply:</label>
			    <textarea rows="5" cols="4" class="form-control" placeholder="" id="reply" name="reply"></textarea> 
			  </div>
			  <button type="submit" class="btn btn-success" name="task" value="sendreply">Send</button>
			</form>
       </div> 
    </div>
</div>

</body>
</html>