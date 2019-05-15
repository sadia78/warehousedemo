<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
%>
<jsp:forward page="/Logout.jsp"></jsp:forward>
<% }%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="JavaScript" type="text/javascript"
			src="scripts/ts_picker.js"></script>
		
	</head>
	<body bgcolor="#ff0ffff">
		<table width="960">
			<tr>
				<td colspan="3">
					<jsp:include page="./FlyerHeader.jsp"></jsp:include>
				</td>
				
			</tr>
			 <tr>
      <td width="900" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td>
			<tr>
				<td colspan="3"></td>
			</tr>
			
							</td>
							<td width="700" bgcolor="#ff0ffff" align="left" valign="top">
								<table width="700">
									<tr>
										<td align="right">
											<font color="gray" size="4"> Welcome To <c:out
													value='${sessionScope.ownuser}'></c:out> </font>
										</td>
									</tr>
									<tr>
										<td>
											<a href="./BookAFlight.jsp"
												style="font-weight: 150; text-decoration: none">Book A
												Flight Now</a>
											<br>
										</td>
									</tr>
									<tr>
										<td>
											<a href="./BookAHotel.jsp" style="font-weight: 150; text-decoration: none"
												>Book A Hotel 
												Now</a>
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
								</table>
							</td>
							
						</tr>
					</table>
					
					
					
					</br>
					</br>
					</br>
					</br>
					
				<table><tr>
				<td colspan="3" width="960">
					<jsp:include page="./Footer.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</body>
</html>