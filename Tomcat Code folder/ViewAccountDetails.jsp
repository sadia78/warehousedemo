<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    

  </head>
  
  <body>
   <table >
  <tr>
				<td colspan="3">
					<jsp:include page="./FlyerHeader.jsp"></jsp:include>
				</td>
				
			</tr>
			 <tr>
      <td width="870" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td>
			
			</tr></table>
   <table align="center" border="1" bgcolor="" width="90%" cellpadding="10">
    <caption>Your Account Details</caption>
   <tr><th bgcolor="ashblue"><b>A/C Holder Name</b></th ><th bgcolor="ashblue"><b>Account Number</b></th><th bgcolor="ashblue"><b>A/C Type</b></th><th bgcolor="ashblue"><b>Account Balance</b></th>
    </tr>
<c:if test="${not empty AccInfo}">
      <c:forEach var="AccInfo" items="${AccInfo}">
<tr>
<td>${AccInfo.fname}${AccInfo.lname }</td>
<td>${AccInfo.accno}</td>
<td>${AccInfo.acctype}</td>
<td>${AccInfo.accbal}</td>


</tr>
</c:forEach>
</c:if>
</table>
   
   <br/>  <br/>  <br/>
    <jsp:include page="./Footer.jsp"></jsp:include>
   
  </body>
</html>
