<%@ page isThreadSafe="true"  %>

<%@page import="com.mas.dto.HotelDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<html>
 <head>
  
 </head>
  <body>
    <table width="980">
     <tr>
      <td align="center" height="215" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="830" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
     <td colspan="2" align="center" height="220" valign="top">
      <table width="500" align="center" border="1">
        <tr>
         <td colspan="6" bgcolor="#fffff" align="center">
          <font color="#59ff0ff" size="4">Hotel Details</font>
         </td>
        </tr>
        <tr bgcolor="#fffff">
        <td><font color="blue" size="4">HotelName</font></td>
       
        <td><font color="blue" size="4">RoomCapacity</font></td>
        <td><font color="blue" size="4">MinimumCharge/day</font></td> 
        <td><font color="blue" size="4">ACRoomCapacity</font></td>
        <td><font color="blue" size="4">AcRoomCharge/day</font></td> 
        <td><font color="blue" size="4">NonRoomCapacity</font></td>
        <td><font color="blue" size="4">NonAcRoomCharge/day</font></td> 
         <td><font color="blue" size="4">Country</font></td>
        <td><font color="blue" size="4">City</font></td>
        <td><font color="blue" size="4">Street</font></td>
        <td><font color="blue" size="4">Contact</font></td>
        <td><font color="blue" size="4">HotalType</font></td>    
       </tr>   
       <c:forEach var="hotels" items="${hotels}">
        <tr>
         <td><a href="./DeleteHotel?hid=${hotels.hid }" > ${hotels.hname }</a></td>
        
         <td>${hotels.capacity }</td>
         <td>${hotels.charge}<font color="re" size="4">$</font></td>   
         <td>${hotels.acroom }</td>
         <td>${hotels.accharge}<font color="re" size="4">$</font></td>    
         <td>${hotels.nonacroom }</td>
         <td>${hotels.nonaccharge}<font color="re" size="4">$</font></td>  
          <td>${hotels.country}</td>
         <td>${hotels.city}</td>
         <td>${hotels.street}</td>
         <td>${hotels.mobile }</td>
         <td>${hotels.hotelhype }</td>      
        </tr>
       </c:forEach>
      </table>
     </td>
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
</html>