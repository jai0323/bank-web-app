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
<title>Branch Details</title>
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
     <a class="nav-link text-white " href="MainController?task=admin_home">Home   &nbsp;&nbsp;|</a> 
    </li>
   </ul>
   <a href="index.jsp" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>
<%
List<Employee> employees=(List<Employee>)request.getAttribute("employees");
Branch branch=(Branch)request.getAttribute("branch");
if(branch!=null)
{
%>
<div class="container">
  <h2>Branch Details</h2>
 
  <table class="table">
    <tbody>
      <tr>
        <td>Branch Code:</td>
        <td><%=branch.getBranchCode() %></td>
      </tr>
      <tr>
        <td>Name:</td>
        <td><%=branch.getName() %></td>
      </tr>
      <tr>
        <td>IFSC:</td>
        <td><%=branch.getIfsc() %></td>
      </tr>
      <tr>
        <td>City:</td>
        <td><%=branch.getCity() %></td>
      </tr>
      <tr>
        <td>State:</td>
        <td><%=branch.getState() %></td>
      </tr>
    </tbody>
  </table>
</div>
<br>

<%}
if(employees!=null || employees.size()!=0)
{
	%>
	<div class="container">
	<h2>Employee of the Branch</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Emp ID</th>
				<th>Name</th>
				<th>Password</th>
				<th>Post</th>
				<th>City</th>
				<th>State</th>
				<th>Email</th>
			</tr>
		</thead>
	
	<%
	for(Employee emp:employees)
	{
%>
		<tr>
			<td><%=emp.getEmp_id() %></td>
			<td><%=emp.getName() %></td>
			<td><%=emp.getPassword() %></td>
			<td><%=emp.getPost() %></td>
			<td><%=emp.getCity() %></td>
			<td><%=emp.getState() %></td>
			<td><%=emp.getEmail() %></td>
			
		</tr>
<%} %>
	</table>
</div>

<%} %>
</body>
</html>