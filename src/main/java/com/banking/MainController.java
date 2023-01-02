package com.banking;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import com.banking.beans.*;
import com.mysql.cj.Session;

import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.Dispatcher;


/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	
	int acc_no;
	String name, emailid, password, gender, address, city, state, adhaar, pan, pno, category,message,receiver,sender,verify,dot;
	float balance,amount;
	List<User> accounts;
	List<Query> report;
	RequestDispatcher dispatcher;  //this is used to forward you to the specified page
	DBHandler db=new DBHandler(); // object of the database handler class where all operation related to database occur
	HttpSession session;  //use to hold details of the login type
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); //to set the format of date of transaction 
	LocalDateTime now = LocalDateTime.now();  // provide the current date
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//task will get the value according to which operation take place 
		String task=request.getParameter("task");
		
		
		switch(task)
		{
		
		case "signup":       //send you to singup page
			response.sendRedirect("signup.jsp");
			break;
		
		case "newAccount":   //add the new user to user table 
			 
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
			 verify="unverified";
			User account=new User( name, emailid,  password,  gender,  address,  city, state,  pno,  adhaar,  pan, balance,verify);
			boolean b=db.newAccount(account);
			if(b==true)
			{
				String message="Resgistration Completed Please Wait for 1 day for verification";
			    dispatcher=request.getRequestDispatcher("index.jsp");
				request.setAttribute("message", message);
				dispatcher.forward(request, response);
				
			}
			else
			{
				String message="Error Occured";
				 dispatcher=request.getRequestDispatcher("index.jsp");
				request.setAttribute("message", message);
				dispatcher.forward(request, response);
			}
			break;
		
			
		case "login":  // check the category of login and accordingly allow to login 
			if(request.getParameter("category").equals("Officer"))
			{
				 emailid=request.getParameter("emailid");
				 password=request.getParameter("password");
				 Officer off= db.officer_login(emailid,password);
				 if(off!=null)
				 {    
					    
					    session=request.getSession();
		            	session.setAttribute("officer", off);
		            	accounts=db.getNewAccount();
		            	report=db.getCustomerQuery();
		            	session.setMaxInactiveInterval(500000000);
		                dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
						request.setAttribute("accounts", accounts);
						request.setAttribute("report", report);
						dispatcher.forward(request, response);

		        	
				 }
				 else
				 {
					    String message="Error Occured";
					    dispatcher=request.getRequestDispatcher("index.jsp");
						request.setAttribute("message", message);
						dispatcher.forward(request, response);
				 }
			}
			else if(request.getParameter("category").equals("Customer"))
			{
				 emailid=request.getParameter("emailid");
				 password=request.getParameter("password");
				 
				 User user=db.customer_login(emailid,password);
				 if(user!=null)
				 {
					    session=request.getSession();
		            	session.setAttribute("user", user);
		            	session.setMaxInactiveInterval(500000000);
		            	response.sendRedirect("customer_welcome.jsp");
				 }
				 else
				 {
					    
						dispatcher=request.getRequestDispatcher("index.jsp?message=Account does not exist");
						dispatcher.forward(request, response);
				 }
			}
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
			acc_no=Integer.parseInt(request.getParameter("acc_no"));
			User new_acc=db.getAccount(acc_no);
			accounts=db.getNewAccount();
        	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
			request.setAttribute("accounts", accounts);
			request.setAttribute("verify_acc", new_acc);
			dispatcher.forward(request, response);
			
            break;
            
            
		case "verifiedAccount":      //after verification make the account from unverified to verified now user can login as customer
		 	 acc_no=Integer.parseInt(request.getParameter("acc_no"));
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
         	 dispatcher=request.getRequestDispatcher("officer_welcome.jsp?");
			 request.setAttribute("accounts", accounts);
			 request.setAttribute("message", message);
			 dispatcher.forward(request, response);
		
			 break;
			 
			 
		case "rejectedAccount":    //delete the account from user table when officer reject the new account details after checking
			acc_no=Integer.parseInt(request.getParameter("acc_no"));
			message=db.delete_newAccount(acc_no);
			accounts=db.getNewAccount();
       	    dispatcher=request.getRequestDispatcher("officer_welcome.jsp?");
		    request.setAttribute("accounts", accounts);
			request.setAttribute("message", message);
			dispatcher.forward(request, response);
			
			break;
	    
			 
			 
		case "deposit":  //use the deposit money to the user account by officer 
			acc_no=Integer.parseInt(request.getParameter("acc_no"));
			name=request.getParameter("name");
			amount=Float.parseFloat(request.getParameter("amount"));
			dot= dtf.format(now);
		    receiver=request.getParameter("acc_no")+":"+name;
		    sender="BY CASH";
			Transaction tran=new Transaction( receiver, sender, dot,  amount);
			message=db.deposit(acc_no,name,amount,tran);
		    accounts=db.getNewAccount();
	       	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
			request.setAttribute("accounts", accounts);
			request.setAttribute("message", message);
			dispatcher.forward(request, response);
			
			break;
		
		case "withdrawal":  // use to deduct money from user account by the officer
			acc_no=Integer.parseInt(request.getParameter("acc_no"));
			name=request.getParameter("name");
			amount=Float.parseFloat(request.getParameter("amount"));
			dot= dtf.format(now);
		    sender =request.getParameter("acc_no")+":"+name;
		    receiver="BY CASH";
			Transaction trans=new Transaction( receiver, sender, dot,  amount);
			message=db.withdrawal(acc_no,name,amount,trans);
			accounts=db.getNewAccount();
	       	dispatcher=request.getRequestDispatcher("officer_welcome.jsp");
			request.setAttribute("accounts", accounts);
			request.setAttribute("message", message);
			dispatcher.forward(request, response);			
			break;		
			
		case "transfer":  // use to tranfer money from one account to another
		    session=request.getSession();
			User u=(User)session.getAttribute("user");
			password=request.getParameter("password");
			acc_no=Integer.parseInt(request.getParameter("acc_no"));
			String receiver=request.getParameter("acc_no")+":"+request.getParameter("name");
			String sender=u.getAcc_no()+":"+u.getName();
			int acc=u.getAcc_no();
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
			Officer off=(Officer)session.getAttribute("officer");
			emailid=off.getEmailid();
			String new_pass=request.getParameter("newpassword");
			password=request.getParameter("password");
			if(password.equals(off.getPassword()))
			{
				message=db.officer_newpassword(emailid,new_pass);
				response.sendRedirect("officer_password.jsp?message="+message+"");
				 
			}
			else
			{
				response.sendRedirect("officer_password.jsp?message=Old password is wrong");
			}
			break;
			
		case "new_password":  //change the user password
			session=request.getSession();
			User user=(User)session.getAttribute("user");
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
			response.sendRedirect("myAccountDetails.jsp");
			break;
			
		case "search_account":    //used to search the account by account no
			acc_no=Integer.parseInt(request.getParameter("acc_no"));
			User searched_acc=db.getAccount(acc_no);
			if(searched_acc!=null)
				{
					dispatcher=request.getRequestDispatcher("customer_details.jsp");
					request.setAttribute("account", searched_acc);
				    dispatcher.forward(request, response);
				}
			else 
				response.sendRedirect("customer_details.jsp?message=Account Not Found");
			break;
			
		case "apply_changes": //change the details of the user by officer
			 acc_no=Integer.parseInt(request.getParameter("acc_no"));
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
			 User change_details= new User(acc_no,name,  emailid,  password,  gender,  address,  city, state,  pno,  adhaar,  pan);
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
    	  {
    		  
    		    accounts=db.getNewAccount();
    		    report=db.getCustomerQuery(); 	
    		    dispatcher=request.getRequestDispatcher("officer_welcome.jsp?message=Reply Send");
				request.setAttribute("accounts", accounts);
				request.setAttribute("report", report);
				dispatcher.forward(request, response);

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
