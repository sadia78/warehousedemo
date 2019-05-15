<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>  
  <body>
    <table border="0" >
     <tr>
      <td colspan="2" width="980" height="170" align="center" valign="top">
         <jsp:include page="./HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr bgcolor="skyblue">
      <td width="980" colspan="2" height="40" valign="top" align="center">
       <jsp:include page="./FlyerOptions.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="780" height="150">
        <jsp:include page="./Login.jsp"></jsp:include>
      </td>   
     </tr>
     <tr>
      <td width="50" align="center" colspan="2">
       <jsp:include page="./Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
