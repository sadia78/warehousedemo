package com.mas.dao;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import com.mas.dbfactory.DBFactory;
import com.mas.dto.BalanceFormBean;

import com.mas.dto.TransactionFormBean;

public class AccountDAO {

	
		
		PreparedStatement pstmt,pstmt1;
		Statement stmt;
		ResultSet rs,rs1;
		Connection con;
		
		
		public AccountDAO(){
			
			 con=DBFactory.getConnection();
			
		}
		public Vector<TransactionFormBean> getAccno(String login){
			
			
			int accno=0;
			Vector<TransactionFormBean> vfb=null;
			
			try{
			  
			 
			
				
				
			 pstmt=con.prepareStatement("select accno from accountdetails where userid=?");
			 
			 pstmt.setString(1, login);
			 
			 rs=pstmt.executeQuery();
			    
			 vfb=new Vector<TransactionFormBean>();
			 
			 while(rs.next()){
				 
				 accno=rs.getInt(1);
				 
				 TransactionFormBean tb=new TransactionFormBean();
				 
				 tb.setAccno(accno);
				 
				 vfb.add(tb);
				 
				 
				}
			
		}
			catch (SQLException e) {
			e.printStackTrace();
		}
			
		return vfb;
		
		}
		
	public ArrayList<TransactionFormBean> getusers(String path, String login) {

		ArrayList<TransactionFormBean>  atb=new ArrayList<TransactionFormBean> ();
    	
    	
    	String userid="";
    	
    	TransactionFormBean rb=null;
		
		Statement st;
		try {
		
			st = con.createStatement();
			int count = 0;
			ResultSet rs = st.executeQuery("select ul.USER_ID,ul.USER_NAME,ul.USER_SURNAME,to_char(ul.USER_DOB,'DD-MM-YYYY'),ul.USER_EMAIL,a.accno,a.acctype,a.accbal from USER_DETAILS ul,accountdetails a where ul.user_id=a.userid and ul.user_type='flyer' and  ul.user_id="+"'"+login+"'");
		
			while(rs.next())
			{
				
				rb=new TransactionFormBean();
				
				userid=rs.getString(1);
				//inventory.setBrandID(rs.getInt(1));
				rb.setUser(userid);
				
				rb.setFname(rs.getString(2));
				rb.setLname(rs.getString(3));
				rb.setBdate(rs.getString(4));
				rb.setEmail(rs.getString(5));
				rb.setAccno(rs.getInt(6));
				rb.setAcctype(rs.getString(7));
				rb.setAccbal(rs.getFloat(8));
				
			     
				
		
				count++;
				atb.add(rb);
			}	
    	}
    	catch(SQLException se)
    	{
    		//LoggerManager.writeLogWarning(se);
    	}
    	catch(Exception e)
    	{
    		//LoggerManager.writeLogWarning(e);
    	}
    	finally
    	{
    		try
    		{
    			con.close();
    		}
    		catch(SQLException se)
    		{
    			//LoggerManager.writeLogWarning(se);
    		}
    	}
    	return atb;
    }
	
	
	
	
	public ArrayList<TransactionFormBean> getuserTransaction(String login) {

		ArrayList<TransactionFormBean>  atb=new ArrayList<TransactionFormBean> ();
    	
    	
    	String userid="";
    	
    	TransactionFormBean rb=null;
		
		Statement st;
		try {
		
			st = con.createStatement();
			int count = 0;
			ResultSet rs = st.executeQuery("select a.userid,a.ACCNO,t.TTYPE,t.TAMOUNT,t.TDATE from ACCOUNTDETAILS a ,TRANSACTION t where a.ACCNO=t.ACCNO and a.userid="+"'"+login+"'  order by t.TDATE desc");
		
			while(rs.next())
			{
				
				rb=new TransactionFormBean();
				
				userid=rs.getString(1);
				
				rb.setUser(userid);
				rb.setAccno(rs.getInt(2));
				rb.setAcctype(rs.getString(3));
				rb.setAccbal(rs.getFloat(4));
				rb.setBdate(rs.getString(5));
				count++;
				atb.add(rb);
			}	
    	}
    	catch(SQLException se)
    	{
    		//LoggerManager.writeLogWarning(se);
    	}
    	catch(Exception e)
    	{
    		//LoggerManager.writeLogWarning(e);
    	}
    	finally
    	{
    		try
    		{
    			con.close();
    		}
    		catch(SQLException se)
    		{
    			//LoggerManager.writeLogWarning(se);
    		}
    	}
    	return atb;
    }
	public boolean paymentTransaction(TransactionFormBean tfb) {
        boolean flag=false;
		
		int update=0;
		float accbal=0;
		
		try{
			
			
			pstmt=con.prepareStatement("insert into transaction values((select nvl(max(transid),100)+1 from transaction),?,?,?,sysdate)");
			
			String  ttype=tfb.getTtype();
			System.out.println("in transaction Dao..........."+ttype);
			
			int accno=tfb.getAccno();
			float amount=tfb.getTamount();
			
			pstmt.setInt(1, accno);
			pstmt.setString(2, ttype);
			pstmt.setFloat(3, amount);
					
			int insert=pstmt.executeUpdate();
			System.out.println("No of rows inserted into transaction is..............."+insert);
			
			
			stmt=con.createStatement();
			rs=stmt.executeQuery("select accbal from accountdetails where accno="+accno);
			if(rs.next())
			 accbal=rs.getFloat(1);
			
			System.out.println("in Dao balance from accountdetails ........."+accbal);
			
			if((insert>0))
			{
				System.out.println("in side accountdetails");
			
				System.out.println("in side deposite accountdetails");
			pstmt=con.prepareStatement("update accountdetails set accbal=accbal-?,acdate=sysdate where accno=?");
			pstmt.setFloat(1, amount);
		
			pstmt.setInt(2, accno);
			
			 update=pstmt.executeUpdate(); 
			 
			 System.out.println("in deposite rows updated is.............."+update);
			 
			}

	            if(update>0){
	            	
	            	flag=true;
	            	con.commit();
	            	
	            }
		}catch (Exception e) {
			e.printStackTrace();
		}

	return flag;

		}
	
	
	
