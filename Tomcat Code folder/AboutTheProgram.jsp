<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String user=(String)session.getAttribute("ownuser");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
  </head>
  
  <body>
    <table width="980">
     <tr>
      <td colspan="2" width="980" height="170" align="center" valign="top">
         <jsp:include page="./HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="980" height="30" align="center" bgcolor="skyblue" colspan="3">
       <jsp:include page="/FlyerOptions.jsp"></jsp:include>
      </td>     
     </tr>
     <tr>
      <td width="750" align="center" valign="top" height="200" colspan="1">
       <table width="600" align="center">
        <tr bgcolor="#fffff">
         <td align="left">
          <font color="blue" size="4">Travel Reservation Website?</font>
         </td>
        </tr>
        <tr>
         <td>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
           <font face="verdana" size="2">The following are the main requirements for a travelreservation website. You need to make it complete, correct and consistent. <br></font></p><p><font face="verdana" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You can assume a reasonable number to any item that requires one. For example, flight ticket price, hotel price, mileage needed for a deal etc.  </font>         
          </p>
         </td>        
        </tr>
       </table>
      </td>   
      <td align="right">
         <img src="./images/flier.jpg" width="300" height="180">
      </td>    
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="3">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
