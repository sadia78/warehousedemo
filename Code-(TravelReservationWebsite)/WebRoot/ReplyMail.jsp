<%@ page isThreadSafe="true"  %>

<%@page import="com.mas.dto.HotelDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
	String userid=request.getParameter("to");
%>
<html>
 <head>
  <script type="text/javascript">
   function checkForm(){
     if(document.forms.mailform.subject.value==""){
      alert("Subject is required");
      document.forms.mailform.subject.focus();
      return false;
     }
   }
  </script>
 </head>
  <body>
    <table width="980">
     <tr>
      <td align="center" height="215" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="830" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp;&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
     <td colspan="2" align="center" height="220" valign="top">
     <form action="./PostMailAction" name="mailform" onsubmit="return checkForm();">
      <table width="400" align="center" border="1">
       <tr>
        <Td align="center">
         <c:if test="${requestScope.status ne null}">
          <c:out value="${requestScope.status}"></c:out>
         </c:if>
        </Td>
       </tr>
       <tr>
        <td>
         <font size="4">To &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</font>
         <input type="text" value="<%=userid %>" name="to" readonly="readonly" size="33">
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">Subject</font> &nbsp;&nbsp; 
         <input type="text" name="subject"  size="33">
        </td>
       </tr>
       <tr>
        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
         <textarea rows="3" name="body" cols="25"></textarea>
        </td>
       </tr>
       <tr>
        <td align="center">
         <input type="submit" value="Send">
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
</html>