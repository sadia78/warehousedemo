package com.mas.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mas.UDExceptions.DataAcessException;
import com.mas.UDExceptions.DataNotFoundException;
import com.mas.dbfactory.DBFactory;
import com.mas.dto.FlightDTO;
import com.mas.dto.FlyersDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.ServicesDTO;

public class UserDAO {

	Connection con=null;
	Statement st=null;
	PreparedStatement ps=null,ps1=null,ps2=null;
	CallableStatement cstmt=null;
	ResultSet rs=null,rs1=null;
   public UserDAO(){
	 
	 con=DBFactory.getConnection();
	 try{
		 con.setAutoCommit(false);
	 }catch(Exception e){
		 e.printStackTrace();
	 }
    }
   public FlyersDTO getUserDetails(String user)throws DataAcessException,DataNotFoundException
   {
	   FlyersDTO fdto=new FlyersDTO();
	   System.out.println(user);	   try{
		   ps=con.prepareStatement("select nvl(USER_TITLE,''),nvl(USER_SURNAME,''),nvl(USER_NAME,''),nvl(USER_DOB,''),nvl(USER_GENDER,''),nvl(USER_EMAIL,''),nvl(USER_MOBILE,''),nvl(USER_CITY,''),nvl(USER_STATE,''),nvl(USER_COUNTRY,''),nvl(USER_PIN,'')" +
		   		"from USER_DETAILS where USER_ID=?");
		   ps.setString(1, user);
		   rs=ps.executeQuery();
		   if(rs.next()){
			   fdto.setTitle(rs.getString(1));
			   fdto.setSurname(rs.getString(2));
			   fdto.setFullname(rs.getString(3));
			   fdto.setDob(rs.getString(4));
			   fdto.setGender(rs.getString(5));
			   fdto.setEmail(rs.getString(6));
			   fdto.setMobile(rs.getString(7));
			   fdto.setCity(rs.getString(8));
			   fdto.setState(rs.getString(9));
			   fdto.setCountry(rs.getString(10));
			   fdto.setPin(rs.getString(11));
		   }
	   }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			  ps.close();
			  con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	   return fdto;
   }	
   
   public JourneyDTO getFlightDetails(String fnum)throws DataAcessException,DataNotFoundException
   {
	   JourneyDTO dto=new JourneyDTO();
	   try{
		   ps=con.prepareStatement("select FNAME,SERVICE_FROM,SERVICE_TO,DTIME,ATIME,DISTANCE from FLIEGHT_DETAILS natural join AIRLINE_SERVICES where fnumber=?");
		   ps.setString(1, fnum);
		   rs=ps.executeQuery();
		   if(rs.next()){
			   dto.setFname(rs.getString(1));
			   dto.setFrom(rs.getString(2));
			   dto.setTo(rs.getString(3));
			   dto.setDtime(rs.getString(4));
			   dto.setAtime(rs.getString(5));
			   dto.setDistance(rs.getInt(6));
		   }
	   }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	   return dto;
   }
   
  public boolean storeUserMiles(String user,ServicesDTO sdto){
	  boolean flag=false;
	  try{
		  ps=con.prepareStatement("update  FLYERPOINTS set miles=miles+? where userid=?");
		 
		  ps.setDouble(1, sdto.getMiles());
		  ps.setString(2, user);
		  int c=ps.executeUpdate();
		  if(c>0){
			  flag=true;
			  con.commit();			  
		  }
	  }catch(Exception e){
		  e.printStackTrace();
	  }
	  return flag;
  } 
   
  public boolean conformTickets(JourneyDTO jdto,FlyersDTO fdto,double miles)throws DataNotFoundException,DataAcessException{
	  int totmiles=0;
	  boolean flag=false;
	  
	  try{
		  ps=con.prepareStatement("INSERT INTO BOOKINGDETAILS VALUES(?,?,?,?,?,?)");
		  ps.setString(1, jdto.getFnumber());
		  ps.setString(2, fdto.getUserid());		  
		  ps.setString(3, jdto.getDoj());
		  ps.setInt(4, jdto.getAdults()+jdto.getChills());
		  ps.setString(5, jdto.getFrom());
		  ps.setString(6, jdto.getTo());
		  int c=ps.executeUpdate();
		  if(c>0){
			  Statement st=con.createStatement();
			  ResultSet rst=st.executeQuery("select MILES from FLYERPOINTS where USER_ID='"+fdto.getUserid()+"'");
			  if(rst.next()){
				 totmiles=rst.getInt(1);
			  }
			  ps=con.prepareStatement("update  FLYERPOINTS set miles=? where user_id=?");				 
			  System.out.println("======="+(totmiles-miles));
			  double m=totmiles-miles;
			  m=m+jdto.getMiles();
			  ps.setDouble(1,m);
			  System.out.println((totmiles-miles));
			  System.out.println(jdto.getMiles());
			  ps.setString(2, fdto.getUserid());
			  int c1=ps.executeUpdate();
			  if(c1>0){
				  ps=con.prepareStatement("update FLIGHTSTATUS set RESERVED=RESERVED+?,AVAILABLE=AVAILABLE-? where FNUMBER=?");	
				  ps.setInt(1, jdto.getAdults()+jdto.getChills());
				  ps.setInt(2, jdto.getAdults()+jdto.getChills());
				  ps.setString(3, jdto.getFnumber());
				  int c2=ps.executeUpdate();
				  if(c2>0){
					  flag=true;
					  con.commit();
				  }
			  }
		  }
	  }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	  return flag;
  }
  
  
  
