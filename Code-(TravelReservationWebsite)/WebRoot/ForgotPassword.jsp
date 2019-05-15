<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript">
    function Passrecovery(passrecovery){
     if(document.getElementById("userid").value==null){
        alert("Please enter your userid");
        document.forms.passrecovery.userid.focus();
        return false;
     }
     if(document.forms.passrecovery.squest.value==""){
       alert("Choose question");
       document.forms.passrecovery.squest.focus();
       return false;
     }
    }
   </script>
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
     <td valign="top" align="center">
       <form action="./PassRecovery" name="passrecovery" onsubmit="return Passrecovery(this);">
       <table width="780" align="center">
        <tr>
         <td align="center"><font color=red><%if(request.getParameter("status")!=null) out.println(request.getParameter("status"));%></font></td>
        </tr>
        <tr>
         <td> 
          User-Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
          <input type="text" name="userid" size="30" maxlength="40">
         </td>
        </tr>
        <tr>
         <td>Select Security Question<font size="3" face="Verdana">
     <select name="squest">
      <option value="select" selected="selected">--Select One---</option>
      <option value="What is your favorite pastime?">What is your favorite pastime?</option>
      <option value="Who your childhood hero?">Who your childhood hero?</option>
      <option value="What is the name of your first school?">What is the name of your first school?</option>
      <option value="Where did you meet your spouse?">Where did you meet your spouse?</option>
      <option value="What is your favorite sports team?">What is your favorite sports team?</option>
      <option value="What is your father middle name?">What is your father middle name?</option>
      <option value="What was your high school mascot?">What was your high school mascot?</option>
      <option value="What make was your first car or bike?">What make was your first car or bike?</option>
      <option value="What is your pet name?">What is your pet name?</option>
    </select></font></td>
        </tr>
        <tr>        
          <td> Security Answer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <input type="text" name="ans" value="" size="30" maxlength="190"/></td>
        </tr>
        <tr bgcolor="lightgray">
         <td></td>
        </tr>
        <tr>
         <td align="center">
          <input type="submit" value="GETPASS">
         </td>
        </tr>
       </table>
       </form>
     </tr>
     <tr>
      <td>
       <jsp:include page="Footer.jsp"></jsp:include>
      </td>
     </tr>
     </table>
  </body>
</html>
