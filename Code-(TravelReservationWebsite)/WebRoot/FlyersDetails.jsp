<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String user1=(String)session.getAttribute("ownuser");
	if (user1.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
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
    <table width="980">
     <tr>
      <td align="center" height="200" width="980" valign="middle" colspan="2">
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
      <td colspan="2" align="center" height="180" valign="top">
       <table width="980" border="1">
        <tr bgcolor="lightgray">
         <td colspan="10" align="center">
           <font color="red" size="5">Frequent Flyers Details </font>
         </td>
        </tr>
        <tr>
         <td colspan="8">
          <font color=red>Note:-</font>
          Here You can delete Account by click name hyperlink.
         </td>
        </tr>
        <tr>
         <td align="center"><font size="4" color="violet">Name</font></td>
          <td><font size="4" color="violet">Gender</font></td>
           <td><font size="4" color="violet">Mobile</font></td>
            <td><font size="4" color="violet">Email</font></td>
             <td><font size="4" color="violet">DateOfRegister</font></td>
              <td><font size="4" color="violet">City</font></td>
               <td><font size="4" color="violet">State</font></td>
                <td><font size="4" color="violet">Country</font></td>               
               
                  
        </tr>
        <c:forEach var="flyers" items="${flyers}">
        <tr>
          <td><a href="./DeleteAccount?userid=${flyers.userid }" >${flyers.title }.&nbsp;${flyers.fullname }&nbsp;${flyers.surname }</a></td>
          <td>${flyers.gender } </td>
          <td>${flyers.mobile }</td>
          <td>${flyers.email }</td>
          <td>${flyers.dor }</td>
          <td>${flyers.city }</td>
          <td>${flyers.state }</td>
          <td>${flyers.country }</td>         
        
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
  </body>
</html>
