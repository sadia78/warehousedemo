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
   <script type="text/javascript">
    function checkForm(password){
     if(""==document.forms.password.pwd.value){
          alert("Please Eenter new password");
          document.forms.password.pwd.focus();
          return false;
       }
       if(document.forms.password.pwd.value!=document.forms.password.newpwd.value){
         alert("password not matched");
         document.forms.password.newpwd.focus();
          return false;
       }           
    }
   </script> 
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
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
      <td  colspan="1" align="center" height="220" valign="top">
       <form action="./ChangePass" name="password" onsubmit="return checkForm(this);">
        <table>
         <tr>
          <td colspan="2" align="center">
           <font color="green" size="3" face="verdana">change  pass word page</font>
          </td>
         </tr>
         <tr><td colspan="2" align="center">
          <%if(request.getParameter("status")!=null)
            { 
              out.println(request.getParameter("status"));
            }
           %>
          </td>
         </tr>
         <tr>
          <td>
           <font color="blue"  size="3">Your id is</font>
          </td>
          <td>
           <input type="text" name="userid" value='${sessionScope.ownuser }' readonly="readonly">
          </td>
         </tr>
         <tr>
          <td>
           <font color="blue"  size="3">Enter Your New Password</font>
          </td>
          <td>
           <input type="text"  name="pwd">
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
           <input type="submit" value="changepass">
          </td>
         </tr>
        </table>
        </form>
      </td>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
