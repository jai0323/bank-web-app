<%@page import="com.banking.beans.Employee"%>
<%@page import="com.banking.beans.Branch"%>
<%@page import="java.util.List"%>
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
<title>Admin Login</title>
</head>

<body>
<nav class="navbar navbar-expand-sm  bg-primary navbar-dark ">
   <a class="navbar-brand" href="#">
    <img src="images/bank_logo.png" alt="Logo" style="width:50px;">
  </a>
  <h3><a class="navbar-brand" href="#">FAST MONEY</a></h3>
   <h4 class="rounded-circle bg-light" style="float: right;margin-left:auto;margin-right:0">&nbsp;  Admin  &nbsp;</h4>
 
</nav>

<nav class="navbar navbar-expand-sm bg-primary">

  <!-- Links -->
  <ul class="navbar-nav " style="margin-left:20px">
    <li class="nav-item">
      <a class="nav-link text-white " href="MainController?task=admin_home">Home</a>
    </li>
   </ul>
   <a href="MainController?task=logout_officer" class="btn btn-success bg-warning border border-danger " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
   
 </nav>
<br>
<div class="container">
	<div class="row">
		<div class="col-sm-4 text-center">
		<a href="admin_add_emp.jsp" class="btn btn-info btn-lg">Add Employ</a>
		</div>
		<div class="col-sm-4 text-center">
		<a href="admin_dlt_emp.jsp" class="btn btn-info btn-lg">Delete Employ</a>
		</div>
		<div class="col-sm-4 text-center">
		<a href="MainController?task=adminSearchEmp" class="btn btn-info btn-lg">Employees List</a>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-sm-4 text-center ">
		<a href="admin_add_branch.jsp" class="btn btn-info btn-lg">Add Branch</a>
		</div>
		<div class="col-sm-4 text-center">
		<a href="admin_dlt_branch.jsp" class="btn btn-info btn-lg">Delete Branch</a>
		</div>
		<div class="col-sm-4 text-center">
		<a href="MainController?task=adminSearchbranch" class="btn btn-info btn-lg">Branches List</a>
		</div>
	</div>
</div>
<br>
<div class="container">
<div class="row">
<div class="col-sm-6"  >
     
      <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" data-spy="scroll" style="width:99%;height:400px">
			  <h3>List Of Branches</h3>     
			  <table class="table table-striped">
			  <thead>
			  <tr>
			  <th style="width:30%">Name</th>
			  <th style="width:30%">Branch Code</th>
			  <th></th>
			  
			  </tr>
			  </thead>
			    <tbody>
			     <%
			  List<Branch> branchs=(List<Branch>)request.getAttribute("branchs");
			  if(branchs!=null && branchs.size()!=0)
			  { for(Branch branch:branchs)
			  {
			  %>
			      <tr>
			        <td><%=branch.getName() %></td>
			        <td><%=branch.getBranchCode()%></td>
			        <td style="width:50%"><a href="MainController?task=veiwBranchDetails&branchCode=<%=branch.getBranchCode()%>" class="btn btn-success float-right">Veiw Details</a>
                    </td>			       
			      </tr>
			      <%
			  }
				 }
				 %>
				 </tbody>
				 
			  </table>
			</div>
</div>

<div class="col-sm-6"  >
     
      <div   class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:99%;height:400px">
			  <h3>List Of Employees</h3>     
			  <table class="table table-striped">
			  <thead>
			  <tr>
			  <th style="width:30%">Name</th>
			  <th style="width:30%" >Employee ID</th>
			  </tr>
			  </thead>
			    <tbody>
			     <%
			 List<Employee> employees=(List<Employee>)request.getAttribute("employees");
			  if(employees!=null && employees.size()!=0)
			  { for(Employee employee:employees)
			  {
			  %>
			      <tr>
			        <td><%=employee.getName() %></td>
			        <td><%=employee.getEmp_id()%></td>
			        <td style="width:50%"><a href="MainController?task=veiwBranchDetails&branchCode=<%=employee.getBranchCode()%>" class="btn btn-success float-right">Veiw Details</a>
                    </td>			       
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