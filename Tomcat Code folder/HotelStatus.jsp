<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
%>
<jsp:forward page="/Logout.jsp"></jsp:forward>
<% }%>

<% 
 
 
 
   
    String city=(String)request.getAttribute("city");
    String hname=(String)request.getAttribute("hname");
    String jdate=(String)request.getAttribute("jdate");
    String rdate=(String)request.getAttribute("rdate");
    int person=(Integer)request.getAttribute("person");
   
   float amount=(Float)request.getAttribute("amount");
   
 
 


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="JavaScript" type="text/javascript"
			src="scripts/ts_picker.js"></script>
		
	</head>
	<body bgcolor="#ff0ffff">
		<table width="960" align="center">
			<tr>
				<td colspan="3">
					<jsp:include page="./FlyerHeader.jsp"></jsp:include>
				</td>
				
			</tr>
			 <tr>
      <td width="960" height="30" align="center" bgcolor="skyblue">
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td></tr></table>
			
			
							
							
								<table width="700">
									<tr>
										<td align="right">
											<font color="gray" size="4"> Welcome To <c:out
													value='${sessionScope.ownuser}'></c:out> </font>
										</td>
									</tr>
									
									
									<tr>
										<td bgcolor="lightgray">
										</td>
									</tr>
									<tr>
										<td>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div id="result">
												<center>
												 <c:if test="${requestScope.status ne null}">
												  <c:out value="${requestScope.status}"></c:out>
												 </c:if>
												</center>
											</div>
										</td>
									</tr>
								
							

							
					<table width="300" border="3" bordercolor="#003366" align="center">
					<tr>
					<td colspan="1"><font color="red">User_Name</font></td>
					<td align="center"><%=user %></td>
					</tr>
					<tr>
					<td><font color="red">Hotel_Name</font></td>
					<td align="center"><%=hname %></td>
					</tr>
					<tr>
					<td><font color="red">City_Name</font></td>
					<td align="center"><%=city %></td>
					</tr>
					
					<tr>
					<td ><font color="red">Check_In_Date</font></td>
					<td align="center"><%=jdate %></td>
					</tr>
					<tr>
					<td ><font color="red">Check_Out_Date</font></td>
					<td align="center"><%=rdate %></td>
					</tr>
					<tr>
					<td ><font color="red">TotalPerson</font></td>
					<td align="center"><%=person %></td>
					</tr>
					<tr>
					<td ><font color="red">Amount</font></td>
					<td align="center"><%=amount %></td>
					</tr>
					
					</table>
					
					
					</br>
					
					
				<table><tr>
				<td colspan="3" width="960">
					<jsp:include page="./Footer.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</body>
</html>