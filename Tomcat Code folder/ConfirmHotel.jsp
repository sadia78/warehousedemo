<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.FlyersDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@page import="com.mas.dto.FlightDTO"%>
<%@page import="com.mas.dao.UserDAO"%>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@page import="com.mas.dto.HotelDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String user1=(String)session.getAttribute("ownuser");
	if (user1==null) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
 String user=(String)session.getAttribute("ownuser");
 int hnum=Integer.parseInt(request.getParameter("hnumber"));
 String hname=request.getParameter("hname");
 String city=request.getParameter("city");
 String htype=request.getParameter("htype");
 float amount=Float.parseFloat(request.getParameter("amount"));
 

   
  
  HotelDTO hdto=new HotelDTO();
   
   hdto.setHid(hnum);
   hdto.setHname(hname);
   hdto.setHotelhype(htype);
   hdto.setCity(city);
   hdto.setCharge(amount);
   
   session.setAttribute("hotel",hdto);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script> 
  <script type="text/javascript">
     
     
       var xmlHttpc=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpc=new XMLHttpRequest();
            }else{
                 xmlHttpc=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpc.onreadystatechange=function()
                   {  
                     if(xmlHttpc.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpc.responseText;                      
                        xmlHttpc.responseText=null;
                        xmlHttpc.abort();
                        }
                    }
           var url="./CheckMiles.jsp"        
           xmlHttpc.open("GET", url , true);
           xmlHttpc.send(null);   
    }
    function ConfirmTicket()
    {
    var miles=document.getElementById("miles").value;
    var xmlHttpd=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpd=new XMLHttpRequest();
            }else{
                 xmlHttpd=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpd.onreadystatechange=function()
                   {  
                     if(xmlHttpd.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpd.responseText;                      
                        xmlHttpd.responseText=null;
                        xmlHttpd.abort();
                        }
                    }
           var url="./ConfirmTickets?miles="+miles;         
           xmlHttpd.open("GET", url , true);
           xmlHttpd.send(null);   
     }
      function ShowPoints(){
	       var xmlHttpp=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttpp=new XMLHttpRequest();
            }else{
                 xmlHttpp=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttpp.onreadystatechange=function()
                 {  
                    if(xmlHttpp.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttpp.responseText;                      
                    xmlHttpp.responseText=null;
                    xmlHttpp.abort();
                     }
                  }
           var url="./ShowMyPoints";         
           xmlHttpp.open("GET", url , true);
           xmlHttpp.send(null); 
	  }
	 
	
  </script>
 </head>
  <body bgcolor="#ff0ffff">
   <table width="960">
			<tr>
				<td colspan="3">
					<jsp:include page="./FlyerHeader.jsp"></jsp:include>
				</td>
				
			</tr>
			 <tr>
      <td width="870" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="pink"></td>
			</tr>
    <tr>
     
        <td width="700" bgcolor="#ff0ffff" align="center" valign="top"> 
        <table width="700" align="center">
         <tr>
          <td align="right">
           <font color="gray" size="4">
             Welcome To <c:out value='${sessionScope.ownuser}'></c:out>
           </font>
          </td>
         </tr>
             
         <tr>
          <td align="center">
          
            
              								<form action="./BookHotelAction" name="bookaflight"
													>
													<table align="center" background="images/bgg1.jpg" width="500">
														<tr>
															<td align="center" colspan="2">
																<font size="4" face="verdana">Enter Your Hotel
																	Details </font>
															</td>
														</tr>
														
														<tr>
															<td colspan="2">
																<font color="red" size="4">How many days
																	</font> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
																<select name="day" id="day"
																	>
																	<option value="" selected="selected">
																		--select--
																	</option>
																	<option value="1">
																		1
																	</option>
																	<option value="2">
																		2
																	</option>
																	<option value="3">
																		3
																	</option>
																	<option value="4">
																		4
																	</option>
																	<option value="5">
																		5
																	</option>
																	<option value="6">
																		6
																	</option>
																	<option value="7">
																		7
																	</option>
																	<option value="8">
																		8
																	</option>
																	<option value="9">
																		9
																	</option>
																	<option value="10">
																		10
																	</option>
																</select>
															</td>
														</tr>
														<tr>
															<td colspan=>
																<font color="red" size="4">check-in date:</font>
															 </td>
															 <td>
															  <input type="text" id="doj" name="doj" readonly="readonly" >
															    <a id="dojhref" href="javascript:show_calendar('document.bookaflight.doj', document.bookaflight.doj.value);">
                                                                   <img src="images/cal.gif" alt="a"  width="18" height="18" border="0"/></a>						
															 </td>	
														</tr>
														<tr>
															<td colspan=>
																<font color="red" size="4">check-out date </font>
																
															</td>
															<td>
															  <input type="text" id="dor" name="dor" readonly="readonly" >
															    <a id="dorhref" href="javascript:show_calendar('document.bookaflight.dor', document.bookaflight.dor.value);">
                                                                   <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a>						
															 </td>
														</tr>
														<tr>
															<td align="center" colspan="3">
																<font color="gray" size="4">Adults</font>
																<select name="adults">
																	<c:forEach var="i" step="1" begin="1" end="5">
																		<option value='${i }'>
																			${i }
																		</option>
																	</c:forEach>&nbsp;&nbsp;&nbsp; 
																</select> <font color="gray" size="4">Children</font>
																<select name="children">
																	<c:forEach var="i" step="1" begin="0" end="5">
																		<option value='${i }'>
																			${i }
																		</option>
																	</c:forEach>
																</select>
															</td>
														</tr>
														<tr>
															<td bgcolor="white" colspan="2"></td>
														</tr>
														<tr>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td colspan="2" align="center">
																<input type="submit" name="submit"
																	value="Submit">
															</td>
														</tr>
													</table>
												</form>
               
               
               
               
               
               
               
               
               
               <br>
               
              
               
             </table>
   
          </td>
         </tr>
        </table>                                           
        </td>
       
       </tr>
      </table>
     <table>  
    <tr>
     <td colspan="3" width="960">
      <jsp:include page="./Footer.jsp"></jsp:include>
     </td>
    </tr>
   </table>
  </body>
</html>
