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
    <table width="980" align="center">
     <tr>
      <td align="center" height="160" width="980" valign="top" colspan="3">
       <jsp:include page="/FlyerHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="980" height="30" valign="top" align="left" bgcolor="skyblue" colspan="3">
       <jsp:include page="/FlyerOptions.jsp"></jsp:include>
      </td>     
     </tr>
     <tr>
      <td width="300" align="left" valign="middle" height="200"> 
       <img src="./images/ff.jpg" width="300" height="230">    
      </td>
      <td align="left" height="200" width="450">
       <font color="gray" size="4">
        <center>WelCome to Frequent Flyer Program</center>       
       </font>       
      </td>
      <td align="right">
       <img src="./images/Back5.jpg" width="200">
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
