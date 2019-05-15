package com.mas.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import com.mas.UDExceptions.DataAcessException;
import com.mas.UDExceptions.DataNotFoundException;
import com.mas.dbfactory.DBFactory;
import com.mas.dto.FlightDTO;
import com.mas.dto.FlyersDTO;
import com.mas.dto.HotelDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.MailDTO;
import com.mas.dto.ServicesDTO;
import com.mas.dto.StatusDTO;
public class MasterDAO 
{
	Connection con=null;
	Statement st=null;
	PreparedStatement ps=null,ps1=null,ps2=null,pstmt2=null;
	CallableStatement cstmt=null;
	ResultSet rs=null,rs1=null,rs2=null,rs3=null;
 public MasterDAO(){
	 
	 con=DBFactory.getConnection();
	 try{
		 con.setAutoCommit(false);
	 }catch(Exception e){
		 e.printStackTrace();
	 }
 }
 public String isAuthenticated(String user,String pwd)throws DataAcessException,DataNotFoundException{
	 String type="";
	 try{
		 ps=con.prepareStatement("select USER_TYPE from user_details where user_id=? and user_pwd=?");
		 ps.setString(1, user);
		 ps.setString(2, pwd);
		 
		 rs=ps.executeQuery();
		 if(rs.next()){
			 type=rs.getString(1);
			 ps=con.prepareStatement("insert into LOGIN_MASTER(USER_ID,LOGIN_TIME) values(?,sysdate)");
			 ps.setString(1, user);
			 int c=ps.executeUpdate();
			 if(c>0){
				 System.out.println("Inserted data into login master");
			 }
		 }
	 }catch(NullPointerException ne){
		ne.printStackTrace();
		throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
	 }
	 finally{
		 try{
			 con.close();
			 ps.close();
			 rs.close();
		 }catch(Exception e){
			 e.printStackTrace();
			 }
		 }
	 
	 return type;
 }
 
 public void logoutAction(String user){
	 try{
		 ps=con.prepareStatement("update login_master set LOGOUT_TIME=sysdate where trim(USER_ID) like ? and LOGOUT_TIME is null");
		 ps.setString(1, user.trim());
		 int c=ps.executeUpdate();
		 if(c>0){
			 con.commit();
			 System.out.println("Inserted data into login master in logout action");
		 }
	 }catch(Exception e){
		 e.printStackTrace();
	 }
 }
 
 
 public boolean changePass(String userid,String pwd)throws DataAcessException,DataNotFoundException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("update user_details set USER_PWD=? where USER_ID=?");
		 ps.setString(1, pwd);
		 ps.setString(2, userid);
		 int c=ps.executeUpdate();
		 if(c>0){
			 flag=true;
			 con.commit();
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 ps.close();				
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return flag;
 }
 
