<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
   <script type="text/javascript">
    
   </script> 
  </head>  
  <body>
     <form action="./ChangePass" name="password" >
        <table align="center">
         <tr>
          <td colspan="2" align="center">
           <font color="green" size="3" face="verdana">change  pass word page</font>
          </td>
         </tr>
         <tr><td colspan="2" align="center">
            <div id="success"></div>        
          </td>
         </tr>
         <tr>
          <td>
           <font color="blue"  size="3">Your id is</font>
          </td>
          <td>
           <input type="text" id="userid" name="userid" value='${sessionScope.ownuser }' readonly="readonly">
          </td>
         </tr>
         <tr>
          <td>
           <font color="blue"  size="3">Enter Your New Password</font>
          </td>
          <td>
           <input type="text" id="pwd" name="pwd">
          </td>
         </tr>
         <tr>
          <td>
           <font color="blue"  size="3">Re-Enter New Password</font>
          </td>
          <td>
           <input type="text"  name="newpwd">
          </td>
         </tr>
          <tr>
          <td align="center" colspan="2">
           <a href="#" onclick="UpdateNewPass();"><img width="130" height="30" src="images/changepass_button.png" border="0"> </a>
          </td>
         </tr>
        </table>
       </form>
  </body>
</html>
