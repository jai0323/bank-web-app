<%@page import="com.banking.beans.PendingPayment"%>
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
<title>Payment Vetrification</title>
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
      <a class="nav-link text-white " href="index.jsp">Home</a>
    </li>
    
  </ul>
 </nav>
<br>
<div>
<% String message=request.getParameter("message"); 
if(message!=null && message.length()!=0)
{%>
 <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>
<%} 
 User acc=(User)request.getAttribute("account");
  if(acc!=null)
	 {%>
</div>
<div class="container">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%">
      <h3>Account details for payment verification</h3><hr>
       
  <table class="table">
    <tbody>
      <tr>
        <td>Account Number:</td>
        <td><%=acc.getAcc_no() %></td>
      </tr>
      <tr>
        <td>Name:</td>
        <td><%=acc.getName() %></td>
      </tr>
      <tr>
        <td>Email:</td>
        <td><%=acc.getEmailid() %></td>
      </tr>
      <tr>
        <td>Address:</td>
        <td><%=acc.getAddress() %></td>
      </tr>
      <tr>
        <td>City:</td>
        <td><%=acc.getCity() %></td>
      </tr>
      <tr>
        <td>State:</td>
        <td><%=acc.getState() %></td>
      </tr>
      <tr>
        <td>Mobile:</td>
        <td><%=acc.getPno() %></td>
      </tr>
      <tr>
        <td>Adhaar:</td>
        <td><%=acc.getAdhaar() %></td>
      </tr>
      <tr>
        <td>PAN:</td>
        <td><%=acc.getPan() %></td>
      </tr>
       <tr>
        <td>Balance:</td>
        <td><%=acc.getBalance() %></td>
      </tr>
     
      <%
      PendingPayment p=(PendingPayment)request.getAttribute("pendingPayment");
      if(p!=null)
      {
      %>
       <tr>
        <td>Amount for payment:</td>
        <td><%=p.getAmount() %></td>
      </tr>
       </tbody>
  </table>
  <%} %>
  <form action="MainController" method="post">
  <input type="hidden" name="acc_no" value="<%=acc.getAcc_no() %>">
  <input class="btn btn-success" type="submit" name="task" value="Payment Verified">
  <input class="btn btn-danger" type="submit" name="task" value="Payment Rejected">
  </form>
      </div>
</div>
<%} %>

</body>
</html>