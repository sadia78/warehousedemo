
<%@page import="java.util.ArrayList"%>
<%@page import="com.mas.dto.FlightDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
   ArrayList<FlightDTO> flist=new ArrayList<FlightDTO>();
  try{
     flist =new MasterDAO().getFlightNumbers();     
    }catch(Exception e){
      e.printStackTrace();
    }  
    request.setAttribute("flist",flist);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <script language="JavaScript" type="text/javascript" src="./scripts/ts_picker.js"></script>
    <script type="text/javascript">
    
     function getFlightName(fnum)
     {
       alert(fnum);
       if(fnum==""){
         alert("Please choose Flight number to serve");
        }
      var xmlHttp=null;
      try{
          if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
          }
          else{
              xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
          }
         
      }catch(e){
        alert("Request object creation failed");
      }
        xmlHttp.onreadystatechange=function()
        {
           if(xmlHttp.readyState==4){
                document.getElementById("fname").innerHTML = xmlHttp.responseText;
                xmlHttp.responseText=null;
                xmlHttp.abort();
              }
          }
       var url="./GetFlightName?fnumber="+fnum;
       xmlHttp.open("GET" , url , true);
       xmlHttp.send(null);
    }
    
     function checkServices(service)
     {
       if(""==document.forms.service.sfrom.value){
          alert("Please Eenter service from");
          document.forms.service.sfrom.focus();
          return false;
       }
       if(""==document.forms.service.sto.value){
         alert("please enter service to");
         document.forms.service.sto.focus();
          return false;
       }
       if(""==document.forms.service.distance.value){
         alert("please enter distance");
         document.forms.service.distance.focus();
          return false;
       }                      
     }
     
    </script>
  </head>
  
  <body> 
     <table width="980">
     <tr>
      <td align="center" height="200" width="980" valign="middle" colspan="2">
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
     <td width="800" align="center" valign="middle" height="200">   
     <form name="service" action="./AddNewService" onsubmit="return checkServices(this);">
      <table width="700">
       <tr bgcolor="#">
        <td colspan="2" align="center"><font color="yellow" size="5">Enter Services&nbsp; provided By Airlines</font></td>
       </tr>
       <tr>
        <td colspan="2" align="center">
         <%if(request.getParameter("status")!=null)out.println(request.getParameter("status")); %>
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">EnterService From</font>
        </td>
        <td>
          <input type="text" name="sfrom" id="sfrom" size="30">
        </td>
       </tr>
       <tr bgcolor="#f0ffff">
        <td>
         <font size="4">Enter Service To</font>
        </td>
        <td>
          <input type="text" name="sto" id="sto" size="30">
        </td>
       </tr>
       <tr>
        <td>
         <font color="#" size="4">Choose Flight Number</font>
        </td>
        <td>
         <select name="fnumber" id="fnumber" onchange="getFlightName(this.value);">
          <option value="">--Select--</option>
          <c:forEach var="flist" items="${flist}">
            <option value='${flist.fnum }'>${flist.fnum}</option>
          </c:forEach>
         </select><div id="fname"></div>
        </td>
       </tr>
       <tr bgcolor="#f0ffff">
        <td> 
         <font size="4">BusinessClass Fare</font>       
         <select name="bfare">
          <c:forEach var="i" begin="100" end="1500" step="50">
            <option value="${i }">${i }</option>
          </c:forEach>
         </select><font color="red" size="4">$</font>
        </td>              
        <td> 
         <font size="4">EconomyClass Fare</font>      
         <select name="efare">
          <c:forEach var="i" begin="100" end="1500" step="50">
            <option value="${i }">${i }</option>
          </c:forEach>
         </select><font color="red" size="4">$</font>
        </td>        
       </tr>
       <tr>
        <td><font color="red" size="4">DepartureTime</font>
         <select name="dhr" id="dhr">
           <c:forEach var="i" begin="01" end="24" step="1">
            <option value="${i }">${i }</option>
           </c:forEach>
         </select><font color="red">Hrs</font>
         <select name="dmin" id="dmin">
           <c:forEach var="i" begin="00" end="59" step="1">
            <option value="${i }">${i }</option>
           </c:forEach>
         </select><font color="red">mins</font>       
        </td>
        <td><font color="red" size="4">ArrivalTime</font>
         <select name="ahr" id="ahr">
           <c:forEach var="i" begin="01" end="24" step="1">
            <option value="${i }">${i }</option>
           </c:forEach>
         </select><font color="red">Hrs</font>
         <select name="amin" id="amin">
           <c:forEach var="i" begin="00" end="59" step="1">
            <option value="${i }">${i }</option>
           </c:forEach>
         </select><font color="red">mins</font>       
        </td>
       </tr> 
        <tr bgcolor="#f0ffff">
        <td>
         <font size="4">Enter Distance Between Two points</font>
        </td>
        <td>
          <input type="text" name="distance" id="distance" size="30">
        </td>
       </tr>     
       <tr>
        <td align="center" colspan="2">
         <input type="submit" value="Commit">
        </td>
       </tr>
      </table>
     </form>
     </td>
     <td>
      <img src="./images/service.jpg" width="230" height="220">
     </td>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
