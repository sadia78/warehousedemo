<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
	<script type="text/javascript">
	 function Validate(login)
	 {
	    var user=document.getElementById("userid").value;
	    var pwd=document.getElementById("userpwd").value;
	    
	    if(user==""){
	        alert("userid is required");
	        document.forms.login.userid.focus();
	        return false;
	    }
	   if(pwd==""){
	        alert("password is required");
	        document.forms.login.userpwd.focus();
	        return false;
	    }

	 }
	</script>
  </head>
  
  <body>
   <table width="980" >
    <tr>
     <td>
       <img src="./images/ff.jpg" width="300" height="230"> 
     </td>
     <td width="650">
      <form action="./LoginAction" method="post" name="login" onsubmit="return Validate(this);">
       <table align="center" width="400">
        <tr>
         <td align="center">
                  Login Here<br>
           <%if(request.getParameter("status")!=null) 
               out.println(request.getParameter("status"));
           %>      
<%--          <c:if test="${not empty requestScope.status}">--%>
<%--            <c:out value="${requestScope.status}"></c:out>--%>
<%--          </c:if>--%>
         </td>
        </tr>
        <tr>
         <td> 
          EnterUserID&nbsp;&nbsp;&nbsp;  
          <input type="text" name="userid" size="30" id="userid">
<%--          <c:if test="${param.userid==''}">--%>
<%--           <center><font color="red"> Enter UserId</font></center>--%>
<%--          </c:if>--%>
         </td>
        </tr>
        <tr>
         <td> 
          EnterPssword&nbsp;  <input type="password" name="userpwd" size="30" id="userpwd">
         </td>
        </tr>
        <tr></tr>
        <tr>
          <td align="center">       
            <input type="submit" name="submit" value="Login">
         </td>
        </tr>
        <tr>
         <td>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
          <a href="./Regustration.jsp">RegisterNow</a> 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp; <a href="./ForgotPassword.jsp">ForgotPassword</a>
         </td>
        </tr>
       </table>
      </form>
     </td>
     <td align="right">
      <img src="./images/Back5.jpg" width="200">
     </td>
    </tr>
   </table>
  </body>
</html>
          