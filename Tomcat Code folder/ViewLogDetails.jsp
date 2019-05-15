<%@ page isThreadSafe="true"%>

<%@page import="com.mas.dto.FlightDTO"%>
<%@page import="com.mas.dto.FlyersDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%
	String user = (String) session.getAttribute("ownuser");
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
				<td align="center" height="215" width="980" valign="middle"
					colspan="2">
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
			  <td width="580" align="center" valign="bottom" colspan="2">
					<%
						String pa = request.getParameter("page");

						ArrayList<FlyersDTO> ar = (ArrayList<FlyersDTO>)session.getAttribute("logdetails");
						int pageNo = 0;
						if (pa == null)
							pageNo = 0;
						else
							pageNo = Integer.parseInt(pa);
						int totalrows = ar.size();
						int totalpages = totalrows / 5;
						if (totalrows % 5 != 0)
							totalpages = totalpages + 1;
						int startrow = (pageNo * 5) + 1;
						int endrow = (pageNo * 5) + 5;
						if (endrow > totalrows)
							endrow = totalrows;
					%>
					<table border=0 align="center" width="550">
						<%
							try {
								if (ar.size() != 0) {
						%>
                        
						<tr bgcolor="#cyan">												
							<td bgcolor="#E0FEFD">
								<div align="center" class="style16">
									<font color="blue">SNO</font>
								</div>
							</td>							
							<td bgcolor="#E0FEFD">
								<div align="center" class="style16">
									<font color="blue">UserID</font>
								</div>
							</td>
							<td bgcolor="#E0FEFD">
								<div align="center" class="style16">
									<font color="blue">FirsName</font>
								</div>
							</td>						
							<td bgcolor="#E0FEFD">
								<div align="center" class="style16">
									<font color="blue">LogInTime</font>
								</div>
							</td>
							<td bgcolor="#E0FEFD">
								<div align="center" class="style16">
									<font color="blue">LogOutTime</font>
								</div>
							</td>
						</tr>
						<%
							FlyersDTO fdto;
									for (int intIndex = startrow - 1; intIndex < endrow; intIndex++) {
										fdto = (FlyersDTO) ar.get(intIndex);
						%>
						<tr bgcolor="#C3D7BA">
							<td bgcolor="#FEE8B6" width="40">
								<center><%=intIndex + 1%></center>
							</td>
							<td bgcolor="#FEE8B6" width="60">
								<center><%=fdto.getUserid()%></center>
							</td>
							<td bgcolor="#FEE8B6" width="85">
								<center><%=fdto.getFullname()%></center>
							</td>
							<td bgcolor="#FEE8B6" width="100">
								<center><%=fdto.getDob()%></center>
							</td>
							<td bgcolor="#FEE8B6" width="85">
								<center><%=fdto.getDor()%></center>
							</td>						
						</tr>
						<%
							}
						%>
					</table>
					<table align="center" width="550">
						<tr>
							<td width="100%">
								(<%=startrow%>-<%
								if (endrow > totalrows)
											endrow = totalrows;
							%><%=endrow%>
								of
								<%=totalrows%>
								Total)
								<%
								if (pageNo > 0) {
							%><a href="ViewLogDetails.jsp">First</a>|
								<a href="ViewLogDetails.jsp?page=<%=pageNo - 1%>"><< |</a>
								<%
									}
								%>
								<%
									// int count=0;
											for (int i = 0; i < totalpages; i++) {
												if ((i == pageNo - 2) || (i == pageNo - 1)
														|| (i == pageNo) || (i == pageNo + 1)
														|| (i == pageNo + 2)) {
													if (!(pageNo == i)) {
								%><a href="ViewLogDetails.jsp?page=<%=i%>">
									<%
										}
									%> <%=(i + 1)%></a> |
								<%
 	//count++;
 				}
 				//if(count==5)break;
 			}
 %>
								<%
									if (pageNo < totalpages - 1) {
								%><a
									href="ViewLogDetails.jsp?page=<%=pageNo + 1%>">>> |</a><a
									href="ViewLogDetails.jsp?page=<%=totalpages - 1%>">Last</a>
								<%
									}
								%>
							</td>
						</tr>
						<%
							}

								else {
						%>
						<tr>
							<td height="24" colspan="6">
								<div align="center" class="style3">
									<strong><font color="red">No Records Found</font>
									</strong>
								</div>
							</td>
						</tr>
						<%
							}
							} catch (Exception e) {
							}
						%>
					</table>
			 
			 </td>
			</tr>
			<tr>
				<td width="980" height="50" align="center" valign="bottom"
					colspan="2">
					<jsp:include page="/Footer.jsp"></jsp:include>
				</td>
			</tr>
		</table>
</html>