<%@ page isThreadSafe="true"  %>

<%@page import="com.mas.dto.HotelDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<html>
 <head>
  
 </head>
  <body>
    <table width="980">
     <tr>
      <td align="center" height="215" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="840" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="110" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
     <td colspan="2" align="center" height="220" valign="top">
      <table width="600" align="center" border="1">
        <tr>
         <td colspan="5" bgcolor="#fffff" align="left">
          <font color="#59ff0ff" size="5">INBOX</font>
         </td>
        </tr>
        <tr bgcolor="">
        <td><font color="blue" size="4">From</font></td>
        <td width="100"><font color="blue" size="4">Subject</font></td>
        <td width="250"><font color="blue" size="4">Body</font></td>
         <td><font color="blue" size="4">DateOfSend</font></td>
        <td><font color="blue" size="4">Reply</font></td>    
       </tr>   
       <c:forEach var="mails" items="${mails}">
        <tr>      
         <td><a href="./DeleteMail?mid=${mails.mid }">${mails.sender}</a> </td>
         <td>${mails.subject}</td>
         <td style="overflow: scroll;width: 100;height: 60;">${mails.body }</td>
         <td>${mails.dos}</td>
         <td><a href='./ReplyMail.jsp?to=${mails.sender }' style="text-decoration: none;">Reply</a> </td>       
        </tr>
       </c:forEach>
      </table>
     </td>
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
</html>