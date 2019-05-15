<%@ page isThreadSafe="true"  %>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mas.dao.MasterDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mas.dto.ServicesDTO" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
ArrayList<ServicesDTO> slist=new MasterDAO().getServices();
request.setAttribute("services",slist);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <head> 
  </head>  
  <body>
   <table width="980">
     <tr>
      <td align="center" height="220" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="830" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
      <td colspan="2" align="center" valign="middle" width="980" height="230">
       <form action="./InsertAvailableDays" method="get" name="addflight" onsubmit="return formvalidator(this);">
        <table align="center" width="800">
         <tr bgcolor="lightgray">
          <td width="770" colspan="0" align="center">
            <font color="red" size="5">Tick the days on Flight Available in a week</font>
          </td>
         </tr>
         <tr>
          <td><font color="red">Note:</font>
           <font face="verdana" size="2"> select the days on which the 
           previous entered flight available.And click submit to complete the proces.</font>
          </td>
         </tr>
         <tr>
          <td align="center">
           <input type="checkbox" checked="checked" name="avail" value="sun">
           <font face="verdana" size="4"> ON sunday</font></td>
         </tr>
          <tr>
          <td align="center">&nbsp;
           <input type="checkbox" name="avail" value="mon">
           <font face="verdana" size="4">ON monday</font></td>
         </tr>
          <tr>
          <td align="center">&nbsp;&nbsp;
           <input type="checkbox" name="avail" value="tue">
           <font face="verdana" size="4"> ON tuesday</font></td>
         </tr>
          <tr>
          <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; 
           <input type="checkbox" name="avail" value="wed">
           <font face="verdana" size="4"> ON wednesday</font></td>
         </tr>
          <tr>
          <td align="center">&nbsp; &nbsp; &nbsp;&nbsp; 
           <input type="checkbox" name="avail" value="thu">
           <font face="verdana" size="4"> ON Thursday </font></td>
         </tr>
          <tr>
          <td align="center">
           <input type="checkbox" name="avail" value="fri">
           <font face="verdana" size="4">ON Friday</font></td>
         </tr>
          <tr>
          <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="checkbox" name="avail" value="sat">
           <font face="verdana" size="4">ON Saturday</font></td>
         </tr>
         <tr>
          <td align="center"> 
            <input type="hidden" name="fnumber" value="<%=request.getParameter("fnumber")%>">
            <input type="submit" name="submit" value="SubmitDetails" >
          </td>         
         </tr>
        </table>
       </form>
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