  public boolean conformHotel(String login,String jdate,String rdate,int person,String hname,String city)throws DataNotFoundException,DataAcessException{
	  int totmiles=0;
	  boolean flag=false;
	  
	  try{
		  ps=con.prepareStatement("INSERT INTO HOTELBOOKINGDETAILS VALUES(?,?,?,?,?,?)");
		  ps.setString(1, login);
		  ps.setString(2, jdate);		  
		  ps.setString(3, rdate);
		  ps.setInt(4, person);
		  ps.setString(5, hname);
		  ps.setString(6, city);
		  int c=ps.executeUpdate();
		  
				  if(c>0){
					  flag=true;
					  con.commit();
				  }
			 
		  
	  }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	  return flag;
  }
  public int getDistance(String from,String to)throws DataNotFoundException,DataAcessException
  {
	  int distance=0;
	  try{
		  ps=con.prepareStatement("select DISTANCE from AIRLINE_SERVICES where SERVICE_FROM=? and SERVICE_TO=?");
		  ps.setString(1, from);
		
		  ps.setString(2, to);
		  rs=ps.executeQuery();
		  if(rs.next()){
			  distance=rs.getInt(1);
		  }
	  }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	  return distance;
  }
  
  public boolean getUserId(String userid)throws DataNotFoundException,DataAcessException{
	  boolean flag=false;
	  try{
		  ps=con.prepareStatement("select user_id from user_details where user_id=?");
		  ps.setString(1, userid);
		  rs=ps.executeQuery();
		  if(rs.next()){
			  flag=true;
		  }
	  }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	  return flag;
  }
  
  public double getMyPoints(String user)throws DataNotFoundException,DataAcessException{
	  double points=0;
	  try{
		  ps=con.prepareStatement("select MILES from FLYERPOINTS where USER_ID=?");
		  ps.setString(1, user);
		  rs=ps.executeQuery();
		  if(rs.next()){
			  points=rs.getDouble(1);
		  }
	  }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	  return points;
  }
  
  public boolean updateProfile(FlyersDTO fdto)throws DataNotFoundException,DataAcessException{
	  boolean flag=false;
	  try{
		  ps=con.prepareStatement("update USER_DETAILS set USER_TITLE=?,USER_SURNAME=?,USER_NAME=?,USER_GENDER=?,USER_EMAIL=?,USER_MOBILE=?,USER_CITY=?,USER_STATE=?,USER_COUNTRY=?,USER_PIN=? where USER_ID=?");
		  ps.setString(1, fdto.getTitle());
		  ps.setString(2, fdto.getSurname());
		  ps.setString(3, fdto.getFullname());
		  ps.setString(4, fdto.getGender());
		  ps.setString(5, fdto.getEmail());
		  ps.setString(6, fdto.getMobile());
		  ps.setString(7, fdto.getCity());
		  ps.setString(8, fdto.getState());
		  ps.setString(9, fdto.getCountry());
		  ps.setString(10, fdto.getPin());
		  ps.setString(11, fdto.getUserid());
		  int c=ps.executeUpdate();
		  if(c>0){
			  flag=true;
			  con.commit();
		  }
	  }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	  return flag;
  }
  
 
 public boolean passRecovery(String userid,String questn,String ans)throws DataNotFoundException,DataAcessException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("select USER_PWD from USER_DETAILS where USER_ID=? and USER_QUESTN=? and USER_ANS=?");
		 ps.setString(1, userid);
		 ps.setString(2, questn);
		 ps.setString(3, ans);
		 rs=ps.executeQuery();
		 if(rs.next()){
			 flag=true;
		 }
	 }catch(NullPointerException ne){
		   ne.printStackTrace();
		   throw new DataAcessException("Data base connection Failed");
	   }catch(SQLException se){
		   se.printStackTrace();
		   throw new DataNotFoundException("Sql exception riser/datanot found");
	   }finally{
		   try{
			   ps.close();
			   con.close();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	 return flag;
 }
  
}







