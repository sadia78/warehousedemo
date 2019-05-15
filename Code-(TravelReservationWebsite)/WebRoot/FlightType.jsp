
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.io.PrintWriter"%>
<%
  
 String type=request.getParameter("ftype");
 System.out.println("in flighttype.jsp:"+type);
%>
 <c:if test="${type eq 'nonstop'}">

   <%
     out.println("<font color=green size=4>Enterdistance </font>");
     out.println("<input type=text name=distance size=20>");
   %>
 </c:if>
 <c:if test="${type eq 'connecting'}">
  <%out.println("<font color=green size=4>Via </font>");
    out.println("<input type=text name=via id=via size=30><br>" );
    out.println("<font color=green size=4>Distance</font>&nbsp;&nbsp;&nbsp;");
    out.println("<font color=blue size=4><c:out value='${param.fsource}'</c:out></font>");
    out.println("< font color=red>To</font><font color=blue size=4><c:out value='${param.via}'</c:out></font>");
    out.println("<input type=text name=d1 id=d1 ><br>");
    out.println("<font color=blue size=4><c:out value='${param.via}'/></font>");
    out.println("<font color=red>To</font><font color=green size=4><c:out value='${param.fdestination}' /></font>");
    out.println("<input type=text name=d2 id=d2>");
   %>
 </c:if>
<%-- --%><%
   if(type.equals("nonstop")){
   %>
    <font color="green" size="4">EnterDistance </font>
    <input type="text" name="distance" id="distance">
   <%
     }
     else
     {
  %>
     <font color="green" size="4">Flight Travel Via</font>
     <input type="text" name="via" id="via">
     <font color="green">Distance</font>
     <c:out value="${param.fsource}"></c:out><font color="red"> To </font>
     <c:out value="${param.via}"></c:out><input type="text" name="distance1"><br>
     <c:out value="${param.via}"></c:out><font color="red">To</font>
     <c:out value="${param.destination}"></c:out><input type="text" name="distance2">
     
  <%}%>