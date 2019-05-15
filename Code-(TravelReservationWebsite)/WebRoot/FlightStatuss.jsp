<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
 ArrayList<ServicesDTO> slist=null;
 try{
     slist=new MasterDAO().getServices();
 }catch(Exception e){
    e.printStackTrace();
 }
 request.setAttribute("services",slist);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript">
     function getFlightStatus()
     {
       var from=document.getElementById("sfrom").value;
       var to=document.getElementById("sto").value;
       if(from==""){
        alert("choose flight from where");
        return false;
       }
       if(to==""){
        alert("choose flight to where");
        return false;
       }          
        var xmlHttp=null;
        try{
          if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
          }else{
               xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
          }         
        }catch(e){
           alert("xmlHttp object creation failed");
        }
         xmlHttp.onreadystatechange=function()
                   {
                     if(xmlHttp.readyState==4){
                        document.getElementById("status").innerHTML = xmlHttp.responseText;
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }          
           var url="FlightStatusReport.jsp?from="+from+"&to="+to;
           xmlHttp.open("GET",url,true);
           xmlHttp.send(null);      
    }  
    </script>
  </head>  
  <body>
   <table width="980">
     <tr>
      <td align="center" height="210" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="830" height="30" align="left" bgcolor="skyblue" >
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
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
												Flight</a>
											<br>
										</td>
									</tr>
									
    <tr>
    <td height="50" valign="top" align="center" colspan="2">   
    <table align="center"  width="700" height="150">
    <tr>
     <td  valign="top">
      <font color="red">=> </font><font color="" size="2" face=verdana>Choose Source and Destination to Know flight status</font>
     </td>
    </tr>
    <tr>
     <td align="left" valign="top">
      <font color="" size="4" face=verdana >From &nbsp;&nbsp; </font>
      <select name="sfrom" id="sfrom" onchange=";">
       <option value="">-select-</option>
       <c:forEach var="services" items="${services}">
        <option value="${services.sfrom }">${services.sfrom }</option>
       </c:forEach>
      </select>
     </td>
    </tr>   
    <tr>
     <td align="left" valign="top">
      <font color="" size="4" face=verdana >To &nbsp; &nbsp; &nbsp;&nbsp; </font>
      <select name="sto" id="sto" onchange="getFlightDetails(this.value);">
       <option value="">-select-</option>
       <c:forEach var="services" items="${services}">
        <option value="${services.sto }">${services.sto }</option>
       </c:forEach>
     </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="#" onclick="getFlightStatus()" style="text-decoration: none">Click</a>
     </td>
    </tr>   
   </table>   
   </td>
   </tr>
   <tr>
    <td colspan="2">
     <div id="status"></div>
    </td>
   </tr>
   <tr>
     <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
