<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mas.dto.StatusDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.mas.dao.MasterDAO" %>
<%@page import="java.lang.String" %>

<% 
  String from=request.getParameter("from");
  String to=request.getParameter("to");
   ArrayList<StatusDTO> slist=new ArrayList<StatusDTO>();
     try{
	        slist=new MasterDAO().getFlightStatus(from,to);	  		       
		}catch(Exception e){
			e.printStackTrace();
		}	
		 request.setAttribute("status",slist);	
    
%>
<%-- try{--%>
<%--     Calendar calender=Calendar.getInstance();  --%>
<%--     hours=calender.getTime().getHours(); --%>
<%--     min=calender.getTime().getMinutes();   --%>
<%-- }catch(Exception e){--%>
<%--    e.printStackTrace();--%>
<%-- }--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>  
  <body>    
      <table align="center" >
       <tr>
        <td>
          <font color="gray" face="verdana" size="2">status of the flight between you have selected points</font>
        </td>
       </tr>
       <tr><td>
       <table>       
        <c:forEach var="status" items="${status}">
         <tr bordercolor="white" bgcolor="#FFFFF">
          <td bordercolor="white"><font color="red" face="verdana" size="2">Flight:</font>${status.fnumber }</td>
          <td bordercolor="white"><font color="red" face="verdana" size="2">From:</font>${status.from }</td>
          <td bordercolor="white"><font color="red" face="verdana" size="2">To:</font>${status.to }</td>
          <td bordercolor="white"><font color="red" face="verdana" size="2">Departs:</font>${status.dtime }</td>
          <td bordercolor="white"><font color="red" face="verdana" size="2">Arrives:</font>${status.atime }</td>
          <td bordercolor="white"><font color="red" face="verdana" size="2">AvailableSeets:</font>${status.available }</td>
         </tr>
        </c:forEach>
        </table>
       </td></tr>     
      </table>  
  </body>
</html>
