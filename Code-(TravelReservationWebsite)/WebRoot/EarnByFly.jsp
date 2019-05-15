<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mas.dao.MasterDAO"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mas.dto.FlightDTO"%>

 <%
     ArrayList<FlightDTO> flist=new ArrayList<FlightDTO>();
     try{
          flist=new MasterDAO().getFlights();
     }catch(Exception e)
     {
       e.printStackTrace();
     }
     request.setAttribute("flist",flist);
    %>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
   <table width="690">
    <tr bgcolor="black">
     <td></td>
    </tr>
    <tr bgcolor="lightgray">
     <td>
      <font color="blue" size="4">
       Earn More Points By Traveling by my flights:
      </font>
     </td>
    </tr>
    <tr>
     <td>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <font face="verdana" size="2">Fly by our air services, to over  
        700 destinations worldwide and you could earn and use points on eligible 
        fares and flights. To find out how to earn and use points with our planes, 
        shown list below. </font>    
      </p>
     </td>
    </tr>
    <tr>
     <td align="center" width="640">
     <table width="640">
      <tr>
       <td><font color="red">Flight Number</font></td>
       <td><font color="red">Flight Name</font></td>       
       <td><font color="red">TotalDistance</font></td>     
      </tr>
       <c:forEach var="flist" items="${flist}">
        <tr>
         <td>${flist.fnum}</td>
         <td>${flist.fname}</td>      
         <td>${flist.capacity}</td>
        </tr>
      </c:forEach>
     </table>
     </td>
    </tr>
   </table>
 
