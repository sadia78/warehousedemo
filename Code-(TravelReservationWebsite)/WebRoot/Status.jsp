<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.mas.dto.FlyersDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@page import="com.mas.dto.FlightDTO"%>
<%@page import="com.mas.dao.UserDAO"%>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@page import="com.mas.dto.JourneyDTO"%>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
%>
<jsp:forward page="/Logout.jsp"></jsp:forward>
<% }%>

<% 
 
 
 JourneyDTO jtdo=(JourneyDTO)request.getAttribute("jdto");
   
   String from=jtdo.getFrom();
   String to=jtdo.getTo();
   String doj= jtdo.getDoj();
   int person=jtdo.getAdults()+jtdo.getChills();
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
								
							

							<tr>
										<td>
											<a href="./BookAHotel.jsp" style="font-weight: 150; text-decoration: none"
												> IF Book A Hotel then Get 20% Discount</a>
										</td>
									</tr>
						</table>
					<table width="300" border="3" bordercolor="#003366" align="center">
					<tr>
					<td colspan="1"><font color="red">User_Name</font></td>
					<td align="center"><%=user %></td>
					</tr>
					<tr>
					<td><font color="red">From</font></td>
					<td align="center"><%=from %></td>
					</tr>
					<tr>
					<td><font color="red">To</font></td>
					<td align="center"><%=to %></td>
					</tr>
					
					<tr>
					<td ><font color="red">DateOfJounary</font></td>
					<td align="center"><%=doj %></td>
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