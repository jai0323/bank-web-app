package com.banking.beans;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class DBHandler {
   
	//verify employees login details
	public Employee checkEmployee(String emp_id,String password,String post) {
		
		try { 
    	    SessionFactory factory= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
    	    Session session=factory.getCurrentSession();
    	    session.beginTransaction();
    	    System.out.println("1--");
    	    Employee emp=session.get(Employee.class, emp_id);
    	    session.close();
    	    System.out.println("2--");
    	    if(emp!=null)
    	    {   System.out.println("3--");
    	    	if(emp.getPassword().equals(password) && emp.getPost().equals(post))
    	    		{
    	    		   System.out.println("4--");
    	    		return emp;
    	    		}
    	    	else
    	    		{
    	    		   System.out.println("5--");
    	    		return null;
    	    		}
    	    }
    	    else 
    	    	return null;
      
      }
      catch(Exception e)
      {
    	  return null;
      }
	}
	
	
	//verify admin login details
	public boolean checkAdmin(String admin_id, String password)
	{
      try { 
    	    Class.forName("com.mysql.cj.jdbc.Driver");
		 	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/banking?user=root&password=root");
		 	String query="select * from admin where adminid=? and password=? ";
		 	PreparedStatement statement=cn.prepareStatement(query);
		 	statement.setString(1, admin_id);
		 	statement.setString(2, password);		 
		 	ResultSet rs=statement.executeQuery();
		 	
		 	if(rs.next())
		 	{
		 		return true;
		 	}
		 	else
		 		return false;
      
      }
      catch(Exception e)
      {
    	  return false;
      }
	}
	
	public boolean addNewEmployee(Employee emp)
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			session.save(emp);
			session.getTransaction().commit();
			session.close();
			return true;
		}
		catch(Exception e)
		{
		
			return false;
		}
	}
	
	public int getLastBranch() {
		int branchCode=0;
		try{
			
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/banking?user=root&password=root");
	 	String query="select * from branch order by branchCode desc limit 1";
	 	PreparedStatement statement=cn.prepareStatement(query);		 
	 	ResultSet rs=statement.executeQuery();
	 	while(rs.next())
	 	{ 
	 		  branchCode=Integer.parseInt(rs.getString(1));
	 	}
	 	cn.close();
		}
		catch(Exception e)
		{
			System.out.println("6-------"+e.getMessage());
			
		}
		return branchCode;
	}
	
	public String getLastCustomerID() {
		try{
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
			Session session= factory.getCurrentSession();
			session.beginTransaction();
			List<User> users=(List<User>)session.createQuery("from user").getResultList();
			if(users!=null)
			{
				User u=users.get(users.size()-1);
				session.close();
				return u.getCustomer_id();
			}
			else 
			{
				session.close();
				return null;
			}
				
		}
		catch(Exception e){
			return null;
		}
	}
	
	public String getLastAccountNo(int branchCode) {
		try{
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
			Session session= factory.getCurrentSession();
			session.beginTransaction();
			List<User> users=(List<User>)session.createQuery("from user where branchCode="+branchCode+"").getResultList();
			if(users!=null)
			{
				User u=users.get(users.size()-1);
				session.close();
				return u.getAcc_no().substring(6, 14);
			}
			else 
			{
				session.close();
				return null;
			}
				
		}
		catch(Exception e){
			return null;
		}
	}
	
	public String getLastEmployee() {
		String emp_id="";
		try{
			
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/banking?user=root&password=root");
	 	String query="select * from employee order by emp_id desc limit 1";
	 	PreparedStatement statement=cn.prepareStatement(query);		 
	 	ResultSet rs=statement.executeQuery();
	 	while(rs.next())
	 	{ 
	 		  emp_id=rs.getString(1);
	 	}
	 	cn.close();
		}
		catch(Exception e)
		{
			System.out.println("6-------"+e.getMessage());
			
		}
		return emp_id;
	}
	
	public Employee getEmployee(String emp_id) {
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Employee employee=session.get(Employee.class, emp_id);
			session.close();
			return employee;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	public boolean deleteEmployee(String emp_id) {
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Employee employee=session.get(Employee.class, emp_id);
			if(employee!=null)
				session.delete(employee);
			session.getTransaction().commit();
			session.close();
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	public Branch getBranch(int branchCode) {
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Branch.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Branch branch=session.get(Branch.class, branchCode);
			session.close();
			return branch;
		}
		catch(Exception e)
		{
			return null;
		}
		
	}
	
	public boolean deleteBranch(int branchCode) {
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Branch.class).addAnnotatedClass(Cashinhand.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Cashinhand cashinhand=session.get(Cashinhand.class, branchCode);
			session.delete(cashinhand);
			System.out.println("line 1");
			Branch branch=session.get(Branch.class, branchCode);
			System.out.println("line 2");
			if(branch!=null)
				{System.out.println("line 3");
				session.delete(branch);
				System.out.println("line 4");
			session.getTransaction().commit();
			System.out.println("line 5");
				}
			session.close();
			return true;
		}
		catch(Exception e)
		{
			System.out.println("-----===-----"+e.getMessage());
			return false;
		}
	}
	
	public List<Branch> getListOfBranchs(){
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Branch.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			List<Branch> branchs=session.createQuery("from branch").getResultList();
			session.close();
			return branchs;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	public Cashinhand getBranchStatus(int branchCode) {
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Cashinhand.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Cashinhand cash=session.get(Cashinhand.class,branchCode);
			session.close();
			return cash;
		}
		catch(Exception e)
		{
			return null;
		}	
	}
	
	public void changeBranchSatus(Cashinhand cashinhand) {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Cashinhand.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		Cashinhand cash=session.get(Cashinhand.class,cashinhand.getBranchCode());
		if(cashinhand.getStatus()==0)
		cash.setStatus(1);
		else
			cash.setStatus(0);
		session.getTransaction().commit();
		session.close();
	
	}
	
	public List<Employee> getListOfEmployees(){
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			List<Employee> employees=session.createQuery("from "+Employee.class.getName()+"").getResultList();
			session.close();
			
			return employees;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	public List<Employee> getEmployees(int branchCode){
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			List<Employee> employees=session.createQuery("from employee where branchCode="+branchCode+"").getResultList();
			session.close();
			return employees;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	public boolean addNewranch(Branch branch,Cashinhand cih)// to add new branch 
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Branch.class).addAnnotatedClass(Cashinhand.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			session.save(branch);
			session.save(cih);
			session.getTransaction().commit();
			session.close();
			return true;
		}
		catch(Exception e)
		{
		
			return false;
		}
	}
	
	
	//during the time of signup the new account details are saved in User table by this funtion
	public boolean newAccount(User account, InputStream photo)
	{
		try {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		session.save(account);
		boolean b=savePhoto(account.acc_no,photo);
		if(b==true)
		{session.getTransaction().commit();
		session.close();
		return true;
		}
		else
		{
			session.close();
			return false;
		}
		}
		catch(Exception e)
		{
			System.out.println("errro"+e.getMessage());
			return false;
		}
	}
	private String dbURL = "jdbc:mysql://localhost:3306/banking";
    private String dbUser = "root";
	private String dbPass="root";
	public boolean savePhoto(String acc_no,InputStream photo)
	{    
		Connection conn = null;
		String message = null;
		try {
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		conn=DriverManager.getConnection(dbURL, dbUser, dbPass);
		String sql="INSERT INTO accPhoto(acc_no,photo) values(?, ?)";
		PreparedStatement statement=conn.prepareStatement(sql);
		statement.setString(1,acc_no);
		
		if (photo != null) 
		{
		statement.setBlob(2, photo);
		}
	    statement.executeUpdate();
	    return true;
		}
		catch (Exception e) {
			System.out.println("error===---"+e.getMessage());
			return false;
			// TODO: handle exception
		}
	}
	
	
	
	//this function check the details of customer or user during the time of login
	public User customer_login(String emailid,String password)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		List<User> users=session.createQuery("from user where emailid='"+emailid+"'").getResultList();
		if(users!=null && users.size()!=0) {
		User u=users.get(0);
		session.close();
		if(u.getPassword().equals(password) && u.getVerify().equals("verified"))
		{
		return u;
		}
		else
		return null;
		}
		else
			return null;
	}
	
	//this function return the list of new account which are needed to be verify by officer
	public List<User> getNewAccount()
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		List<User> accounts=session.createQuery("from user where verify='unverified'").getResultList();
		session.close();
		return accounts;
		
	}
	
	//this function return the account (User class Object) containing the details of user by take account number 
	public User getAccount(String acc_no)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User new_acc=session.get(User.class, acc_no);
		session.close();
		if(new_acc!=null)
		   return new_acc;
		return null;
	}
	
	//this function is called to make the account verified by the officer after checking the details of the new account
	public String add_new_user(User new_customer)
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			User u=session.get(User.class, new_customer.getAcc_no());
			if(u!=null)
			{
				u.setVerify("verified");
			}
			session.getTransaction().commit();
			session.close();
			return "Account Opening is Successful";
		}
		catch(Exception e)
		{
			return "Some Error Occured";
		}
	}
	
	//this function will delete the account details from the database when officer reject the new account 
	public String delete_newAccount(String acc_no)
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			User na=session.get(User.class, acc_no);
			if(na!=null)
				session.delete(na);
			session.getTransaction().commit();
			session.close();
			return "Rejected";
		}
		 catch(Exception e){
			return "Some Error Occured";
		}
		
	}
	
	//this function change the password of the user or customer
	public String changepassword(String acc_no,String password)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User u=session.get(User.class, acc_no);
		if(u!=null)
		  u.setPassword(password);
		session.getTransaction().commit();
		session.close();
		return "Password Changed";
	}
	
	//this function change the password of the Admin or officer
	public String officer_newpassword(String emp_id,String password)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		Employee u=session.get(Employee.class, emp_id);
		if(u!=null)
		  u.setPassword(password);
		session.getTransaction().commit();
		session.close();
		return "Password Changed";
	}
	
    // this function return the account balance of the user
	public float getBalance(String string)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User u=session.get(User.class, string);
	    return u.getBalance();
		
		
	}
	
	//this function is called when officer click on deposit and add the amount to the user account and add the details to transaction table
	public String deposit(String acc_no,String name,float amount,int branchCode, Transaction tran)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(Cashinhand.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		Cashinhand cash=session.load(Cashinhand.class,branchCode);
		User u=session.get(User.class, acc_no);
		if(name.equalsIgnoreCase(u.getName()))
		{
		if(u!=null)
		{
			cash.setBalance(cash.getBalance()+amount);
			u.setBalance(amount+u.getBalance());
			
		}
		session.save(tran);
		session.getTransaction().commit();
		session.close();
		return "Deposit Successful";
		}
		else
			return "Some Error Occured";
	}
	
	//to withdrawal amount with account balance
	public String checkPendingPayment(String acc_no,float amount) {
		
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			User u=session.get(User.class, acc_no);
			if(u.getBalance()>=amount)
			{
				return "successful";
			}
			return "Insufficient Balance";
		
	}
	// cashier check balance with amount to allow pending payment
	public PendingPayment checkPendingPayment(String acc_no)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(PendingPayment.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User u=session.get(User.class, acc_no);
		PendingPayment p=session.load(PendingPayment.class, acc_no);
		if(u.getBalance()>=p.getAmount())
		{
			session.close();
			return p;
		}
		else
		{
			session.delete(p);
			session.getTransaction().commit();
			session.close();
		return null;
		}
	}
	
	public String cashierAllowPayment(String acc_no) {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		PendingPayment p=session.load(PendingPayment.class, acc_no);
		if(p!=null)
		{session.delete(p);
		session.getTransaction().commit();
		session.close();
		return "Payment Successful";
		}
		else {
			session.close();
			return "Error Occurred";
		}
	}
	
	public PendingPayment getPendingPayments(String acc_no) {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		List<PendingPayment> pp=session.createQuery("from pendingPayment where acc_no="+acc_no+"").getResultList();
		if(pp!=null)
		{
			for(PendingPayment p:pp)
				return p;
		}
		return null;
	}
	
	
	public String verifyPayment(String acc_no) {
	
		try{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		PendingPayment p=session.load(PendingPayment.class,acc_no);
		p.setStatus(1);
		session.update(p);
		session.getTransaction().commit();
		session.close();
		return "Payment Verified";
	    }
		catch(Exception e)
		{
			return "Error Occurred";
		}
	}
	
    public String deletePayment(String acc_no) {
		
    	try{
    		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
    		Session session =factory.getCurrentSession();
    		session.beginTransaction();
    		PendingPayment p=session.load(PendingPayment.class,acc_no);
    		session.delete(p);
    		session.getTransaction().commit();
    		session.close();
    		return "Payment Rejected";
    	    }
    		catch(Exception e)
    		{
    			return "Error Occurred";
    		}
	}
	
	// this function is called when officer click on withdrawal and deduct money from user account and add the details to transaction table
	public String withdrawal(String acc_no,String name,float amount,int branchCode, Transaction tran)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).addAnnotatedClass(User.class).addAnnotatedClass(Cashinhand.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		
		Cashinhand cash=session.load(Cashinhand.class, branchCode);
		User u=session.get(User.class, acc_no);
		if(name.equalsIgnoreCase(u.getName()) && cash.getBalance()>amount)
		{
		if(u.getBalance()>=amount)
		{
			cash.setBalance(cash.getBalance()-amount);
			u.setBalance(u.getBalance()-amount);
			PendingPayment p=session.load(PendingPayment.class, acc_no);
			if(p!=null)
			{
				session.delete(p);
			}
			session.save(tran);
			session.getTransaction().commit();
			session.close();
			return "Withdrawal Successful";
		}
		else {
			session.close();
			return "Insufficient Balance";
		}
		}
		else
	
			return "Some Error Occured";
	}
	
	//add pending payment of amount more than 2 lakhs
	public boolean addpendingPayment(PendingPayment pendingPayment) {
		try {
			SessionFactory factory= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).buildSessionFactory();
			Session session= factory.getCurrentSession();
			session.beginTransaction();
			session.save(pendingPayment);
			session.getTransaction().commit();
			session.close();
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}
	
	//list of Pending payments
	public  List<PendingPayment> getPendingPayments(int branchCode){
		try {
			SessionFactory factory= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(PendingPayment.class).buildSessionFactory();
			Session session= factory.getCurrentSession();
			session.beginTransaction();
			List<PendingPayment> pp=session.createQuery("from pendingPayment where branchCode="+branchCode+"").getResultList();
			session.close();
			if(pp!=null)
				return pp;
			
			return null;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	// this function deduct the money from sender's account and add money to receiver's account and add the details to transaction table 
	public String transfer(Transaction pay,String acc_no,String acc,float amount)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User sender=session.get(User.class, acc);
		if(sender.getBalance()>=amount)
		{
			sender.setBalance(sender.getBalance()-amount);
			User receiver=session.get(User.class, acc_no);
			receiver.setBalance(amount+receiver.getBalance());
			session.save(pay);
			session.getTransaction().commit();
			session.close();
			return "Payment of Rs."+amount+" is Successful";
		}
		else
		{	
			return "Balance is not sufficiant";
		}	
	}
	
	// this function return the list of transactions of the user 
	public List<Transaction> getAccountStatement(String name)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		List<Transaction> passbook=session.createQuery("from "+Transaction.class.getName()+" where receiver='"+name+"' or sender='"+name+"'").getResultList();
		session.close();
		return passbook;
		
	}
	
	// this function return the list of daily transactions of the user 
	public List<Transaction> getdailyreport(String name)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		
		List<Transaction> passbook=session.createQuery("from "+Transaction.class.getName()+" where (receiver='"+name+"' or sender='"+name+"') and dot like '"+java.time.LocalDate.now()+"%'").getResultList();
		session.close();
		return passbook;
		
	}
	
	// this function add the user query to the query table
	public boolean sendQuery(Query q)
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Query.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
		session.beginTransaction();
		session.save(q);
		session.getTransaction().commit();
		session.close();
		return true;
		}
		catch(Exception e)
		{
			return false;
		}
	 }
	
	// this function return the list of queries of the user
	public List<Query> getQueryreport(String name)
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Query.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
		session.beginTransaction();
		List<Query> report=session.createQuery("from query where name='"+name+"'").getResultList();
		session.close();
		return report;
		}
		catch(Exception e)
		{
			return null;
		}
	 }
	
	// this function return the list of customer query to officer home page 
	public List<Query> getCustomerQuery()
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Query.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
		session.beginTransaction();
		List<Query> report=session.createQuery("from query").getResultList();
		session.close();
		return report;
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	//this function return the query to the officer by q_id
	public Query getQuery(int q_id)
	{
		
	
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Query.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Query q=session.get(Query.class, q_id);
			session.close();
			return q;
	
	 }
	
	//this function return boolean value when the officer reply to query 
	public boolean sendreply(int q_id,String reply)
	{
		try {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Query.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		Query q=session.get(Query.class, q_id);
		q.setReply(reply);
		session.getTransaction().commit();
		session.close();
		return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	//this function return boolean value and delete the Query from the table when customer click on resolved
	public boolean deleteQuery(int q_id)
	{
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Query.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Query q=session.get(Query.class, q_id);
			session.delete(q);
			session.getTransaction().commit();
			session.close();
			return true;
			}
			catch(Exception e)
			{
				return false;
			}
		
	}
	
	
	// this function allow officer to make changes in the user account details and make changes in user table accordingly 
	public String update_details(User u)
	{
		
		try {
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			User user=session.get(User.class, u.getAcc_no());
			if(u!=null)
			{
				user.setName(u.getName());
				user.setEmailid(u.getEmailid());
				user.setPassword(u.getPassword());
				user.setGender(u.getGender());
				user.setAddress(u.getAddress());
				user.setCity(u.getCity());
				user.setState(u.getState());
				user.setPno(u.getPno());
				user.setPan(u.getPan());
				user.setAdhaar(u.getAdhaar());
			}
			session.getTransaction().commit();
			session.close();
			return "Account Details Updated Successful";
		}
		catch(Exception e)
		{
			return "Some Error Occured";
		}
	}


	
	
	
	
}
