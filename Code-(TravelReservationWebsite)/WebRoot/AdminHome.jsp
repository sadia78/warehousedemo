<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String user1=(String)session.getAttribute("ownuser");
	if (user1.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
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
    <table width="990" align="center">
     <tr>
      <td align="center" height="200" width="980" valign="top" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="870" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="2">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
      <td width="800" align="center" valign="top" height="200">  <br><br> 
       <font color="red" size="3" face="TimesNewRoman">
        <a href="./GetBookingDetails" style="text-decoration: none;">ShowBookingDetails</a>
        <br><br><br><br><br>
        WelCome To Administration
       </font>   
      </td>
     
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
