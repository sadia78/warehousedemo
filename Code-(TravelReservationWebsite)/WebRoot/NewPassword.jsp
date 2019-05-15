<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%String user=request.getParameter("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
   function validateForm(newpass){
    if(""==document.forms.newpass.newpass.value){
      alert("Enter NewPassword");
      document.forms.newpass.newpass.focus();
      return false;
    }
    if(document.forms.newpass.newpass.value!=document.forms.repass.newpass.value){
      alert("Password Not matched");
      document.forms.newpass.repass.focus();
      return false;
    }
   }
  </script>
  </head> 
  <body>
    <table>
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
     <td valign="top" align="center">
      <form action="./CreateNewPass" method="get" name="newpass" onsubmit="return validateForm(this);">
      <table>
       <tr>
        <td> 
         UserID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;  <input type="text" value="<%=request.getParameter("user") %>" name="userid" readonly="readonly">
        </td>
       </tr>
       <tr>
        <td> 
         NewPassword <input type="password" name="newpass" id="newpass">
        </td>
       </tr>
       <tr>
        <td> 
         Re-Password&nbsp;&nbsp;  <input type="password" name="repass" id="repass">
        </td>
       </tr>
       <tr bgcolor="lightgray">
        <td>        
        </td>
       </tr>
       <tr>
        <td align="center">
         <input type="submit" value="CreatePass">
        </td>
       </tr>
      </table>
      </form>
      </td>
      </tr>
     <tr>
      <td>
       <jsp:include page="Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table> 
  </body>
</html>
