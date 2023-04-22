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
  %>
  <a href="#" class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0"> <h4>&nbsp;  <%=emp.getName() %>  &nbsp;</h4> </a>
  
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="MainController?task=manager_home">Home   &nbsp;&nbsp;|</a> 
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="MainController?task=customer_details">Account Details &nbsp;&nbsp;|</a>
    </li>
     <li class="nav-item">
      <a class="nav-link text-white" href="officer_password.jsp">Change Password</a>
    </li>

  </ul>
  <span class="text-white"   style="float: right;margin-left:auto;margin-right:0">
 
  <%Cashinhand c=(Cashinhand)request.getAttribute("cashinhand");%>
   <%if(c.getStatus()==0){ %>
  <b> Branch Balance=</b><b class="text-danger"> Rs.  <%=c.getBalance() %></b>&nbsp;
   <a href="MainController?task=branchStatus&status=<%=c.getStatus() %>" class="btn btn-success  border border-danger" >
     Begin Day </a>
    <%}
    else
    {%>
    <b> Branch Balance=</b><b class="text-success"> Rs.  <%=c.getBalance() %></b>&nbsp;
   <a href="MainController?task=branchStatus&status=<%=c.getStatus() %>" class="btn btn-success  border border-danger" >
  
    End Day
    </a><%} %>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger "> Logout </a>
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
 
 %>
 
 
 
<% User acc=(User)request.getAttribute("account");
  if(acc!=null)
{
%>		<div class="col-sm-12">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%;margin-left:5%">
      <h4>Verify the Account Details</h4><hr>
        <form action="MainController" method="post">
        <div class="form-group">
		    <label for="acc_no">Account No.:</label>
		    <input type="text" class="form-control"  id="acc_no" name="acc_no" value="<%=acc.getAcc_no() %>" required>
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
		  <button type="submit" class="btn btn-success" name="task" value="verifiedAccount">Allow</button>
		  <button type="submit" class="btn btn-danger" name="task" value="rejectedAccount">Reject</button>
		</form>
		</div>        	  
      </div>
<%
   }
%>
 
 
  <div class="container">
  <div class="row">
    
    <div class="col-sm-6">
      <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:99%">
			  <h3>Pending Payments</h3>   <hr>   
			  <div style="height:300px;overflow-y:auto;width: 100%;">
			  <table class="table table-striped">
			 
			    <tbody style="height:1000px;overflow-y:auto;width: 100%;">
			     <%
			  List<PendingPayment> pps=(List<PendingPayment>)request.getAttribute("pendingPayments");
			  if(pps!=null && pps.size()!=0)
			  { for(PendingPayment pp:pps)
			  {
			  %>
			    <% if(pp.getStatus()==0){%>
			      <tr>
			        <td><%=pp.getAcc_no()%></td>
			        <td><%=pp.getName() %></td>
			        <td><%=pp.getAmount()%></td>
			       <td style="width:50%"><a href="MainController?task=managerPaymentVerify&acc_no=<%=pp.getAcc_no()%>"><button  type="button" class="btn btn-success float-right">Verify</button></a>
			       
			      </tr>
			       <%} %>
			      <%
			  }
				 }
				 %>
				 </tbody>
				 
			  </table>
			  </div>
			</div>
			</div>
		 <div class="col-sm-6">
       <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:99%">
			  <h3>Today's Transactions</h3>   <hr>   
			  <div style="height:300px;overflow-y:auto;width: 100%;">
			  <table class="table table-striped" style="width:99%">
			 
			    <tbody>
			     <%
			  List<Transaction> tt=(List<Transaction>)request.getAttribute("tt");
			  if(tt!=null && tt.size()!=0)
			  { for(Transaction t:tt)
			  {
			  %>     <tr style="width:99%">
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
			  } }
			 %>
				 </tbody>
			</table>
			</div>
			</div>
        </div>
    </div>
    <div class="row">
    	<div class="col-sm-6">
   			   <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:100%">
        <h3>New Account For Verification</h3>   <hr>
        <div style="height:300px;overflow-y:auto;width: 100%;">   
			  <table class="table table-striped">
			 
			    <tbody>
			     <%
			  List<User> accounts=(List<User>)request.getAttribute("accounts");
			  if(accounts!=null && accounts.size()!=0)
			  { for(User account:accounts)
			  {
			  %>
			      <tr>
			        <td><%=account.getName() %><br>
			        <%=account.getEmailid() %>
			        </td>
			        
			        <td style="width:50%"><a href="MainController?task=verify&acc_no=<%=account.getAcc_no()%>"><button  type="button" class="btn btn-success float-right">Verify</button></a>
			       
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
         <div class="col-sm-6">
       <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:100%">
			  <h3>Customer Query</h3>   <hr>   
			  <div style="height:300px;overflow-y:auto;overflow-x:auto;width: 100%;">
			  <table class="table table-striped" style="width:99%">
			 
			    <tbody>
			     <%
			  List<Query> report=(List<Query>)request.getAttribute("report");
			  if(report!=null && report.size()!=0)
			  { for(Query q:report)
			  {
			  %>		<tr style="width:auto">
				        <td><%=q.getQ_id() %></td>
				        <td><%=q.getName() %></td>
				        <td><%=q.getCategory() %></td>
				        <td><%=q.getQuery() %></td>
				        <td><%=q.getReply()%></td>
				          <td> <a href="MainController?task=replyToQuery&query=<%=q.getQ_id()%>"  class="btn btn-success"> Reply </a></td>
				        
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
</div>
</body>


</html>