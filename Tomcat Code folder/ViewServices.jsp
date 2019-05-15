<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
  </head>
  
  <body>
    <table width="980">
     <tr>
      <td align="center" height="200" width="980" valign="middle" colspan="2">
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
      <td  colspan="2" align="center" height="220" valign="top">
       <table width="750" align="center" border="1" background="images/bgg1.jpg">
        <tr bgcolor="lightgray">
         <td align="center" colspan="8">
          <font color="red" size="4">AirLine Services</font>
         </td>
        </tr>
        <tr>
         <td>
          <font color="blue" size="4">Service From </font>
         </td>
          <td>
          <font color="blue" size="4">Service TO</font>
         </td>
         <td>
          <font color="blue" size="4">Flight</font>
         </td>
          <td >
          <font color="blue" size="4">BusinessClass Fare</font>
         </td>
          <td>
          <font color="blue" size="4">EconomyClassFare</font>
         </td>
         <td>
          <font color="blue" size="4">Departs</font>
         </td>
         <td>
          <font color="blue" size="4">Arrives</font>
         </td>
         <td>
          <font color="green">delete</font>
         </td>        
        </tr>
        <c:forEach var="services" items="${services}">
          <tr>
              <td>${services.sfrom }</td>
              <td>${services.sto }</td>
              <td>${services.fnum }</td>
              <td>${services.bfare }<font color=red>$</font></td>
              <td>${services.efare }<font color=red>$</font></td>
              <td>${services.dtime }</td>
              <td>${services.atime }</td>
              <td>
               <a href='./DeleteService?sid=${services.sid }' style="text-decoration: none;">delete</a>
              </td>
          </tr>
        </c:forEach>       
       </table>
      </td>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
