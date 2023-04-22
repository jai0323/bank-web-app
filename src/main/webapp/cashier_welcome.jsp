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
  Employee emp=(Employee)session.getAttribute("employee");
    Cashinhand c=(Cashinhand)request.getAttribute("cashinhand");
  %>
  <a href="#" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  <%=emp.getName() %>  &nbsp;</h4> </a>
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="MainController?task=cashier_home">Home   &nbsp;&nbsp;|</a> 
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=customer_details">Account Details &nbsp;&nbsp;|</a>
    </li>

     <li class="nav-item">
      <a class="nav-link text-white" href="officer_password.jsp">Change Password  </a>
    </li>

  </ul>
   <span style="float: right;margin-left:auto;margin-right:0">
   <%if(c.getStatus()==0) {%>
    <b> Branch Balance=</b><b class="text-danger"> Rs.  <%=c.getBalance() %></b>&nbsp;
    <%}
    else {%>
     <b> Branch Balance=</b><b class="text-success"> Rs.  <%=c.getBalance() %></b>&nbsp;
     <%} %>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger " > Logout </a>
   </span>
</nav>

<br>

<%
 String message=(String)request.getAttribute("message");
 if(message!=null)
 {
	 %>
	    <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>
			 
	 <% 
 }
 %> <div class="container">
  <div class="row">
    
    <div class="col-sm-6">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%">
      <h3>Deposit and Withdrawal</h3><hr>
			<form action="MainController" method="post">
			  <div class="form-group">
			    <label >Account Number:</label>
			    <input type="text" class="form-control" placeholder="Enter Account No." id="acc_no" name="acc_no" required>
			  </div>
			  <div class="form-group">
			    <label for="pwd">Name:</label>
			    <input type="text" class="form-control" placeholder="Enter Name" id="name" name="name" required>
			  </div>
			  <div class="form-group">
			    <label for="pwd">Amount:</label>
			    <input type="text" class="form-control" placeholder="Enter Amount" id="amount" name="amount" required="required">
			  </div>
			  <input type="hidden" class="form-control" placeholder="Enter Amount" id="amount" name="branchCode" value="<%=emp.getBranchCode() %>" required="required">
			  <%if(c.getStatus()==1){ %>
			  <button type="submit" class="btn btn-primary" name="task" value="deposit">Deposit</button>
			  <button type="submit" class="btn btn-primary" name="task" value="withdrawal">Withdrawal</button>
			  <%}
			  else {%>
			  <h6 class="text-info">Ask manager for access payments</h6>
			  <%} %>			
			</form>
       </div>  

    </div>    
 
   
    <div class="col-sm-6"  >
     
      <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:99%">
			  <h3>Today's Transactions</h3>   <hr>   
			  <div style="height:380px;overflow-y:auto;width: 100%;">
			  <table class="table table-striped">
			    <tbody >
			     <%
			  List<Transaction> tt=(List<Transaction>)request.getAttribute("tt");
			  if(tt!=null && tt.size()!=0)
			  { for(Transaction t:tt)
			  {
			  %>   <tr style="width:99%">
				        <td><%=t.getTran_id() %></td>
				        <%if(t.getSender().equals(emp.getBranchCode()+":BY CASH")){ %>
				        <td><%=t.getReceiver() %></td>
				        <td class="text-success"><%=t.getAmount() %></td>
				        <%} 
				        else {%>
				        <td><%=t.getSender() %></td>
				        <td class="text-danger"><%=t.getAmount() %></td>
				        <%} %>
				         
				      </tr>
				      
			      <%	
			  }
				 }
				 %>
				 </tbody>
			   	 
			  </table>
			</div>
			</div>
       <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:100%">
			  <h3>Pending Payments</h3>   <hr>   
			  <div style="height:380px;overflow-y:auto;width: 100%;">
			  <table class="table table-striped" style="width:99%">
			  <tbody>
			     <%
			  List<PendingPayment> pps=(List<PendingPayment>)request.getAttribute("pendingPayments");
			  if(pps!=null && pps.size()!=0)
			  { for(PendingPayment pp:pps)
			  {
			  %>
			      <tr>
			        <td><%=pp.getAcc_no()%></td>
			        <td><%=pp.getName() %></td>
			        <td><%=pp.getAmount()%></td>
			        <%if(pp.getStatus()==1){ %>
			        <td style="width:50%"><a href="MainController?task=cashierCompletePayment&acc_no=<%=pp.getAcc_no()%>"><button  type="button" class="btn btn-success float-right">Verify</button></a>
			       <%} %>
			      </tr>
			      <%
			  }
				 }
				 %>
				 </tbody>
			
				 
			  </table>
			</div>
    	</div>
    </div>
  </div>

</body>


</html>