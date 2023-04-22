package com.banking;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.query.criteria.internal.expression.function.SubstringFunction;

import javax.servlet.RequestDispatcher;
import com.banking.beans.*;

import com.mysql.cj.Session;

import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.Dispatcher;


/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class MainController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	boolean access,b; 
	int branchCode,status;
	String name,acc_no,admin_id,emp_id,customer_id,ifsc,post, email,emailid, password, gender, address, city, state, adhaar, pan, pno, category,message,receiver,sender,verify,dot;
	float balance,amount;
	List<User> accounts;
	List<Query> report;
	RequestDispatcher dispatcher;  //this is used to forward you to the specified page
	DBHandler db=new DBHandler(); // object of the database handler class where all operation related to database occur
	HttpSession session;  //use to hold details of the login type
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); //to set the format of date of transaction 
	LocalDateTime now = LocalDateTime.now();  // provide the current date
    Branch branch;
    Employee employee;
    List<Employee> employees;
    List<Branch> branchs;
    List<PendingPayment> pp;
    List<Transaction> tt;
    Cashinhand cashinhand;
    PendingPayment pendingPayment;
    User user;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//task will get the value according to which operation take place 
		String task=request.getParameter("task");
		
		System.out.println(task);
		switch(task)
		{
		
		case "admin_login":
			admin_id=request.getParameter("admin_id");
			password=request.getParameter("password");
			
			access=db.checkAdmin(admin_id,password);
			
			if(access==true)
			{
				branchs=db.getListOfBranchs();
				employees=db.getListOfEmployees();
				dispatcher=request.getRequestDispatcher("administrator_welcome.jsp");
				request.setAttribute("branchs", branchs);
				request.setAttribute("employees",employees);
				dispatcher.forward(request, response);
			}
			else
		 		response.sendRedirect("administrator_index.jsp?message=Invaild ID="+admin_id+" and password="+password+"");
			break;
		
		case "employee_login":
			emp_id=request.getParameter("emp_id");
			password=request.getParameter("password");
			post=request.getParameter("post");
			employee=db.checkEmployee(emp_id,password,post);
			if(employee!=null)
			{   session=request.getSession();
	            session.setAttribute("employee", employee);
	            session.setMaxInactiveInterval(900000000);
				if(post.equals("cashier"))
				{   branchCode=employee.getBranchCode();
					pp=db.getPendingPayments(branchCode);
					cashinhand=db.getBranchStatus(branchCode);
					request.setAttribute("cashinhand", cashinhand);
					dispatcher=request.getRequestDispatcher("cashier_welcome.jsp");
					request.setAttribute("pendingPayments", pp);
					tt=db.getdailyreport(branchCode+":BY CASH");
					request.setAttribute("tt", tt);
				    dispatcher.forward(request, response);
				}
				else if(post.equals("Manager"))
				{     
					branchCode=employee.getBranchCode();
					List<PendingPayment> pp=db.getPendingPayments(branchCode);
				  	accounts=db.getNewAccount();
	            	report=db.getCustomerQuery();
	            	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
	            	request.setAttribute("accounts", accounts);
					request.setAttribute("report", report);
					cashinhand=db.getBranchStatus(branchCode);
					tt=db.getdailyreport(branchCode+":BY CASH");
					request.setAttribute("tt", tt);
				    request.setAttribute("cashinhand", cashinhand);
					request.setAttribute("pendingPayments", pp);
				    dispatcher.forward(request, response);
				}
				else if(post.equals("officer"))
				{
				    session=request.getSession();
	                session.setAttribute("employee", employee);
	            	accounts=db.getNewAccount();
	            	report=db.getCustomerQuery();
	            	branchs=db.getListOfBranchs();
	            	session.setMaxInactiveInterval(900000000);
	                dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
					request.setAttribute("accounts", accounts);
					request.setAttribute("report", report);
					request.setAttribute("branchs",branchs);
					dispatcher.forward(request, response);
				}
			
			}
			else
				response.sendRedirect("employee_login.jsp?message=Invalid Id and Password");
			break;
	
			
		case "customer_login":  // to customer login 
					 emailid=request.getParameter("emailid");
					 password=request.getParameter("password");
					 User user=db.customer_login(emailid,password);
					 if(user!=null)
					 {
						    session=request.getSession();
			            	session.setAttribute("user", user);
			            	session.setMaxInactiveInterval(900000000);
			            	response.sendRedirect("customer_welcome.jsp");
					 }
					 else
					 {
						    
							dispatcher=request.getRequestDispatcher("index.jsp?message=Account does not exist");
							dispatcher.forward(request, response);
					 }
				
				break;
				
		
			
		case "adminSearchEmp":
			employees=db.getListOfEmployees();
			dispatcher=request.getRequestDispatcher("admin_search_emp.jsp");
			request.setAttribute("employees",employees);
			dispatcher.forward(request, response);
			break;
		
		case "adminSearchbranch":
			List<Branch> branchs=db.getListOfBranchs();
			dispatcher=request.getRequestDispatcher("admin_search_branch.jsp");
			request.setAttribute("branchs", branchs);
			dispatcher.forward(request, response);
		
			break;
			
			
		case "newBranch":
			name=request.getParameter("name").toUpperCase();
			city=request.getParameter("city");
			state=request.getParameter("state");
			ifsc="FAST0"+name.substring(0,5).toUpperCase();
			balance=0;
			branchCode=db.getLastBranch();
			if(branchCode!=0)
			{
				branchCode=branch.getBranchCode()+1;
				branch=new Branch(branchCode, name, city, state, ifsc);
				cashinhand=new Cashinhand(balance, branchCode);
				b=db.addNewranch(branch,cashinhand); 
				
			}
			else
				{
				 branchCode=533201;
				 branch=new Branch(branchCode, name, city, state, ifsc);
				 cashinhand=new Cashinhand( balance, branchCode);
				 b=db.addNewranch(branch,cashinhand); 
			    }
			
			if(b==true)
			{
				response.sendRedirect("admin_add_branch.jsp?message=Branch Added Successfully&branchCode="+branchCode+"&ifsc="+ifsc+"");
			}
			else
				response.sendRedirect("admin_add_branch.jsp?message=Error Occurred");
			break;
		
		case "veiwBranchDetails":
			branchCode= Integer.parseInt(request.getParameter("branchCode"));
			branch=db.getBranch(branchCode);
			employees=db.getEmployees(branchCode);
			dispatcher=request.getRequestDispatcher("admin_branch_details.jsp");
			request.setAttribute("branch", branch);
			request.setAttribute("employees", employees);
			dispatcher.forward(request, response);
			break;
			
		case "newEmployee":
			name=request.getParameter("name");
			post=request.getParameter("post");
			gender=request.getParameter("gender");
			city=request.getParameter("city");
			state=request.getParameter("state");
			adhaar=request.getParameter("adhaar");
			pan=request.getParameter("pan");
			branchCode=Integer.parseInt(request.getParameter("branchCode"));
			email=request.getParameter("emailid");
			pno=request.getParameter("pno");
			address=request.getParameter("address");
			Random random=new Random();
			password=email.substring(0,5)+random.nextInt(99);
			emp_id=db.getLastEmployee();
			if(emp_id.length()!=0)
			{ 
				int id=Integer.parseInt(emp_id.substring(4));
				id++;
				emp_id="F0M0"+id;
			}
			else
				emp_id="F0M0100101";
			employee=new Employee( emp_id,  branchCode,  name,  post,  gender,  email,  address, city,  state,  pno,  adhaar,  pan, password);
			b=db.addNewEmployee(employee);
			if(b==true)
			{
				response.sendRedirect("admin_add_emp.jsp?message=Empolyee add successfully");
			}
			else
				response.sendRedirect("admin_add_emp.jsp?message=Error Occurred");
			break;
			
		case "admin_found_emp": // to find the employee by emp_id
			emp_id=request.getParameter("emp_id");
			employee=db.getEmployee(emp_id);
			if(employee!=null)
			{dispatcher=request.getRequestDispatcher("admin_dlt_emp.jsp");
			request.setAttribute("employee", employee);
			dispatcher.forward(request, response);
			}
			else
				response.sendRedirect("admin_dlt_emp.jsp?message=Employee Not Found");	
			break;
			
		case "delete_emp":
			emp_id=request.getParameter("emp_id");
			b=db.deleteEmployee(emp_id);
			if(b==true)
				response.sendRedirect("admin_dlt_emp.jsp?message=Employee Deleted");
			else
				response.sendRedirect("admin_dlt_emp.jsp?message=Error Occurred");
			break;
			
		case "admin_found_branch":
			branchCode=Integer.parseInt(request.getParameter("branchCode"));
			branch=db.getBranch(branchCode);
			if(branch!=null)
			{dispatcher=request.getRequestDispatcher("admin_dlt_branch.jsp");
			request.setAttribute("branch", branch);
			dispatcher.forward(request, response);
			}
			else
				response.sendRedirect("admin_dlt_branch.jsp?message=Branch Not Found");	
			break;
			
		case "deleteBranch":
			branchCode=Integer.parseInt(request.getParameter("branchCode"));
			b=db.deleteBranch(branchCode);
			if(b==true)
				response.sendRedirect("admin_dlt_branch.jsp?message=Branch Deleted");
			else
				response.sendRedirect("admin_dlt_branch.jsp?message=Error Occurred");
			
			break;
			
			
		case "signup":       //send you to singup page
			branchs=db.getListOfBranchs();
			dispatcher=request.getRequestDispatcher("signup.jsp");
			request.setAttribute("branchs", branchs);
			dispatcher.forward(request, response);
			break;
		
		case "newAccount":   //add the new user to user table 
			 System.out.println("line1");
			 name=request.getParameter("name");
			 emailid=request.getParameter("emailid");
			 password=request.getParameter("password");
			 gender=request.getParameter("gender");
			 address=request.getParameter("address");
			 city=request.getParameter("city");
			 state=request.getParameter("state");
			 adhaar=request.getParameter("adhaar");
			 pan=request.getParameter("pan");
			 pno=request.getParameter("pno");
			 System.out.println("line2");
			 InputStream photo= null;
			 Part pic=request.getPart("photo");
			 System.out.println("line3");
			 photo = pic.getInputStream();
			 System.out.println("line4");
			 branchCode=Integer.parseInt(request.getParameter("branchCode"));
			 balance=0;
			 verify="unverified";
			 String lastacc=db.getLastAccountNo(branchCode);
			 customer_id=db.getLastCustomerID();
			 System.out.println("line5");
			 if(customer_id!=null)
			 {
				 int id=Integer.parseInt(customer_id.substring(7))+1;
			     customer_id="CUS0FM0"+id;
			 }
			 else 	customer_id="CUS0FM01";
			 
			 if(lastacc!=null)
			 {   int acc=Integer.parseInt(lastacc)+1;
				 lastacc=""+acc;
				 int length=lastacc.length();
				 length=8-length;
				 String zero="";
				 for(int i=0;i<length;i++)
				 {
					 zero=zero+0;
				 }
				 acc_no=branchCode+zero+lastacc;
				}
			 else {
				acc_no=branchCode+"00000101";
			
			 }
			 System.out.println("line6");
			 User account=new User( name, emailid,  password,  gender,  address,  city, state,  pno,  adhaar,  pan, balance,verify,branchCode,acc_no,customer_id);
			 System.out.println("line7");
			 b=db.newAccount(account,photo);
			 System.out.println("line8");
			  
			if(b==true)
			{   Employee e=null;
				session=request.getSession();
			    e=(Employee)session.getAttribute("employee");
				if(e!=null)
				{
					accounts=db.getNewAccount();
					report=db.getCustomerQuery();
					session=request.getSession();
					session.setMaxInactiveInterval(900000000);
					employee=(Employee)session.getAttribute("employee");
					if(employee.getPost().equalsIgnoreCase("Manager"))
						{	
							branchCode=employee.getBranchCode();
				        	List<PendingPayment> pp=db.getPendingPayments(branchCode);
						  	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
				        	request.setAttribute("accounts", accounts);
							request.setAttribute("report", report);
							cashinhand=db.getBranchStatus(branchCode);
							tt=db.getdailyreport(branchCode+":BY CASH");
							request.setAttribute("tt", tt);
							request.setAttribute("cashinhand", cashinhand);
							request.setAttribute("pendingPayments", pp);
							request.setAttribute("message", message);
						    dispatcher.forward(request, response);
						}
					else 
						{
							branchs=db.getListOfBranchs();
			            	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
							request.setAttribute("accounts", accounts);
							request.setAttribute("report", report);
							request.setAttribute("branchs",branchs);
							request.setAttribute("message", message);
							dispatcher.forward(request, response);
						}
		            
				}
				else
				{ 
					if(b==true)
						{
						String message="Resgistration Completed Please Wait for 1 day for verification";
					    dispatcher=request.getRequestDispatcher("customer_index.jsp");
						request.setAttribute("message", message);
						dispatcher.forward(request, response);
						}
					else
					    {
						String message="Error Occured";
						dispatcher=request.getRequestDispatcher("customer_index.jsp");
						request.setAttribute("message", message);
						dispatcher.forward(request, response);
				    	}
				}
		}
			break;
		
		case "admin_home":
			branchs=db.getListOfBranchs();
			employees=db.getListOfEmployees();
			dispatcher=request.getRequestDispatcher("administrator_welcome.jsp");
			request.setAttribute("branchs", branchs);
			request.setAttribute("employees",employees);
			dispatcher.forward(request, response);
			break;
			
		case "manager_home":
			session=request.getSession();
			employee=(Employee)session.getAttribute("employee");
			session.setMaxInactiveInterval(700000000);
			branchCode=employee.getBranchCode();
			List<PendingPayment> pp=db.getPendingPayments(branchCode);
		  	accounts=db.getNewAccount();
        	report=db.getCustomerQuery();
        	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
        	request.setAttribute("accounts", accounts);
			request.setAttribute("report", report);
			cashinhand=db.getBranchStatus(branchCode);
			tt=db.getdailyreport(branchCode+":BY CASH");
			request.setAttribute("tt", tt);
		    request.setAttribute("cashinhand", cashinhand);
			request.setAttribute("pendingPayments", pp);
		    dispatcher.forward(request, response);

			break;
			
		case "cashier_home":
			session=request.getSession();
			employee=(Employee)session.getAttribute("employee");
			session.setMaxInactiveInterval(700000000);
			branchCode=employee.getBranchCode();
			pp=db.getPendingPayments(branchCode);
			cashinhand=db.getBranchStatus(branchCode);
			request.setAttribute("cashinhand", cashinhand);
			dispatcher=request.getRequestDispatcher("cashier_welcome.jsp");
			request.setAttribute("pendingPayments", pp);
			tt=db.getdailyreport(branchCode+":BY CASH");
			request.setAttribute("tt", tt);
		    dispatcher.forward(request, response);
			break;
			
		case "officer_home":   //send to the officer homepage by adding the list of new account(unverified once's)
			
			accounts=db.getNewAccount();
			report=db.getCustomerQuery();
            dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
			request.setAttribute("accounts", accounts);
			request.setAttribute("report", report);
			dispatcher.forward(request, response);
			
			break;
			
		case "verify":       //provide the details of the new account which is needed to be check by the officer  
			acc_no=request.getParameter("acc_no"); 
			User new_acc=db.getAccount(acc_no);
			accounts=db.getNewAccount();
			report=db.getCustomerQuery();
			session=request.getSession();
			session.setMaxInactiveInterval(900000000);
			employee=(Employee)session.getAttribute("employee");
			if(employee.getPost().equalsIgnoreCase("Manager"))
				{	
					branchCode=employee.getBranchCode();
		        	pp=db.getPendingPayments(branchCode);
				  	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
		        	request.setAttribute("accounts", accounts);
					request.setAttribute("report", report);
					tt=db.getdailyreport(branchCode+":BY CASH");
					request.setAttribute("tt", tt);
					cashinhand=db.getBranchStatus(branchCode);
					request.setAttribute("cashinhand", cashinhand);
					request.setAttribute("pendingPayments", pp);
					request.setAttribute("account", new_acc);
				    dispatcher.forward(request, response);
				}
			else 
				{
					branchs=db.getListOfBranchs();
	            	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
					request.setAttribute("accounts", accounts);
					request.setAttribute("report", report);
					request.setAttribute("branchs",branchs);
					request.setAttribute("account", new_acc);
					dispatcher.forward(request, response);
				}
            break;
            
            
		case "verifiedAccount":      //after verification make the account from unverified to verified now user can login as customer
		 	 acc_no=request.getParameter("acc_no");
		     name=request.getParameter("name");
			 emailid=request.getParameter("emailid");
			 password=request.getParameter("password");
			 gender=request.getParameter("gender");
			 address=request.getParameter("address");
			 city=request.getParameter("city");
			 state=request.getParameter("state");
			 adhaar=request.getParameter("adhaar");
			 pan=request.getParameter("pan");
			 pno=request.getParameter("pno");
			 balance=0;			 
			 User new_customer=new User(acc_no,name,  emailid,  password,  gender,  address,  city, state,  pno,  adhaar,  pan,balance,verify);
			 message=db.add_new_user(new_customer);
			 accounts=db.getNewAccount();
			 session=request.getSession();
			 session.setMaxInactiveInterval(900000000);
			 employee=(Employee)session.getAttribute("employee");
			 if(employee.getPost().equalsIgnoreCase("Manager"))
			 {
			 branchCode=employee.getBranchCode();
	         pp=db.getPendingPayments(branchCode);
         	 dispatcher=request.getRequestDispatcher("manager_welcome.jsp?");
			 request.setAttribute("accounts", accounts);
			 request.setAttribute("message", message);
			 request.setAttribute("report", report);
			 tt=db.getdailyreport(branchCode+":BY CASH");
				request.setAttribute("tt", tt);
			 cashinhand=db.getBranchStatus(branchCode);
				request.setAttribute("cashinhand", cashinhand);
			 request.setAttribute("pendingPayments", pp);
			 dispatcher.forward(request, response);
			 }
			 
			 else 
			 {
				    branchs=db.getListOfBranchs();
	            	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
					request.setAttribute("accounts", accounts);
					request.setAttribute("report", report);
					 request.setAttribute("message", message);
					request.setAttribute("branchs",branchs);
					dispatcher.forward(request, response);
			 }
			 
			 break;
			 
			 
		case "rejectedAccount":    //delete the account from user table when officer reject the new account details after checking
			acc_no=request.getParameter("acc_no");
			message=db.delete_newAccount(acc_no);
			accounts=db.getNewAccount();
			session=request.getSession();
			session.setMaxInactiveInterval(900000000);
			employee=(Employee)session.getAttribute("employee");
			if(employee.getPost().equalsIgnoreCase("Manager"))
			 {
			 branchCode=employee.getBranchCode();
	         pp=db.getPendingPayments(branchCode);
        	 dispatcher=request.getRequestDispatcher("manager_welcome.jsp?");
			 request.setAttribute("accounts", accounts);
			 tt=db.getdailyreport(branchCode+":BY CASH");
				request.setAttribute("tt", tt);
			 request.setAttribute("message", message);
			 cashinhand=db.getBranchStatus(branchCode);
				request.setAttribute("cashinhand", cashinhand);
			 request.setAttribute("report", report);
			 request.setAttribute("pendingPayments", pp);
			 dispatcher.forward(request, response);
			 }
			 
			 else 
			 {
				    branchs=db.getListOfBranchs();
	            	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
					request.setAttribute("accounts", accounts);
					request.setAttribute("report", report);
					 request.setAttribute("message", message);
					request.setAttribute("branchs",branchs);
					dispatcher.forward(request, response);
			 }
			break;
	    
			 
			 
		case "deposit":  //use the deposit money to the user account by officer 
			acc_no=request.getParameter("acc_no");
			name=request.getParameter("name");
			amount=Float.parseFloat(request.getParameter("amount"));
			dot= dtf.format(now);
		    receiver=request.getParameter("acc_no")+":"+name;
		    session=request.getSession();
		    employee=(Employee)session.getAttribute("employee");
		    branchCode=employee.getBranchCode();
		    sender=branchCode+":BY CASH";
			Transaction tran=new Transaction( receiver, sender, dot,  amount);
			message=db.deposit(acc_no,name,amount,branchCode,tran);
		    accounts=db.getNewAccount();
		    tt=db.getdailyreport(branchCode+":BY CASH");
		    pp=db.getPendingPayments(branchCode);
			dispatcher=request.getRequestDispatcher("cashier_welcome.jsp?message=Request Raised For Transaction ");
			request.setAttribute("tt",tt);
			cashinhand=db.getBranchStatus(branchCode);
			request.setAttribute("cashinhand", cashinhand);
			request.setAttribute("pendingPayments", pp);
			request.setAttribute("message", message);
			dispatcher.forward(request, response);
			
			break;
		
		case "withdrawal":  // use to deduct money from user account by the officer
			acc_no=request.getParameter("acc_no");
			name=request.getParameter("name");
			amount=Float.parseFloat(request.getParameter("amount"));
			dot= dtf.format(now);
		    sender =acc_no+":"+name;
		    session=request.getSession();
		    session.setMaxInactiveInterval(900000000);
		    employee=(Employee)session.getAttribute("employee");
		    branchCode=employee.getBranchCode();
		    receiver=branchCode+":BY CASH";
		    Transaction trans=new Transaction( receiver, sender, dot,  amount);
			if(amount<200000)
			{
			pp=db.getPendingPayments(branchCode);
			message=db.withdrawal(acc_no,name,amount,  branchCode,trans);
			accounts=db.getNewAccount();
			tt=db.getdailyreport(branchCode+":BY CASH");
			dispatcher=request.getRequestDispatcher("cashier_welcome.jsp");
			request.setAttribute("message", message);
			request.setAttribute("tt",tt);
			cashinhand=db.getBranchStatus(branchCode);
			request.setAttribute("cashinhand", cashinhand);
			request.setAttribute("pendingPayments", pp);
			dispatcher.forward(request, response);	
			}
			else
			{  message=db.checkPendingPayment( acc_no, amount);
			   if(message.equals("successful"))
				{status=0;
			     branchCode=Integer.parseInt(request.getParameter("branchCode"));
				 pendingPayment= new PendingPayment(acc_no, amount, name, status,branchCode);
				 b=db.addpendingPayment(pendingPayment);
				 if(b==true)
				 {
					 	message="Request for Payment Successful";
					    pp=db.getPendingPayments(branchCode);
					    tt=db.getdailyreport(branchCode+":BY CASH");
					 	dispatcher=request.getRequestDispatcher("cashier_welcome.jsp?message=Request Raised For Transaction ");
						request.setAttribute("pendingPayments", pp);
						request.setAttribute("tt",tt);
						cashinhand=db.getBranchStatus(branchCode);
						request.setAttribute("cashinhand", cashinhand);
						request.setAttribute("message", message);
					    dispatcher.forward(request, response);
				 }
				}
				 else
				 {
					    tt=db.getdailyreport(branchCode+":BY CASH");
					    pp=db.getPendingPayments(branchCode);
						dispatcher=request.getRequestDispatcher("cashier_welcome.jsp?message=Balance is Low");
						request.setAttribute("pendingPayments", pp);
						cashinhand=db.getBranchStatus(branchCode);
						request.setAttribute("cashinhand", cashinhand);
						request.setAttribute("message", message);
						request.setAttribute("tt", tt);
					    dispatcher.forward(request, response);
				 }
			}
			break;		
         
		case "cheque":
			dispatcher=request.getRequestDispatcher("cheque.jsp");
			cashinhand=db.getBranchStatus(branchCode);
			request.setAttribute("cashinhand", cashinhand);
		    dispatcher.forward(request, response);
			
			
		case "managerPaymentVerify":
			acc_no=request.getParameter("acc_no");
			pendingPayment=db.getPendingPayments(acc_no);
			account=db.getAccount(acc_no);
			dispatcher=request.getRequestDispatcher("manager_paymentVerify.jsp");
			request.setAttribute("account",account);
			request.setAttribute("pendingPayment", pendingPayment);
			cashinhand=db.getBranchStatus(branchCode);
			request.setAttribute("cashinhand", cashinhand);
		    dispatcher.forward(request, response);
			break;
		
		case "Payment Verified":
			acc_no=request.getParameter("acc_no");
			message=db.verifyPayment(acc_no);
		
				session=request.getSession();
				session.setMaxInactiveInterval(900000000);
				employee=(Employee)session.getAttribute("employee");
				branchCode=employee.getBranchCode();
				 pp=db.getPendingPayments(branchCode);
			  	accounts=db.getNewAccount();
            	report=db.getCustomerQuery();
            	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
            	request.setAttribute("accounts", accounts);
            	cashinhand=db.getBranchStatus(branchCode);
            	tt=db.getdailyreport(branchCode+":BY CASH");
				request.setAttribute("tt", tt);
            	request.setAttribute("cashinhand", cashinhand);
				request.setAttribute("report", report);
				request.setAttribute("pendingPayments", pp);
				request.setAttribute("message", message);
			    dispatcher.forward(request, response);
			
			break;
	    
		case "Payment Rejected":
				acc_no=request.getParameter("acc_no");
			    message=db.deletePayment(acc_no);
			    session=request.getSession();
				session.setMaxInactiveInterval(900000000);
				employee=(Employee)session.getAttribute("employee");
				branchCode=employee.getBranchCode();
				 pp=db.getPendingPayments(branchCode);
			  	accounts=db.getNewAccount();
            	report=db.getCustomerQuery();
            	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
            	request.setAttribute("accounts", accounts);
            	cashinhand=db.getBranchStatus(branchCode);
            	tt=db.getdailyreport(branchCode+":BY CASH");
				request.setAttribute("tt", tt);
            	request.setAttribute("cashinhand", cashinhand);
				request.setAttribute("report", report);
				request.setAttribute("pendingPayments", pp);
				request.setAttribute("message", message);
			    dispatcher.forward(request, response);
		
			break;
			
		case "cashierCompletePayment":
			
			acc_no=request.getParameter("acc_no");
			pendingPayment=db.checkPendingPayment(acc_no);
			 if(pendingPayment!=null)
			    {
				    sender=pendingPayment.getAcc_no()+":"+pendingPayment.getName();
				    session=request.getSession();
				    session.setMaxInactiveInterval(900000000);
				    employee=(Employee)session.getAttribute("employee");
				    branchCode=employee.getBranchCode();
				    receiver=branchCode+":BY CASH";
				    dot= dtf.format(now);
				    amount=pendingPayment.getAmount();
				    name=pendingPayment.getName();
				    trans=new Transaction( receiver, sender, dot,  amount);
				    message=db.withdrawal(acc_no,name,amount,  branchCode,trans);
					
			    }
			
			if(message.equals("Withdrawal Successful"))
			{          
					    pp=db.getPendingPayments(branchCode);
						tt=db.getdailyreport(branchCode+":BY CASH");
						dispatcher=request.getRequestDispatcher("cashier_welcome.jsp");
						request.setAttribute("pendingPayments", pp);
						cashinhand=db.getBranchStatus(branchCode);
						request.setAttribute("cashinhand", cashinhand);
						request.setAttribute("tt",tt);
						request.setAttribute("message", message);
					    dispatcher.forward(request, response);
					  
			}
			else {
				message="Insufficient Balance";
			    pp=db.getPendingPayments(branchCode);
			    tt=db.getdailyreport(branchCode+":BY CASH");
				dispatcher=request.getRequestDispatcher("cashier_welcome.jsp");
				request.setAttribute("pendingPayments", pp);
				cashinhand=db.getBranchStatus(branchCode);
				request.setAttribute("cashinhand", cashinhand);
				request.setAttribute("tt",tt);
				request.setAttribute("message", message);
			    dispatcher.forward(request, response);
			  
			}
		
			break;
			
		case "transfer":  // use to transfer money from one account to another
		    session=request.getSession();
			User u=(User)session.getAttribute("user");
			password=request.getParameter("password");
			acc_no=request.getParameter("acc_no");
			String receiver=request.getParameter("acc_no")+":"+request.getParameter("name");
			String sender=u.getAcc_no()+":"+u.getName();
			String acc=u.getAcc_no();
			dot= dtf.format(now);
		    amount=Float.parseFloat(request.getParameter("amount"));
			if(password.equals(u.getPassword()))
			{
				Transaction pay=new Transaction(receiver, sender, dot,  amount);
				message=db.transfer(pay,acc_no,acc,amount);
				response.sendRedirect("money_transfer.jsp?message="+message+"");
			}
			else
			{
				response.sendRedirect("money_transfer.jsp?message=Incorrect Password");
			}
			break;
	
		case "branchStatus":
			status=Integer.parseInt(request.getParameter("status"));
			session=request.getSession();
			employee=(Employee)session.getAttribute("employee");
			branchCode=employee.getBranchCode();
			cashinhand=new Cashinhand(branchCode, status);
			db.changeBranchSatus(cashinhand);
			pp=db.getPendingPayments(branchCode);
		  	accounts=db.getNewAccount();
        	report=db.getCustomerQuery();
        	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
        	request.setAttribute("accounts", accounts);
			request.setAttribute("report", report);
			cashinhand=db.getBranchStatus(branchCode);
			tt=db.getdailyreport(branchCode+":BY CASH");
			request.setAttribute("tt", tt);
			request.setAttribute("cashinhand", cashinhand);
			request.setAttribute("pendingPayments", pp);
		    dispatcher.forward(request, response);
			break;
			
		case "cashier_transfer":
			String sacc_no=request.getParameter("sacc_no");
			String sname=request.getParameter("sname");
			String racc_no=request.getParameter("racc_no");
			String rname=request.getParameter("rname");
			receiver=racc_no+":"+rname;
			sender=sacc_no+":"+sname;
			dot= dtf.format(now);
		    amount=Float.parseFloat(request.getParameter("amount"));
		    Transaction pay=new Transaction(receiver, sender, dot,  amount);
			message=db.transfer(pay,racc_no,sacc_no,amount);
			 tt=db.getdailyreport(branchCode+":BY CASH");
			    pp=db.getPendingPayments(branchCode);
				dispatcher=request.getRequestDispatcher("cashier_welcome.jsp");
				request.setAttribute("pendingPayments", pp);
				request.setAttribute("message", message);
				request.setAttribute("tt", tt);
				cashinhand=db.getBranchStatus(branchCode);
				request.setAttribute("cashinhand", cashinhand);
			    dispatcher.forward(request, response);
			break;
			
		case "passbook":  // provide the list of the transactions
		    session=request.getSession();
			User user1=(User)session.getAttribute("user");
			name=user1.getAcc_no()+":"+user1.getName();
			balance=db.getBalance(user1.getAcc_no());
			List<Transaction> passbook=db.getAccountStatement(name);
			dispatcher=request.getRequestDispatcher("passbook.jsp");
			request.setAttribute("statement", passbook);
			request.setAttribute("balance", balance);
			dispatcher.forward(request, response);
			break;
			
		case "daily_report": // provide the list of the daily transactions
			session=request.getSession();
			User user2=(User)session.getAttribute("user");
			balance=db.getBalance(user2.getAcc_no());
			name=user2.getAcc_no()+":"+user2.getName();
			List<Transaction> statement=db.getdailyreport(name);
			dispatcher=request.getRequestDispatcher("daily_report.jsp");
			request.setAttribute("statement", statement);
			request.setAttribute("balance", balance);
			dispatcher.forward(request, response);
			break;
			
			
		case "transferPage":  //send to transfer page
			response.sendRedirect("money_transfer.jsp");
			break;
			
			
		case "changepassword": // send to user change password page
			dispatcher=request.getRequestDispatcher("change_password.jsp");
			dispatcher.forward(request, response);
		
			break;
		
		case "officer_password": // change the officer password
			session=request.getSession();
			employee=(Employee)session.getAttribute("employee");
			session.setMaxInactiveInterval(900000000);
			emp_id=employee.getEmp_id();
			String new_pass=request.getParameter("newpassword");
			password=request.getParameter("password");
			if(password.equals(employee.getPassword()))
			{
				message=db.officer_newpassword(emp_id,new_pass);
				response.sendRedirect("officer_password.jsp?message="+message+"");
				 
			}
			else
			{
				response.sendRedirect("officer_password.jsp?message=Old password is wrong");
			}
			break;
			
		case "new_password":  //change the user password
			session=request.getSession();
			user=(User)session.getAttribute("user");
			acc_no=user.getAcc_no();
			String new_pass1=request.getParameter("newpassword");
			password=request.getParameter("password");
			if(password.equals(user.getPassword()))
			{
				message=db.changepassword(acc_no,new_pass1);
				response.sendRedirect("customer_welcome.jsp?message="+message+"");
				 
			}
			else
			{
				response.sendRedirect("change_password.jsp?message=Old password is wrong");
			}
			break;
		
		case "logout_officer": // delete the session and send to index page
			session=request.getSession();
			session.removeAttribute("officer");
			response.sendRedirect("index.jsp");
			break;
			
		case "logout_user": // delete the session and send to index page
			session=request.getSession();
			session.removeAttribute("user");
			response.sendRedirect("index.jsp");
			break;
			
		case "customer_details":  //send officer to customer detail page
			response.sendRedirect("customer_details.jsp");
			break;
		
		case "myAccountDetails":  //send user the their account detail page
			session=request.getSession();
			user=(User)session.getAttribute("user");
			session.setMaxInactiveInterval(900000000);
			branchCode=user.getBranchCode();
			acc_no=user.getAcc_no();
			account=db.getAccount(acc_no);
			branch=db.getBranch(branchCode);
			dispatcher=request.getRequestDispatcher("myAccountDetails.jsp");
			request.setAttribute("branch",branch);
			request.setAttribute("account", account);
			dispatcher.forward(request, response);
			break;
			
		case "search_account":    //used to search the account by account no
			acc_no=request.getParameter("acc_no");
			User searched_acc=db.getAccount(acc_no);
			
			PhotoDAO dao = new PhotoDAO();
	         
	        try {
	            String img = dao.get(acc_no);             
	            request.setAttribute("img",img);
	            System.out.println("Done_2");
	           
	                  
	        } catch (SQLException ex) {
	            throw new ServletException(ex);
	        }
	        
			
			
			
			if(searched_acc!=null )
				{
					dispatcher=request.getRequestDispatcher("customer_details.jsp");
					request.setAttribute("account", searched_acc);
				    dispatcher.forward(request, response);
				}
			else 
				response.sendRedirect("customer_details.jsp?message=Account Not Found");
			break;
			
		case "apply_changes": //change the details of the user by officer
			 acc_no=request.getParameter("acc_no");
			 name=request.getParameter("name");
			 emailid=request.getParameter("emailid");
			 branchCode=Integer.parseInt(request.getParameter("branchCode"));
			 password=request.getParameter("password");
			 gender=request.getParameter("gender");
			 address=request.getParameter("address");
			 city=request.getParameter("city");
			 state=request.getParameter("state");
			 adhaar=request.getParameter("adhaar");
			 pan=request.getParameter("pan");
			 pno=request.getParameter("pno");
			 customer_id=request.getParameter("customer_id");
			 User change_details= new User(acc_no,name,  emailid,  password,  gender,  address,  city, state,  pno,  adhaar,  pan,branchCode,customer_id);
			 message=db.update_details(change_details);
			 response.sendRedirect("customer_details.jsp?message="+message+"");
			break;
			
		
			
       case "query_report":   //provide the list of query to the user
    	  
    	   session=request.getSession();
    	   user=(User)session.getAttribute("user");
    	   name=(user.getAcc_no()+":"+user.getName()).toString();
    	   		List<Query> report1=db.getQueryreport(name);
    	   		dispatcher=request.getRequestDispatcher("customer_query.jsp?message=");
				request.setAttribute("query_report", report1);
			    dispatcher.forward(request, response);
			    break;
			    
			    
			    
       case "customer_query":  //send the user query
    	   session=request.getSession();
    	   user=(User)session.getAttribute("user");
    	   name=(user.getAcc_no()+":"+user.getName()).toString();
    	   category=request.getParameter("category");
    	   String query=request.getParameter("query");
    	   Query qu=new Query(name, category, query);
    	   boolean q=db.sendQuery(qu);
    	   List<Query> report=db.getQueryreport(name);
    	   if(q==true)
    	   {
    		   dispatcher=request.getRequestDispatcher("customer_query.jsp?message=Query Raised Successful");
				request.setAttribute("query_report", report);
			    dispatcher.forward(request, response);
    	   }
    	   else
    	   {
    		   
    		   dispatcher=request.getRequestDispatcher("customer_query.jsp?message=Some Error Occurred");
				request.setAttribute("query_report", report);
			    dispatcher.forward(request, response);  
    	   }
    	   break;
			
			
       case "replyToQuery": //send to reply query page
    	   int q_id=Integer.parseInt(request.getParameter("query"));
    	   Query cq=db.getQuery(q_id);
    	   dispatcher=request.getRequestDispatcher("reply_query.jsp");
			request.setAttribute("query", cq);
		    dispatcher.forward(request, response);  
    	   break;
    	   
       case "sendreply":  //officer reply to query
    	   
    	  int qid=Integer.parseInt(request.getParameter("q_id"));
    	  String reply=request.getParameter("reply");
    	  boolean r=db.sendreply(qid,reply);
    	  if(r==true)
    	  {  message="Reply Send";
    		 accounts=db.getNewAccount();
  			report=db.getCustomerQuery();
  			session=request.getSession();
  			session.setMaxInactiveInterval(900000000);
  			employee=(Employee)session.getAttribute("employee");
  			if(employee.getPost().equalsIgnoreCase("Manager"))
  				{	
  					branchCode=employee.getBranchCode();
  		            pp=db.getPendingPayments(branchCode);
  				  	dispatcher=request.getRequestDispatcher("manager_welcome.jsp");
  		        	request.setAttribute("accounts", accounts);
  					request.setAttribute("report", report);
  					request.setAttribute("pendingPayments", pp);
  					cashinhand=db.getBranchStatus(branchCode);
  					tt=db.getdailyreport(branchCode+":BY CASH");
					request.setAttribute("tt", tt);
  					request.setAttribute("cashinhand", cashinhand);
  					request.setAttribute("message", message);
  				    dispatcher.forward(request, response);
  				}
  			else 
  				{
  					branchs=db.getListOfBranchs();
  	            	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
  					request.setAttribute("accounts", accounts);
  					request.setAttribute("report", report);
  					request.setAttribute("branchs",branchs);
  					request.setAttribute("message", message);
  					dispatcher.forward(request, response);
  				}
              

    	  }
    	  else
    	  {
    		  Query c=db.getQuery(qid);
       	   dispatcher=request.getRequestDispatcher("reply_query.jsp");
   			request.setAttribute("query", c);
   		    dispatcher.forward(request, response);  
       	     
    	  }
    	  break;
    	  
       case "deleteQuery": // delete the query 
    	   int q_id1=Integer.parseInt(request.getParameter("qid"));
    	   boolean d=db.deleteQuery(q_id1);
    	   session=request.getSession();
    	   user=(User)session.getAttribute("user");
    	   name=(user.getAcc_no()+":"+user.getName()).toString();
    	   	List<Query> report2=db.getQueryreport(name);
    	   if(d==true)
    	   {
    		   dispatcher=request.getRequestDispatcher("customer_query.jsp?message=Query resolved");
				request.setAttribute("query_report", report2);
			    dispatcher.forward(request, response);
    	   }
    	   else
    	   {
    		   dispatcher=request.getRequestDispatcher("customer_query.jsp?message=Some Error Occurred");
				request.setAttribute("query_report", report2);
			    dispatcher.forward(request, response);
    	   }
    	   break;
    	   
		}
		
		
		
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
