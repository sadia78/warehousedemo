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
     <script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>  
  </head>
  
  <body>
    <table width="980">
     <tr>
      <td align="center" height="200" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="650" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="280" align="center" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp;&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
      <td width="800" align="center" valign="middle" height="200">   
       <font color="red" size="5" face="TimesNewRoman">
        No Data Found In Database
       </font>       
      </td>
      <td align="right">
       <img src="./images/Back5.jpg" width="200">
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
