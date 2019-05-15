<%@ page isThreadSafe="true"  %>

<%@page import="com.mas.dto.FlightDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<html>
 <head>
  <script type="text/javascript">
   function showPrompt(){
    var flag=confirm("Are you realy want to delete this flight");
     if(flag==true)
     {
       return true;
     }else
       return false;
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
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr>
     <td colspan="2" align="center" height="220" valign="top">
      <table width="800" >
        <tr>
         <td colspan="8" bgcolor="#fffff" align="center">
          <font color="#59ff0ff" size="5">Total Flight Details</font>
         </td>
        </tr>
        <tr>
        <td><font color="blue" size="3">FlightNumber</font></td>
        <td><font color="blue" size="3">FlightName</font></td>       
        <td><font color="blue" size="3">Capacity</font></td>
        <td><font color="green" size="5">S</font></td>
        <td><font color="green" size="5">M</font></td>
        <td><font color="green" size="5">T</font></td>
        <td><font color="green" size="5">W</font></td>
        <td><font color="green" size="5">T</font></td>
        <td><font color="green" size="5">F</font></td>
        <td><font color="green" size="5">S</font></td>       
       </tr> 
       <%
        ArrayList<FlightDTO> flist=(ArrayList<FlightDTO>)request.getAttribute("flist");
        if(!flist.isEmpty())
        {
         int i=0;
         for(FlightDTO fdto:flist)
         {     
          String fnumber=fdto.getFnum();  
          String[] avail=new String[7]; 
          avail[i]=fdto.getAvail();  
        %>
         <tr>
          <td>   
           <a href='./DeleteFlight?fnumber=<%=fdto.getFnum() %>' style="text-decoration: none" onclick="return showPrompt();">          
           <%=fdto.getFnum() %></a>
          </td>
          <td><%=fdto.getFname() %></td>
          <td><%=fdto.getCapacity() %></td>        
        <%  
         
          if(fdto.getAvail().equals("sun"))
          {
        %>
          <td bgcolor="lightgray"><font color="green" size="4">Y</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
        <%}else if(fdto.getAvail().equals("mon"))
          {
        %>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="green">Y</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
          <td bgcolor="lightgray"><font color="red">N</font></td>
        <%}else if(fdto.getAvail().equals("tue"))
          {
         %>
           <td bgcolor="lightgray"><font color="red">N</font></td>
           <td bgcolor="lightgray"><font color="red">N</font></td>
           <td bgcolor="lightgray"><font color="green">Y</font></td>
           <td bgcolor="lightgray"><font color="red">N</font></td>
           <td bgcolor="lightgray"><font color="red">N</font></td>
           <td bgcolor="lightgray"><font color="red">N</font></td>
           <td bgcolor="lightgray"><font color="red">N</font></td>
        <%}else if(fdto.getAvail().equals("wed"))
        {
        %>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="green">Y</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
        <%}else if(fdto.getAvail().equals("thu"))
        {
        %>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="green">Y</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
        <%}else if(fdto.getAvail().equals("fri"))
        {
        %>
        <td bgcolor="lightgray"><font color="red">N</font></td>
        <td bgcolor="lightgray"><font color="red">N</font></td>
        <td bgcolor="lightgray"><font color="red">N</font></td>
        <td bgcolor="lightgray"><font color="red">N</font></td>
        <td bgcolor="lightgray"><font color="red">N</font></td>
        <td bgcolor="lightgray"><font color="green">Y</font></td>
        <td bgcolor="lightgray"><font color="red">N</font></td>
        <%}else if(fdto.getAvail().equals("sat"))
         {       
         %>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="red">N</font></td>
         <td bgcolor="lightgray"><font color="green">Y</font></td>
        </tr>
        <%
           }
          }
         }            
       %>        
      </table>
     </td>
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
</html>