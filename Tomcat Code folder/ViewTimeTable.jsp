<%@ page isThreadSafe="true"  %>
<%@page import="com.mas.dto.FlightDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<html>
 <head>
  <script type="text/javascript">
  
  </script>
 </head>
  <body>  
      <table width="700" >
        <tr>
         <td colspan="8" bgcolor="#fffff" align="center">
          <font color="#59ff0ff" size="5">Total Flight Details</font>
         </td>
        </tr>
        <tr>
        <td><font color="blue" size="3">Flight</font></td>
        <td><font color="blue" size="3">F-Name</font></td>       
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
        ArrayList<FlightDTO> flist=new MasterDAO().getFlights();     
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
           <%=fdto.getFnum() %>
          </td>
          <td><%=fdto.getFname() %></td>
          <td><%=fdto.getCapacity() %></td>        
        <%  
         
          if(fdto.getAvail().equals("sun"))
          {
        %>
          <td bgcolor="#D3D3D3"><font color="#0BAF25" size="4">Y</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <%}else if(fdto.getAvail().equals("mon"))
          {
        %>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#0BAF25">Y</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
          <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <%}else if(fdto.getAvail().equals("tue"))
          {
         %>
           <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
           <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
           <td bgcolor="#D3D3D3"><font color="#0BAF25">Y</font></td>
           <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
           <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
           <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
           <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <%}else if(fdto.getAvail().equals("wed"))
        {
        %>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#0BAF25">Y</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <%}else if(fdto.getAvail().equals("thu"))
        {
        %>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#0BAF25">Y</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <%}else if(fdto.getAvail().equals("fri"))
        {
        %>
        <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <td bgcolor="#D3D3D3"><font color="#0BAF25">Y</font></td>
        <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
        <%}else if(fdto.getAvail().equals("sat"))
         {       
         %>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#FF0000">N</font></td>
         <td bgcolor="#D3D3D3"><font color="#0BAF25">Y</font></td>
        </tr>
        <%
           }
          }
         }            
       %>        
      </table>
</html>