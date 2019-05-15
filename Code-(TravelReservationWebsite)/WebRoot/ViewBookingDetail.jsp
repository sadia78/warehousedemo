<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	</head>

	<body>
		<table width="980">
			<tr>
				<td align="center" height="200" width="980" valign="middle"
					colspan="2">
					<jsp:include page="/HomeHeader.jsp"></jsp:include>
				</td>
			</tr>
			<tr>
				<td width="830" height="30" align="left" bgcolor="skyblue">
					<jsp:include page="/UserOptions.jsp"></jsp:include>
				</td>
				<td width="120" align="left" valign="bottom" bgcolor="skyblue">
					<font color="blue" size="4"> <c:out
							value='${sessionScope.ownuser}'>
						</c:out>&nbsp;&nbsp; In</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="220" valign="top">



					</br>
					<font color="#003366" size="5">View Booking Details</font>
					</br>
					<table width="750" align="center" border="1"
						background="images/bgg1.jpg">
						<tr bgcolor="pink">
							<td align="center" colspan="8">
								<font color="#003366" size="3">AirLine Booking Details</font>
							</td>
						</tr>
						<tr>
							<td>
								<font color="blue" size="4">Flight</font>
							</td>
							<td>
								<font color="blue" size="4">Person</font>
							</td>
							<td>
								<font color="blue" size="4"> From </font>
							</td>
							<td>
								<font color="blue" size="4"> TO</font>
							</td>

							<td>
								<font color="blue" size="4">Tickets</font>
							</td>
							<td>
								<font color="blue" size="4">DateOfJourney</font>
							</td>
							<td>
								<font color="blue" size="4">BookingCancel</font>
							</td>
						</tr>
						<c:forEach var="booking" items="${booking}">
							<tr>
								<td>
									${booking.fnumber }
								</td>
								<td>
									${booking.fname }
								</td>

								<td>
									${booking.from }
								</td>
								<td>
									${booking.to }
								</td>
								<td>
									${booking.available }
								</td>
								<td>
									${booking.doj }
								</td>
								<td>
									<a href="./DeleteBooking?fnumber=${booking.fnumber }&fname=${booking.fname }&from=${booking.from }&to=${booking.to }&doj=${booking.doj }"
										style="text-decoration: none;">Cancel</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
				<tr>
					<td width="980" height="50" align="center" valign="bottom"
						colspan="2">
						<jsp:include page="/Footer.jsp"></jsp:include>
					</td>
				</tr>
		</table>
	</body>
</html>
