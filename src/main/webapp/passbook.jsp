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

<div class="container">
  <h2>Statement</h2> 
  
  <h5 class="float-right">Balance: <%=request.getAttribute("balance") %></h5>
    <table class="table table-striped">
    <tbody>
  <thead>
  <tr>
  <th>
  Transaction ID
  </th>
  <th>
  Receiver
  </th>
  <th>
  Sender
  </th>
  <th>
  Amount
  </th>
  <th>
  Date and Time
  </th>
  </tr>
  
  </thead>
<%
List<Transaction> statement=(List<Transaction>)request.getAttribute("statement");
if(statement!=null && statement.size()!=0)
{
	for(Transaction st:statement)
	{

%>           
      <tr>
        <td><%=st.getTran_id() %></td>
        <td><%=st.getReceiver() %></td>
        <td><%=st.getSender() %></td>
        <td><%=st.getAmount() %></td>
        <td><%=st.getDot() %></td>
      </tr>
    <%
	}
	}
      %>
      </tbody>
  </table>
</div>


</body>
</html>