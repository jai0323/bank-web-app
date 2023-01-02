<%@page import="org.hibernate.query.criteria.internal.expression.function.CurrentDateFunction"%>
<%@page import="java.util.Date"%>
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
<title>Account Statment</title>
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
  <a href="#" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  Customer  &nbsp;</h4> </a>
   
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
    <li class="nav-item ">
      <a class="nav-link text-white" href="#">About   &nbsp;&nbsp;|</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="#">Contact  &nbsp; &nbsp;|</a>
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=changepassword">Change Password  </a>
    </li>

  </ul>
   <a href="MainController?task=logout_user" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
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
      <h3>Ask Your Query</h3><hr>
      
			<form action="MainController" method="post">
	         <div class="form-group">
		 <label >Category:</label>
			  <select class="form-control" id="sel1" name="category">
			    <option>Other person did not received the money</option>
			    <option>Problem in making payments </option>
			    <option>Error occurred but amount was deducted</option>
			    <option>Problem in Changing the password</option>
			    <option>Account details related issue</option>	   
			  </select>
			</div>
		
			  <div class="form-group">
			    <label for="pwd">Details:</label>
			    <textarea rows="5" cols="4" class="form-control" placeholder="Write the Query" id="query" name="query"></textarea> 
			  </div>
			  <button type="submit" class="btn btn-success" name="task" value="customer_query">Send</button>
			</form>
       </div> 
    </div>
</div>
<br>
<div class="container">
  <h2>Query Report</h2> 
   
<div class="container">        
<table class="table table-striped">
    <tbody> 
    <thead>
    <tr>
    <th>Query ID</th>
    <th>Account</th>
    <th>Category</th>
    <th>Query</th>
    <th>Reply</th>
    </tr>
    
    </thead>
<%
List<Query> query_report=(List<Query>)request.getAttribute("query_report");
if(query_report!=null && query_report.size()!=0)
{
	for(Query q:query_report)
	{

%>   
 
          <tr>
        <td><%=q.getQ_id() %></td>
        <td><%=q.getName() %></td>
        <td><%=q.getCategory() %></td>
        <td><%=q.getQuery() %></td>
        <td><%=q.getReply()%></td>
        <td><a href="MainController?task=deleteQuery&qid=<%=q.getQ_id()%>" class="btn btn-success">Resolved</a></td>
      </tr>
     
    <%
	}
	}
      %>
       </tbody>
  </table>
  </div>
</div>
