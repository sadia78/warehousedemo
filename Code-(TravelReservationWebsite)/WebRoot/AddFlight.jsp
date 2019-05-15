<%@ page isThreadSafe="true"  %>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mas.dao.MasterDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mas.dto.ServicesDTO" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
ArrayList<ServicesDTO> slist=new MasterDAO().getServices();
request.setAttribute("services",slist);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <head>
   <script type="text/javascript">
    function getXmlHttpObj(){
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
        return xmlHttp;
    }
    function CheckFnumber(fnum)
    {
         if(fnum=="")
         {
          alert("please enter flight number");
          return false;
         }       
                   var xmlHttp=getXmlHttpObj();
                   xmlHttp.onreadystatechange=function()
                   {
                     if(xmlHttp.readyState==4){
                        document.getElementById("fnum").innerHTML = xmlHttp.responseText;
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
           var url="./CheckFnumber?fnum="+fnum;
          
           xmlHttp.open("GET",url,true);
           xmlHttp.send(null);   
    }
    function CheckFname(fname){
       if(fname==""){
          alert("please enter flight name");
          return false;
         }
          var xmlHttp=getXmlHttpObj();        
                   xmlHttp.onreadystatechange=function()
                   {  
                     if(xmlHttp.readyState==4){                       
                        document.getElementById("exist").innerHTML = xmlHttp.responseText;                      
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
           var url="./CheckFname?fname="+fname;
          
           xmlHttp.open("GET", url , true);
           xmlHttp.send(null);   
    }
    
  
    function formvalidator(addflight){
      if(""==document.forms.addflight.fnumber.value){
         alert("please enter flight number");
         document.forms.addflight.fnumber.focus();
         return false;
      }
      if(""==document.forms.addflight.fname.value){
         alert("please enter flight name");
         document.forms.addflight.fname.focus();
         return false;
      }     
       if(""==document.forms.addflight.capacity.value){
         alert("please enter  distance");
         document.forms.addflight.capacity.focus();
         return false;
      }
    }
    
   </script>

</head>  
  <body>
   <table width="980">
     <tr>
      <td align="center" height="220" width="980" valign="middle" colspan="2">
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
      <td colspan="2" align="center" valign="middle" width="980" height="230">
       <form action="./AddFlight" method="get" name="addflight" onsubmit="return formvalidator(this);">
        <table align="center" width="800">
         <tr bgcolor="lightgray">
          <td width="770" colspan="2" align="center">
            <font color="red" size="5">Enter Flight Details </font>
          </td>
         </tr>
         <tr><td colspan="2" align="center">
          <%if(request.getParameter("status")!=null){out.println(request.getParameter("status"));} %>
          </td> </tr>
         <tr>
          <td>
           <font color="green" size="4">EnterFlightNumber &nbsp;&nbsp;</font>
           <input type="text" id="fnumber" name="fnumber"  onblur="CheckFnumber(this.value);"><div id="fnum"></div>       
          </td>
          <td align="left">
           <font color="green" size="4">EnterFlightName</font>
           <input type="text" id="fname" name="fname" onblur="CheckFname(this.value);">
            <div id="exist"></div>
          </td>
         </tr>
        
         <tr>
          <td colspan="2">
           <font color="green" size="4">Flight Capacity</font> &nbsp; &nbsp; 
           &nbsp; &nbsp; &nbsp;&nbsp; 
           <input type="text" id="capacity" name="capacity" maxlength="3">
          </td>        
         </tr>
         <tr>
           <td colspan="2">
           <font color="green" size="4">Select days on which Flight Available</font>
            &nbsp; 
           <select id="avail" name="avail" size="4" multiple="multiple">           
            <option value="sun">Sunday</option>
            <option value="mon">Monday</option>
            <option value="tue">Tuesday</option>
            <option value="wed">Wednesday</option>
            <option value="thu">Thursday</option>
            <option value="fri">Friday</option>
            <option value="sat">Saturday</option>
           </select>
          </td>
         </tr>
         <tr>
          <td colspan="2" width="770" align="left">
           <div id="div"></div>
          </td>
         </tr>
         <tr>
         <td align="center" colspan="2">
          <input type="submit" value="AddFlight">
         </td></tr>
        </table>
       </form>
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
