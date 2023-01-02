package com.banking.beans;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class DBHandler {

	//during the time of signup the new account details are saved in User table by this funtion
	public boolean newAccount(User account)
	{
		try {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		session.save(account);
		session.getTransaction().commit();
		session.close();
		return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	//this function check the details of officer during the time of login
	public Officer officer_login(String emailid,String password)
	{
		 
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Officer.class).buildSessionFactory();
			Session session =factory.getCurrentSession();
			session.beginTransaction();
			Officer off=session.get(Officer.class,emailid);
			session.close();
			if(off.getPassword().equals(password))
			{
			return off;
			}
			else
			return null;
		
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
	public User getAccount(int acc_no)
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
	public String delete_newAccount(int acc_no)
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
	public String changepassword(int acc_no,String password)
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
	public String officer_newpassword(String emailid,String password)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Officer.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		Officer u=session.get(Officer.class, emailid);
		if(u!=null)
		  u.setPassword(password);
		session.getTransaction().commit();
		session.close();
		return "Password Changed";
	}
	
    // this function return the account balance of the user
	public float getBalance(int acc_no)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User u=session.get(User.class, acc_no);
	    return u.getBalance();
		
		
	}
	
	//this function is called when officer click on deposit and add the amount to the user account and add the details to transaction table
	public String deposit(int acc_no,String name,float amount,Transaction tran)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User u=session.get(User.class, acc_no);
		if(name.equalsIgnoreCase(u.getName()))
		{
		if(u!=null)
		{
			amount=amount+u.getBalance();
			u.setBalance(amount);
		}
		session.save(tran);
		session.getTransaction().commit();
		session.close();
		return "Deposit Successful";
		}
		else
			return "Some Error Occured";
	}
	
	
	// this function is called when officer click on withdrawal and deduct money from user account and add the details to transaction table
	public String withdrawal(int acc_no,String name,float amount,Transaction tran)
	{
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class).addAnnotatedClass(Transaction.class).buildSessionFactory();
		Session session =factory.getCurrentSession();
		session.beginTransaction();
		User u=session.get(User.class, acc_no);
		if(name.equalsIgnoreCase(u.getName()))
		{
		if(u!=null)
		{
			amount=u.getBalance()-amount;
			u.setBalance(amount);
		}
		session.save(tran);
		session.getTransaction().commit();
		session.close();
		return "Withdrawal Successful";
		}
		else
			return "Some Error Occured";
	}
	
	// this function deduct the money from sender's account and add money to receiver's account and add the details to transaction table 
	public String transfer(Transaction pay,int acc_no,int acc,float amount)
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
