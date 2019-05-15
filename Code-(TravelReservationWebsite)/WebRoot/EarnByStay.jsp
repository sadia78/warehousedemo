
<%@page import="com.mas.dto.HotelDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mas.dao.MasterDAO"%>
<%@page import="java.util.ArrayList" %>


 <%
     ArrayList<HotelDTO> hlist=new ArrayList<HotelDTO>();
     try{
          hlist=new MasterDAO().getHotels();
     }catch(Exception e)
     {
       e.printStackTrace();
     }
     request.setAttribute("hlist",hlist);
    %>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
   <table width="650" align="center">
    <tr bgcolor="black">
     <td></td>
    </tr>
    <tr bgcolor="lightgray">
     <td>
      <font color="blue" size="4">
       Earn More Points By Staying in my Hotels:
      </font>
     </td>
    </tr>
    <tr>
     <td>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <font face="verdana" size="2"> Next time you stay at 
        a hotel, make sure you choose one of My   
        Frequent Flyer hotel - so you can earn Frequent Flyer points. 
        * You'll be sure to find the accommodation you need at one of our hundreds of 
         hotel partners found in over 300 locations worldwide. <br>&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         Our hotel partners also regularly feature special offers, 
         including extra points promotions, discounted rates on accommodation, 
          and even access to special room upgrades to name a few.  </font>
      </p>
     </td>
    </tr> 
    <tr bgcolor="">
     <td align="center">
       <font color="red"> List of Hotels</font>
     </td>
    </tr>
    <tr>
     <td align="center" width="650">
     <table width="640" border="1">
      <tr>
       <td><font color="red">HotelName</font></td>
       <td><font color="red">Street</font></td>
       <td><font color="red">City</font></td>
       <td><font color="red">Country</font></td>  
       <td><font color="red">Min-Charge</font></td>
        <td><font color="red">Contact</font></td>  
      </tr>
       <c:forEach var="hlist" items="${hlist}">
        <tr>
         <td>${hlist.hname}</td>
         <td>${hlist.street}</td>
         <td>${hlist.city}</td>
         <td>${hlist.country}</td>
         <td>${hlist.charge}</td>
         <td>${hlist.mobile }</td>
        </tr>
      </c:forEach>
     </table>
     </td>
    </tr>
   </table>
 
