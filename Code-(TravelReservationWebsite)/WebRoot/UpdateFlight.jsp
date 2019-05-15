<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript">
     function getFlightDetails(fnumber)
     {
       if(fnumber==""){
        alert("choose flight number");
        return false;
       }
       var flag=confirm("press OK to continue");
       if(flag==true)
       {
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
                        document.getElementById("update").innerHTML = xmlHttp.responseText;
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
<%--           var url="./UpdateFlightDetails?fnumber="+fnumber;--%>
           var url="GetFlightDetails.jsp?fnumber="+fnumber;
           xmlHttp.open("GET",url,true);
           xmlHttp.send(null); 
      }else{
        return false;
      }
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
      <td width="830" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp;&nbsp;&nbsp; In</font>
      </td>
     </tr>
    <tr><td height="200" valign="top" align="center" colspan="2">   
    <table align="center" background="./images/updateflight.JPG" width="700" height="150">
    <tr>
     <td align="center" valign="top">
      <font color="red" size="5">UpdateFlightDetails</font>
     </td>
    </tr>
    <tr>
     <td align="center" valign="top">
      <font color="green" size="4">ChooseFlightNumber</font>
      <select name="fnumber" id="fnumber" onchange="getFlightDetails(this.value);">
       <option value="">-select-</option>
       <c:forEach var="fnumbers" items="${fnumbers}">
        <option value="${fnumbers }">${fnumbers }</option>
       </c:forEach>
      </select>
     </td>
    </tr>
    <%if(request.getParameter("status")!=null){ %>
    <tr>
     <td align="center">
     <%out.print(request.getParameter("status")); %>
     </td>
    </tr>
    <%} %>
   </table>
   <div id="update"></div>
   </td></tr>
   <tr>
     <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
