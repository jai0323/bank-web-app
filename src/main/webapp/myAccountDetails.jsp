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
<title>Account Details</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
     <%
  User customer=(User)request.getAttribute("account");
     Branch b=(Branch)request.getAttribute("branch");
  %>
  <a href="MainController?task=myAccountDetails" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  Customer  &nbsp;</h4> </a>
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
     <a class="nav-link text-white " href="customer_welcome.jsp">Home   &nbsp;&nbsp;|</a> 
    </li> 
  </ul>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>

<div class="container">
  <h2>Account Details</h2>
 
  <table class="table">
    <tbody>
    <tr>
        <td>Customer ID:</td>
        <td><%=customer.getCustomer_id()%></td>
      </tr>
      
      <tr>
        <td>Account Number:</td>
        <td><%=customer.getAcc_no() %></td>
      </tr>
      <tr>
        <td>Name:</td>
        <td><%=customer.getName() %></td>
      </tr>
      <tr>
        <td>Email:</td>
        <td><%=customer.getEmailid() %></td>
      </tr>
      <tr>
        <td>Branch Name:</td>
        <td><%=b.getName()%></td>
      </tr>
       <tr>
        <td>IFSC:</td>
        <td><%=b.getIfsc() %></td>
      </tr>
       <tr>
        <td>Branch Address:</td>
        <td><%=b.getCity() %>, <%=b.getState() %></td>
      </tr>
      <tr>
        <td>Address:</td>
        <td><%=customer.getAddress() %></td>
      </tr>
      <tr>
        <td>City:</td>
        <td><%=customer.getCity() %></td>
      </tr>
      <tr>
        <td>State:</td>
        <td><%=customer.getState() %></td>
      </tr>
      <tr>
        <td>Mobile:</td>
        <td><%=customer.getPno() %></td>
      </tr>
      <tr>
        <td>Adhaar:</td>
        <td><%=customer.getAdhaar() %></td>
      </tr>
      <tr>
        <td>PAN:</td>
        <td><%=customer.getPan() %></td>
      </tr>
      </tbody>
  </table>
</div>


</body>
</html>