	public boolean insertTransaction(TransactionFormBean tfb) {
         boolean flag=false;
		
		int update=0;
		float accbal=0;
		
		try{
			
			
			pstmt=con.prepareStatement("insert into transaction values((select nvl(max(transid),100)+1 from transaction),?,?,?,sysdate)");
			
			String  ttype=tfb.getTtype();
			System.out.println("in transaction Dao..........."+ttype);
			
			int accno=tfb.getAccno();
			float amount=tfb.getTamount();
			
			pstmt.setInt(1, accno);
			pstmt.setString(2, ttype);
			pstmt.setFloat(3, amount);
					
			int insert=pstmt.executeUpdate();
			System.out.println("No of rows inserted into transaction is..............."+insert);
			
			
			stmt=con.createStatement();
			rs=stmt.executeQuery("select accbal from accountdetails where accno="+accno);
			if(rs.next())
			 accbal=rs.getFloat(1);
			
			System.out.println("in Dao balance from accountdetails ........."+accbal);
			
			if((insert>0)&&(ttype.equalsIgnoreCase("deposit")))
			{
				System.out.println("in side accountdetails");
			
				System.out.println("in side deposite accountdetails");
			pstmt=con.prepareStatement("update accountdetails set accbal=accbal+?,acdate=sysdate where accno=?");
			pstmt.setFloat(1, amount);
		
			pstmt.setInt(2, accno);
			
			 update=pstmt.executeUpdate(); 
			 
			 System.out.println("in deposite rows updated is.............."+update);
			 
			}

	            if(update>0){
	            	
	            	flag=true;
	            	con.commit();
	            	
	            }
		}catch (Exception e) {
			e.printStackTrace();
		}

	return flag;

		}
	
	
	
	
	
	public float verification(String login) {
		
		
		     float bal = 0;
		   boolean flag=false;
		   
		   try{
			   
			   
			   
			  
			   PreparedStatement preparedStatement=con.prepareStatement("select accbal from accountdetails where userid=?");
			   preparedStatement.setString(1,login);
			   ResultSet resultSet=preparedStatement.executeQuery();
			   if(resultSet.next()){
				   
				   bal=resultSet.getInt(1);
				   }
			  
			  
			   
			   
			  	   
			   
			   
			   
		   }
		   catch(SQLException se)
	    	{
	    		//LoggerManager.writeLogWarning(se);
	    	}
	    	catch(Exception e)
	    	{
	    		//LoggerManager.writeLogWarning(e);
	    	}
	    	finally
	    	{
	    		try
	    		{
	    			con.close();
	    		}
	    		catch(SQLException se)
	    		{
	    			//LoggerManager.writeLogWarning(se);
	    		}
	    	}
		
		
		
		
		
		
		
		
		
		
		
		return bal;
	}
	
	


}