 public boolean checkFnumber(String fnum)throws DataAcessException,DataNotFoundException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("select FNUMBER from FLIEGHT_DETAILS where FNUMBER=?");
		 ps.setString(1, fnum);
		 rs=ps.executeQuery();
		 if(rs.next()){
			 flag=true;
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connectio Failed in checkFnumber()");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("Sql exception raised/no data  found");
	 }finally{
		 try{
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return flag;
 }
 public boolean checkFname(String fname)throws DataAcessException,DataNotFoundException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("select FNAME from FLIEGHT_DETAILS where FNAME=?");
		 ps.setString(1, fname.trim());
		 rs=ps.executeQuery();
		 if(rs.next()){
			 flag=true;
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 ps.close();
				 rs.close();
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return flag;
 }
 
 public String getFlightName(String fnumber)throws DataAcessException,DataNotFoundException
 {
	 String fname="";
	 try{
		 ps=con.prepareStatement("select FNAME from FLIEGHT_DETAILS where FNUMBER=?");
		 ps.setString(1, fnumber);
		 rs=ps.executeQuery();
		 if(rs.next())
			 fname=rs.getString(1);
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
     }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
	 }
	 finally{
			 try{
				 con.close();
				 ps.close();
				 rs.close();
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return fname;
 }
 
 public boolean addNewFlight(String fnum,String fname,int capacity,String[] avail)
 throws DataAcessException,DataNotFoundException
 {
	 boolean flag=false;
	
	 try{
		 ps=con.prepareStatement("insert into FLIEGHT_DETAILS(FNUMBER,FNAME,CAPACITY) values(?,?,?)");
		 ps.setString(1, fnum);
		 ps.setString(2, fname);		 
		 ps.setInt(3, capacity);
		 int c1=ps.executeUpdate();
		 if(c1>0)
		 {
			 st=con.createStatement();
			 int c=st.executeUpdate("insert into FlightStatus(FNUMBER,RESERVED,AVAILABLE) values('"+fnum+"',"+0+","+capacity+")");
		  if(c>0)
		  {			
		    int count=0;
			for(int i=0;i<avail.length;i++)
			{
				st=con.createStatement();
				int x=st.executeUpdate("insert into FLIGHT_AVAILABLE(FNUMBER,AVAIL_DAY) values('"+fnum+"','"+avail[i]+"')");			
			    if(x>0)
				  count++;
			}
			if(count==avail.length){
				flag=true;
				con.commit();
			}else
				con.rollback();
		 }else
			 con.rollback();
	   }else
		   con.rollback();
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 try{
			 con.rollback();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 se.printStackTrace();
		 throw new DataNotFoundException("sqlexception raised in addnewflight()");
	 }finally{
		 try{
			 con.close();
			 ps.close();
			 st.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return flag;
	 
 }
 
 
 public ArrayList<FlightDTO> getFlights()throws DataNotFoundException,DataAcessException{
	 ArrayList<FlightDTO> flist=new ArrayList<FlightDTO>();
	 try{
		 ps=con.prepareStatement("select nvl(FNUMBER,''),nvl(FNAME,''),nvl(CAPACITY,''),nvl(AVAIL_DAY,'')  from FLIEGHT_DETAILS natural join FLIGHT_AVAILABLE");
		 rs=ps.executeQuery();
		 while(rs.next()){
			 FlightDTO fdto=new FlightDTO();
			 fdto.setFnum(rs.getString(1));
			 fdto.setFname(rs.getString(2));			 
			 fdto.setCapacity(rs.getInt(3));
			 fdto.setAvail(rs.getString(4));
			 flist.add(fdto);			 
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 ps.close();
				 rs.close();
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return flist;
 }
 
 public ArrayList<FlightDTO> getFlightNumbers()throws DataNotFoundException,DataAcessException{
	 ArrayList<FlightDTO> flist=new ArrayList<FlightDTO>();
	 try{
		 ps=con.prepareStatement("select nvl(FNUMBER,'') from FLIEGHT_DETAILS");
		 rs=ps.executeQuery();
		 while(rs.next()){
			 FlightDTO fdto=new FlightDTO();
			 fdto.setFnum(rs.getString(1));			
			 flist.add(fdto);			 
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 ps.close();
				 rs.close();
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return flist;
 }
 
 public ArrayList<String>  getFlightsNumbers()throws DataNotFoundException,DataAcessException{
	 ArrayList<String> fnum=new ArrayList<String>();
	 try{
		 st=con.createStatement();
		 st.executeQuery("select FNUMBER from FLIEGHT_DETAILS");
		 rs=st.getResultSet();
		 while(rs.next()){
			 String str=new String();
			 str=rs.getString(1);
			 fnum.add(str);
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 st.close();
				 rs.close();
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return fnum;
 }
 
 public boolean deleteFlight(String fnum)throws DataNotFoundException,DataAcessException
 {
	boolean flag=false; 
	try{
		ps=con.prepareStatement("delete from FLIEGHT_DETAILS where FNUMBER=?");
		ps.setString(1, fnum);
		
		int c=ps.executeUpdate();
		if(c>0){
			flag=true;
			con.commit();
		}
	}catch(NullPointerException ne){
		ne.printStackTrace();
		throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
	 }
	 finally{
		 try{
			 con.close();
			 ps.close();			 
		 }catch(Exception e){
			 e.printStackTrace();
			 }
		 }			
	 return flag;
 }
 
 public boolean deleteBooking(String fnum,String fname,String from,String to,String doj)throws DataNotFoundException,DataAcessException
 {
	boolean flag=false; 
	try{
		ps=con.prepareStatement("delete from BOOKINGDETAILS where FNUMBER=? and USER_ID=? and JFROM=? and JTO=?");
		ps.setString(1, fnum);
		ps.setString(2, fname);
		ps.setString(3, from);
		ps.setString(4, to);
		//ssps.setString(5, doj);
		int c=ps.executeUpdate();
		if(c>0){
			flag=true;
			con.commit();
		}
	}catch(NullPointerException ne){
		ne.printStackTrace();
		throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
	 }
	 finally{
		 try{
			 con.close();
			 ps.close();			 
		 }catch(Exception e){
			 e.printStackTrace();
			 }
		 }			
	 return flag;
 }
 
 public boolean insertNewService(String sfrom,String sto, String fnumber,int bfare,int efare,String dtime,String atime,int distance)throws DataAcessException,DataNotFoundException
 {
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("insert into AIRLINE_SERVICES values((select nvl(max(SID),100)+1 from AIRLINE_SERVICES),?,?,?,?,?,?,?,?)");
		 ps.setString(1, sfrom);
		 ps.setString(2, sto);
		 ps.setInt(3, efare);
		 ps.setInt(4, bfare);
		 ps.setString(5, fnumber);
		 ps.setString(6, dtime);
		 ps.setString(7, atime);
		 ps.setInt(8, distance);
		 int c=ps.executeUpdate();
		 if(c>0){
			 flag=true;
			 con.commit();
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/constraint violated");
		 }
		 finally{
			 try{
				 con.close();
				 ps.close();
				
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return flag;
 }
 
 public ArrayList<ServicesDTO> getServices()throws DataNotFoundException,DataAcessException{
	 ArrayList<ServicesDTO> blist=new ArrayList<ServicesDTO>();
	 try{
		 st=con.createStatement();
		 rs=st.executeQuery("select nvl(SID,''),nvl(SERVICE_FROM,''),nvl(SERVICE_TO,''),nvl(EFARE,''),nvl(BFARE,''),nvl(FNUMBER,''),nvl(DTIME,''),nvl(ATIME,'') from AIRLINE_SERVICES");		 
		 while(rs.next()){
			 ServicesDTO bdto=new ServicesDTO();
			 bdto.setSid(rs.getInt(1));
			 bdto.setSfrom(rs.getString(2));
			 bdto.setSto(rs.getString(3));
			 bdto.setEfare(rs.getInt(4));
			 bdto.setBfare(rs.getInt(5));
			 bdto.setFnum(rs.getString(6));
			 bdto.setDtime(rs.getString(7));
			 bdto.setAtime(rs.getString(8));
			 blist.add(bdto);
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 st.close();				 
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return blist;
 }
 
 public ArrayList<ServicesDTO> getServices1()throws DataNotFoundException,DataAcessException{
	 ArrayList<ServicesDTO> blist=new ArrayList<ServicesDTO>();
	 try{
		 st=con.createStatement();
		 rs=st.executeQuery("select distinct SERVICE_FROM from AIRLINE_SERVICES");		 
		 while(rs.next()){
			 ServicesDTO bdto=new ServicesDTO();
			 
			 bdto.setSfrom(rs.getString(1));
			
			 blist.add(bdto);
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 st.close();				 
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return blist;
 }
 
 public ArrayList<ServicesDTO> getServices2()throws DataNotFoundException,DataAcessException{
	 ArrayList<ServicesDTO> blist=new ArrayList<ServicesDTO>();
	 try{
		 st=con.createStatement();
		 rs=st.executeQuery("select distinct SERVICE_TO from AIRLINE_SERVICES");		 
		 while(rs.next()){
			 ServicesDTO bdto=new ServicesDTO();
			 
			 bdto.setSto(rs.getString(1));
			
			 blist.add(bdto);
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 st.close();				 
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return blist;
 }
 
 public boolean deleteService(int bid)throws DataAcessException,DataNotFoundException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("delete from AIRLINE_SERVICES where SID=?");
		 ps.setInt(1, bid);
		 int c=ps.executeUpdate();
		 if(c>0){
			 flag=true;
			 con.commit();
		 }
	 }catch(NullPointerException ne){
			ne.printStackTrace();
			throw new DataAcessException("Database Connection Error Occured in isauthenticated()");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlExceptio raised/No rows selected in isauthenticated()");
		 }
		 finally{
			 try{
				 con.close();
				 ps.close();
				
			 }catch(Exception e){
				 e.printStackTrace();
				 }
			 }
	 return flag;
 }
 
 public boolean checkHotelName(String hname)throws DataNotFoundException,DataAcessException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("select nvl(HOTEL_NAME,'') from HOTELS where HOTEL_NAME=?");
		 ps.setString(1, hname);
		 rs=ps.executeQuery();
		 if(rs.next()){
			 flag=true;			 
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection Failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 con.close();
			 ps.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return flag;
 }
 
 public boolean insertNewHotel(String hname,String city,String street,Float charge,String mobile,String country,int capacity,int acroom,int nonacroom,int accharge,int nonaccharge,String hoteltype)throws DataAcessException,DataNotFoundException{
   boolean flag=false;
   try{
	   ps=con.prepareStatement("insert into HOTELS values((select nvl(max(HOTEL_ID),100)+1 from HOTELS),?,?,?,?,?,?,?,?,?,?,?,?)");
	   ps.setString(1, hname);
	   System.out.println(hname);
	   ps.setString(2, city);
	   ps.setString(3, street);
	   ps.setFloat(4, charge);
	   ps.setString(5, mobile);
	   ps.setString(6, country);
	   ps.setInt(7,capacity);
	  
	   ps.setInt(9,acroom);
	   ps.setInt(8,nonacroom);
	   ps.setInt(10,accharge);
	   ps.setInt(11,nonaccharge);
	   ps.setString(12, hoteltype);
	   
	   
	   System.out.println(country);
	   
	   int c=ps.executeUpdate();
	   if(c>0){
		   flag=true;
		   con.commit();
	   }
   }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection Failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 con.close();
			 ps.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
   return flag;
 }
 
 public ArrayList<HotelDTO> getHotels()throws DataAcessException,DataNotFoundException
 {
	 ArrayList<HotelDTO> hlist=new ArrayList<HotelDTO>();
	 try{
		 st=con.createStatement();
		 st.executeQuery("select *from HOTELS");
		 
		 rs=st.getResultSet();
		 while(rs.next()){
			 HotelDTO hdto=new HotelDTO();
			 hdto.setHid(rs.getInt(1));
			 hdto.setHname(rs.getString(2));
			 hdto.setCity(rs.getString(3));
			 hdto.setStreet(rs.getString(4));
			 hdto.setCharge(rs.getFloat(5));
			 hdto.setMobile(rs.getString(6));
			 hdto.setCountry(rs.getString(7));
			 hdto.setCapacity(rs.getInt(8));
			 hdto.setAcroom(rs.getInt(9));
			 hdto.setNonacroom(rs.getInt(10));
			 hdto.setAccharge(rs.getInt(11));
			 hdto.setNonaccharge(rs.getInt(12));
			 hdto.setHotelhype(rs.getString(13));
			 
			 hlist.add(hdto);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 con.close();
			 st.close();
			 rs.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return hlist;
 }
 
 public ArrayList<HotelDTO> getHotelCity()throws DataAcessException,DataNotFoundException
 {
	 ArrayList<HotelDTO> hlist=new ArrayList<HotelDTO>();
	 try{
		 st=con.createStatement();
		 st.executeQuery("select distinct HOTEL_CITY from HOTELS");
		 
		 rs=st.getResultSet();
		 while(rs.next()){
			 HotelDTO hdto=new HotelDTO();
			 hdto.setCity(rs.getString(1));
			 
			 
			 hlist.add(hdto);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 con.close();
			 st.close();
			 rs.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return hlist;
 }
 
 
 public ArrayList<HotelDTO> getHotels(String city)throws DataAcessException,DataNotFoundException
 {
	 ArrayList<HotelDTO> hlist=new ArrayList<HotelDTO>();
	 try{
		 st=con.createStatement();
		 st.executeQuery("select *from HOTELS where HOTEL_CITY='"+city+"'");
		 
		 rs=st.getResultSet();
		 while(rs.next()){
			 HotelDTO hdto=new HotelDTO();
			 hdto.setHid(rs.getInt(1));
			 hdto.setHname(rs.getString(2));
			 hdto.setCity(rs.getString(3));
			 hdto.setStreet(rs.getString(4));
			 hdto.setCharge(rs.getFloat(5));
			 hdto.setMobile(rs.getString(6));
			 hdto.setCountry(rs.getString(7));
			 hdto.setCapacity(rs.getInt(8));
			 hdto.setAcroom(rs.getInt(9));
			 hdto.setNonacroom(rs.getInt(10));
			 hdto.setAccharge(rs.getInt(11));
			 hdto.setNonaccharge(rs.getInt(12));
			 hdto.setHotelhype(rs.getString(13));
			 
			 hlist.add(hdto);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 con.close();
			 st.close();
			 rs.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return hlist;
 }
 
 public boolean deleteHotel(int hid)throws DataNotFoundException,DataAcessException{
	 boolean flag=false;
	 try{
		 st=con.createStatement();
		 int c=st.executeUpdate("delete from HOTELS where HOTEL_ID="+hid);
		 if(c>0){
			 flag=true;
			 con.commit();
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 con.close();
			 st.close();			
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return flag;
	 
 }
 public ArrayList<FlyersDTO> getFlyersDetails()throws DataAcessException,DataNotFoundException
 {
	 ArrayList<FlyersDTO> flyers=new ArrayList<FlyersDTO>();
	 try{
//		 cstmt=con.prepareCall("{call admin_getflyers(?,?,?,?,?,?,?,?,?,?,?,?)}");
//		 cstmt.registerOutParameter(1, Types.VARCHAR);
//		 cstmt.registerOutParameter(2, Types.VARCHAR);
//		 cstmt.registerOutParameter(3, Types.VARCHAR);
//		 cstmt.registerOutParameter(4, Types.VARCHAR);
//		 cstmt.registerOutParameter(5, Types.VARCHAR);
//		 cstmt.registerOutParameter(6, Types.VARCHAR);
//		 cstmt.registerOutParameter(7, Types.VARCHAR);
//		 cstmt.registerOutParameter(8, Types.VARCHAR);
//		 cstmt.registerOutParameter(9, Types.VARCHAR);
//		 cstmt.registerOutParameter(10, Types.VARCHAR);
//		 cstmt.registerOutParameter(11, Types.FLOAT);
//		 cstmt.registerOutParameter(12, Types.VARCHAR);
//		 
//		 cstmt.execute();
		 
		 ps=con.prepareStatement("select    nvl(USER_TITLE,''),nvl(User_surname,''),nvl(USER_NAME,''), nvl(USER_GENDER,'')," +
		 		"nvl(USER_MOBILE,''), nvl(USER_EMAIL,''),nvl(to_char(USER_DOR,'DD-MON-YYYY'),''),nvl(USER_CITY,''), nvl(USER_STATE,'')," +
		 		"nvl(user_country,''),nvl(user_id,'') from USER_DETAILS where USER_TYPE=?");
		 ps.setString(1, "flyer");
		 rs=ps.executeQuery();
		 while(rs.next()){
			 FlyersDTO fdto=new FlyersDTO();
			 fdto.setTitle(rs.getString(1));
			 fdto.setSurname(rs.getString(2));
			 fdto.setFullname(rs.getString(3));
			 fdto.setGender(rs.getString(4));
			 fdto.setMobile(rs.getString(5));
			 fdto.setEmail(rs.getString(6));
			 fdto.setDor(rs.getString(7));
			 
			 fdto.setCity(rs.getString(8));
			 fdto.setState(rs.getString(9));
			 fdto.setCountry(rs.getString(10));			
			 fdto.setUserid(rs.getString(11));			 
			 flyers.add(fdto);
		 }
		 
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 ps.close();	
			 con.close();			 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return flyers;
 }
 
 public boolean deleteUserID(String userid) throws DataAcessException,DataNotFoundException{
   boolean flag=false;
   try{
	   ps=con.prepareStatement("delete from user_details where user_id=?");
	   ps.setString(1, userid);
	   int c=ps.executeUpdate();
	   if(c>0){
		   flag=true;
		   con.commit();
	   }
   }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
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
 
 public ArrayList<StatusDTO> getFlightStatus( String from,String to)throws DataNotFoundException,DataAcessException
 {
	 ArrayList<StatusDTO> slist=new ArrayList<StatusDTO>();
	 try{
		  System.out.println("in dao;;;;;;;---:"+from);
		//ps=con.prepareStatement("select nvl(as.FNUMBER,''),nvl(as.SID,''),nvl(fd.CAPACITY,''),nvl(fs.RESERVED,''),nvl(fs.AVAILABLE,''),nvl(fd.DTIME,''),nvl(ATIME,'')" +
		//		"from AIRLINE_SERVICES as,FLIEGHT_DETAILS fd,FLIGHTSTATUS fs where as.SERVICE_FROM=? and as.SERVICE_TO=? and as.FNUMBER=fd.FNUMBER and as.FNUMBER=fs.FNUMBER");
		ps=con.prepareStatement("select nvl(fnumber,''),nvl(DTIME,''),nvl(ATIME,''),nvl(SERVICE_FROM,''),nvl(SERVICE_TO,'') from AIRLINE_SERVICES where SERVICE_FROM=? and SERVICE_TO=?");
		 ps.setString(1, from);
		ps.setString(2, to);
		rs=ps.executeQuery();
		while(rs.next()){
			System.out.println("flight num:"+rs.getString(1));
			ps=con.prepareStatement("select nvl(CAPACITY,''),nvl(RESERVED,''),nvl(AVAILABLE,'') from FLIEGHT_DETAILS natural join FLIGHTSTATUS where Fnumber=?");
			ps.setString(1, rs.getString(1));
			ResultSet rs1=ps.executeQuery();
			if(rs1.next()){
			 StatusDTO sdto=new StatusDTO();
			 sdto.setFnumber(rs.getString(1));
			 sdto.setDtime(rs.getString(2));
			 System.out.println(rs.getString(2));
			 sdto.setAtime(rs.getString(3));
			 sdto.setFrom(rs.getString(4));
			 sdto.setTo(rs.getString(5));
			 sdto.setCapacity(rs1.getInt(1));
			 sdto.setReserved(rs1.getInt(2));
			 sdto.setAvailable(rs1.getInt(3));
			 
			 slist.add(sdto);
			}
		}
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 ps.close();	
			 con.close();			 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return slist;
 }
 
 public ArrayList<JourneyDTO> checkTwoWayAvailability(JourneyDTO jdto)throws DataAcessException,DataNotFoundException
 {    	  
	 String fnumber[]={""};
	
	 int jweek=0;
	 int rweek=0;
	 String days[]={"sun","mon","tue","wed","thu","fri","sat"};	 
	 	 int i=0;
	 	 try{
	 		 String jdate=null;
	 		 StringTokenizer st=new StringTokenizer(jdto.getJdate(), "-");
	 		 st.hasMoreTokens();
	 		 jdate=st.nextToken();
	 		 jdate=jdate+"/";
	 		 jdate=jdate+st.nextToken();
	 		 jdate=jdate+"/";
	 		 jdate=jdate+st.nextToken(); 		 
	 		 System.out.println(jdate);
	 		 
	 		 
	         SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
	         Date date=sdf.parse(jdate.trim());
	         Calendar call=Calendar.getInstance();
	         call.setTime(date);
	         jweek=call.get(Calendar.DAY_OF_WEEK);
	       
	         String rdate=null;
	 		 StringTokenizer st1=new StringTokenizer(jdto.getJdate(), "-");
	 		 st1.hasMoreTokens();
	 		 rdate=st1.nextToken();
	 		 rdate=rdate+"/";
	 		 rdate=rdate+st1.nextToken();
	 		 rdate=rdate+"/";
	 		 rdate=rdate+st1.nextToken(); 		 
	 		 System.out.println(rdate);
	         
	         Date jdate1=sdf.parse(rdate.trim());
	         call.setTime(jdate1);
	         rweek=call.get(Calendar.DAY_OF_WEEK);
	        
	 	 }catch(Exception e){
	 		 e.printStackTrace();
	 	 }
	   ArrayList<JourneyDTO> slist=new ArrayList<JourneyDTO>();
	   try{
		  ps=con.prepareStatement("select FNUMBER from AIRLINE_SERVICES  where SERVICE_FROM=? and SERVICE_TO=? and" +
		  		" FNUMBER in (select Fnumber from AIRLINE_SERVICES where SERVICE_FROM=? and SERVICE_TO=?)");
		  ps.setString(1, jdto.getFrom());
		  ps.setString(2, jdto.getTo());
		  ps.setString(3, jdto.getTo());
		  ps.setString(4, jdto.getFrom());
		  rs=ps.executeQuery();
		  while(rs.next()){
			  
			   fnumber[i]=rs.getString(1);			 
			   i++;
		  }
		  for(int k=0;k<fnumber.length;k++)
		  {
			  ps1=con.prepareStatement("select FNUMBER from FLIGHT_AVAILABLE where AVAIL_DAY in (?,?) and Fnumber=? ");
			  ps1.setString(1, days[jweek-1]);
			  ps1.setString(2, days[rweek-1]);
			  ps1.setString(3, fnumber[k]);
			  rs1=ps1.executeQuery();			 
			  while(rs1.next()){
				  ps2=con.prepareStatement("select FNUMBER,FNAME,CAPACITY,RESERVED,AVAILABLE from FLIEGHT_DETAILS natural join FLIGHTSTATUS where FNUMBER=?");
				  ps2.setString(1, rs1.getString(1));
				  rs2=ps2.executeQuery();
				  if(rs2.next()){
					  ps=con.prepareStatement("select EFARE,BFARE,DTIME,ATIME from AIRLINE_SERVICES where fnumber=?");
					  ps.setString(1, rs2.getString(1));
					  rs3=ps.executeQuery();
					  if(rs3.next()){
					   JourneyDTO dto=new JourneyDTO();
					   if(rs2.getInt(3)!=(rs2.getInt(4)+jdto.getAdults()+jdto.getChills()))
					   {
						  dto.setFnumber(rs2.getString(1));
						  dto.setFname(rs2.getString(2));
						  dto.setCapacity(rs2.getInt(3));
						  dto.setReserved(rs2.getInt(4));
						  dto.setAvailable(rs2.getInt(5));
						  dto.setEfare(rs3.getFloat(1));
						  dto.setBfare(rs3.getFloat(2));
						  dto.setDtime(rs3.getString(3));
						  dto.setAtime(rs3.getString(4));
						  dto.setAdults(jdto.getAdults());
						  dto.setChills(jdto.getChills());
						  dto.setJdate(jdto.getJdate());
						  float eamount=rs3.getFloat(1);
						  float etot=eamount*jdto.getAdults();
						  etot=etot+((eamount/2)*jdto.getChills());
						  dto.setEamount(etot*2);
						  //(rs1.getFloat(1)*jdto.getAdults())+((rs1.getFloat(1)*jdto.getChills())/2)
						  float bamount=rs3.getFloat(2);
						  float btot=bamount*jdto.getAdults();
						  btot=btot+((bamount/2)*jdto.getChills());
						  dto.setBamount(btot*2);
						  //(rs1.getFloat(2)*jdto.getAdults())+((rs1.getFloat(2)*jdto.getChills())/2)
						  dto.setFrom(jdto.getFrom());
						  dto.setTo(jdto.getTo());  
						  slist.add(dto);
					   }
				     }
			      }
		      }
		 
			
		  }
	  }catch(NullPointerException ne){
			 ne.printStackTrace();
			 throw new DataAcessException("Database Connection failed");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlException raised /datanot found");
		 }finally{
			 try{
				 ps.close();	
				 con.close();			 		
			 }catch(Exception e){
				 e.printStackTrace();
			 }
		 }
	  return slist;
 } 
 
 public ArrayList<JourneyDTO> checkOneWayAvailability( JourneyDTO jdto)throws DataNotFoundException,DataAcessException
 {
	 int jweek=0;
	 int rweek=0;
	 String days[]={"sun","mon","tue","wed","thu","fri","sat"};
 	 int i=0;
 	 try{
 		 
 		 String datea=null;
 		 StringTokenizer st=new StringTokenizer(jdto.getJdate(), "-");
 		 st.hasMoreTokens();
 		 datea=st.nextToken();
 		 datea=datea+"/";
 		 datea=datea+st.nextToken();
 		 datea=datea+"/";
 		 datea=datea+st.nextToken(); 		 
 		 System.out.println(datea);
         SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
         Date date=sdf.parse(datea.trim());        
         Calendar call=Calendar.getInstance();
         call.setTime(date);
         jweek=call.get(Calendar.DAY_OF_WEEK); 
        
 	 }catch(Exception e){ 
 		 e.printStackTrace();
 	 }
	 
	 ArrayList<JourneyDTO> slist=new ArrayList<JourneyDTO>();
	 try{
		 ps=con.prepareStatement("select FNUMBER from AIRLINE_SERVICES  where SERVICE_FROM=? and SERVICE_TO=? and " +
		 		"fnumber in (select fnumber from FLIGHT_AVAILABLE where AVAIL_DAY=?)");
		  ps.setString(1, jdto.getFrom());
		  
		  ps.setString(2, jdto.getTo());
		 
		  ps.setString(3, days[jweek-1]);
		  ResultSet rset=ps.executeQuery();		
			  while(rset.next())
			  {    
			
				  ps2=con.prepareStatement("select FNUMBER,FNAME,CAPACITY,RESERVED,AVAILABLE from FLIEGHT_DETAILS natural join FLIGHTSTATUS where FNUMBER=?");
				  ps2.setString(1, rset.getString(1));
				  rs=ps2.executeQuery();
				  if(rs.next()){
					  ps=con.prepareStatement("select EFARE,BFARE,DTIME,ATIME,DISTANCE from AIRLINE_SERVICES where fnumber=? and SERVICE_FROM=? and SERVICE_TO=?");
					  ps.setString(1, rset.getString(1));
					  ps.setString(2, jdto.getFrom());
					  ps.setString(3, jdto.getTo());
					  rs1=ps.executeQuery();
					  if(rs1.next())
					  {
					   JourneyDTO dto=new JourneyDTO();
					   if(rs.getInt(3)!=(rs.getInt(4)+jdto.getAdults()+jdto.getChills()))
					   {
						  dto.setFnumber(rs.getString(1));
						  dto.setFname(rs.getString(2));
						  dto.setCapacity(rs.getInt(3));
						  dto.setReserved(rs.getInt(4));
						  dto.setAvailable(rs.getInt(5));
						  dto.setEfare(rs1.getFloat(1));
						  dto.setBfare(rs1.getFloat(2));
						  dto.setDtime(rs1.getString(3));
						  dto.setAtime(rs1.getString(4));
						  dto.setDistance(rs1.getInt(5));
						  dto.setFrom(jdto.getFrom());
						  dto.setTo(jdto.getTo());
						  dto.setAdults(jdto.getAdults());
						  dto.setChills(jdto.getChills());
						  dto.setJdate(jdto.getJdate());
//						  dto.setEamount((rs1.getFloat(1)*jdto.getAdults())+((rs1.getFloat(1)*jdto.getChills())/2));
						  float efare=rs1.getFloat(1);
						  float etot=efare*jdto.getAdults();
					      float chils=(efare/2)*jdto.getChills();
					      etot=etot+chils;
					      dto.setEamount(etot);
						  float bfare=rs1.getFloat(2);
						  float btot=bfare*jdto.getAdults();
						  float bchils=(bfare/2)*jdto.getChills();
						  btot=btot+bchils;
//						  dto.setBamount((rs1.getFloat(2)*jdto.getAdults())+((rs1.getFloat(2)*jdto.getChills())/2));
						  dto.setBamount(btot);
						  slist.add(dto);
					  }				     
			       }
		        }
			  }
	  }catch(NullPointerException ne){
			 ne.printStackTrace();
			 throw new DataAcessException("Database Connection failed");
		 }catch(SQLException se){
			 se.printStackTrace();
			 throw new DataNotFoundException("SqlException raised /datanot found");
		 }finally{
			 try{
				 ps.close();	
				 con.close();			 		
			 }catch(Exception e){
				 e.printStackTrace();
			 }
		 }
	  return slist;
 }
 
 public boolean createNewAccount(FlyersDTO fdto)throws DataNotFoundException,DataAcessException{
	 boolean flag=false;
	 int  j=0;
	 try{
		
		 ps=con.prepareStatement("insert into USER_DETAILS values(?,?,?,?,?,?,?,?,sysdate,?,?,?,?,?,?,?,?)");
		 ps.setString(1, fdto.getUserid());
		 ps.setString(2, fdto.getPwd());
		 ps.setString(3, fdto.getSurname());
		 ps.setString(4, fdto.getFullname());
		 ps.setString(5, fdto.getDob());
		 ps.setString(6, fdto.getGender());
		 ps.setString(7, fdto.getEmail());
		 ps.setString(8, fdto.getMobile());
		 ps.setString(9, fdto.getCity());
		 ps.setString(10, fdto.getState());
		 ps.setString(11, fdto.getCountry());
		 ps.setString(12, fdto.getPin());
		 ps.setString(13, fdto.getTitle());
		 ps.setString(14, "flyer");
		 ps.setString(15, fdto.getQuestn());
		 ps.setString(16, fdto.getAns());
		 
		 int c=ps.executeUpdate();
		 if(c>0){
			 ps=con.prepareStatement("insert into FLYERPOINTS values(?,?)");
			 ps.setString(1, fdto.getUserid());
			 ps.setDouble(2, 0);
			 int c1=ps.executeUpdate();
			 
			 
			 
			 if(c1>0)
	         {
	         
	         
        	  
        	  pstmt2=con.prepareStatement("insert into accountdetails values( (select nvl(max(accno),1020304050)+1 from accountdetails),?,?,?,?,sysdate)");
        	  
        	  
        	  pstmt2.setString(1,fdto.getAcctype());
        	  pstmt2.setString(2,fdto.getUserid());
        	   pstmt2.setString(3,fdto.getBank());
        	   pstmt2.setFloat(4,fdto.getAccbal());
        	  
        	   
        	  j=pstmt2.executeUpdate();
        	 System.out.println(j);
        	  
	         }
			 if(j>0){
				 flag=true;
				 con.commit();
			 }
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
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
 
 
 public ArrayList<FlyersDTO> getLoginDetails()throws DataNotFoundException,DataAcessException{
	 ArrayList<FlyersDTO> flist=null;
	 try{
		ps=con.prepareStatement("select  USER_ID, USER_NAME,  nvl(to_char(LOGIN_TIME,'dd-MM HH12:mi'),''), nvl(to_char(LOGOUT_TIME,'dd-MM HH12:mi'),'')" +
				" from USER_DETAILS natural join LOGIN_MASTER"); 
		rs=ps.executeQuery();
		flist=new ArrayList<FlyersDTO>();
		while(rs.next()){
			FlyersDTO fdto=new FlyersDTO();
			fdto.setUserid(rs.getString(1));
			fdto.setFullname(rs.getString(2));
			fdto.setDob(rs.getString(3));
			fdto.setDor(rs.getString(4));
			flist.add(fdto);
		}
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 ps.close();	
			 con.close();			 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return flist;
 } 
 
 
 public int getRowCount(){
	 int count=0;
	 try{
		 st=con.createStatement();
		 rs=st.executeQuery("select count(*) from LOGIN_MASTER ");
		 if(rs.next()){
			 count=rs.getInt(1);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		
	 }catch(SQLException se){
		 se.printStackTrace();
		
	 }finally{
		 try{
			 ps.close();	
			 con.close();			 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return count;
 }
 
 public ArrayList<MailDTO> getMails(String userid)throws DataNotFoundException,DataAcessException{
	ArrayList<MailDTO> mlist=null;
	try{
		ps=con.prepareStatement("select USER_ID, SENDER_ID, SUBJECT, BODY, to_char(DOS,'dd-MM-yyyy'),MID from USER_MAILS where USER_ID=?");
		ps.setString(1, userid);
		rs=ps.executeQuery();
		mlist=new ArrayList<MailDTO>();
		while(rs.next()){
			MailDTO mdto=new MailDTO();
			mdto.setUserid(rs.getString(1));
			mdto.setSender(rs.getString(2));
			mdto.setSubject(rs.getString(3));
			mdto.setBody(rs.getString(4));
			mdto.setDos(rs.getString(5));
			mdto.setMid(rs.getInt(6));
			mlist.add(mdto);
		}
	}catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
			 ps.close();	
			 con.close();			 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 
	 return mlist;
  }
 
 public boolean insertMail(String user,String to,String sub,String body)throws DataNotFoundException,DataAcessException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("insert into USER_MAILS values(?,?,?,?,sysdate,(select nvl(max(mid),10)+1 from user_mails))");
		 ps.setString(1, to);
		 ps.setString(2, user);
		 ps.setString(3, sub);
		 ps.setString(4, body);
		 int c=ps.executeUpdate();
		 if(c>0){
			 flag=true;
			 con.commit();
			 
		 }else
			 con.rollback();
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
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
 
 
 public boolean sendMailToAdmin(String user,String sub,String body)throws DataNotFoundException,DataAcessException{
	 boolean flag=false;
	 try{
		 ps=con.prepareStatement("insert into USER_MAILS values((select USER_ID from user_details where USER_TYPE='admin'),?,?,?,sysdate,(select nvl(max(mid),10)+1 from user_mails))");
		 ps.setString(1, user);
		 ps.setString(2, sub);
		 ps.setString(3, body);
		 int c=ps.executeUpdate();
		 if(c>0){
			 flag=true;
			 con.commit();
			 
		 }else
			 con.rollback();
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
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
 
 public boolean deleteMail( int mid)throws DataNotFoundException,DataAcessException{
    boolean flag=false;
     try{
    	st=con.createStatement();
    	int c=st.executeUpdate("delete from user_mails where mid="+mid);
    	if(c>0){
    		flag=true;
    		con.commit();
    	}else
    		con.rollback();
     }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
				
			 st.close();			 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
    return flag;
 }
 
 
 public ArrayList<JourneyDTO> getBookingDetails()throws DataAcessException,DataNotFoundException{
	 ArrayList<JourneyDTO> jlist=null;
	 try{
		 ps=con.prepareStatement("select FNUMBER, USER_ID,DOJ, NOOFTICKETS, JFROM, JTO from BOOKINGDETAILS");
		 rs=ps.executeQuery();
		 jlist=new ArrayList<JourneyDTO>();
		 while(rs.next()){
			 JourneyDTO jdto=new JourneyDTO();
			 jdto.setFnumber(rs.getString(1));
			 jdto.setFname(rs.getString(2));
			 jdto.setDoj(rs.getString(3));
			 jdto.setAvailable(rs.getInt(4));
			 jdto.setFrom(rs.getString(5));
			 jdto.setTo(rs.getString(6));
			 jlist.add(jdto);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
				con.close();
			 ps.close();		 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return jlist;
 }
 
 
 public ArrayList<JourneyDTO> getHotelBookingDetail(String userid)throws DataAcessException,DataNotFoundException{
	 ArrayList<JourneyDTO> jlist=null;
	 try{
		 ps=con.prepareStatement("select USER_ID,DOJ,DOR, NOOFPERSON,HOTELNAME,CITY from HotelBOOKINGDETAILS where USER_ID=?");
		 ps.setString(1, userid);
		 rs=ps.executeQuery();
		 jlist=new ArrayList<JourneyDTO>();
		 while(rs.next()){
			 JourneyDTO jdto=new JourneyDTO();
			 jdto.setFnumber(rs.getString(1));
			 jdto.setFname(rs.getString(5));
			 jdto.setDoj(rs.getString(6));
			 jdto.setAvailable(rs.getInt(4));
			 jdto.setFrom(rs.getString(2));
			 jdto.setTo(rs.getString(3));
			 jlist.add(jdto);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
				con.close();
			 ps.close();		 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return jlist;
 }
 
 
 public ArrayList<JourneyDTO> getBookingDetail(String userid)throws DataAcessException,DataNotFoundException{
	 ArrayList<JourneyDTO> jlist=null;
	 try{
		 ps=con.prepareStatement("select FNUMBER, USER_ID,DOJ, NOOFTICKETS, JFROM, JTO from BOOKINGDETAILS where USER_ID=?");
		 ps.setString(1, userid);
		 rs=ps.executeQuery();
		 jlist=new ArrayList<JourneyDTO>();
		 while(rs.next()){
			 JourneyDTO jdto=new JourneyDTO();
			 jdto.setFnumber(rs.getString(1));
			 jdto.setFname(rs.getString(2));
			 jdto.setDoj(rs.getString(3));
			 jdto.setAvailable(rs.getInt(4));
			 jdto.setFrom(rs.getString(5));
			 jdto.setTo(rs.getString(6));
			 jlist.add(jdto);
		 }
	 }catch(NullPointerException ne){
		 ne.printStackTrace();
		 throw new DataAcessException("Database Connection failed");
	 }catch(SQLException se){
		 se.printStackTrace();
		 throw new DataNotFoundException("SqlException raised /datanot found");
	 }finally{
		 try{
				con.close();
			 ps.close();		 		
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 return jlist;
 }
 
 
}











