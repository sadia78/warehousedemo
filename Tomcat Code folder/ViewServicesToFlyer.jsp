:<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user.equals(null)) {
%>
<jsp:forward page="/Logout.jsp"></jsp:forward>
<% }%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="JavaScript" type="text/javascript"
			src="scripts/ts_picker.js"></script>
		<script type="text/javascript">
     
    function HowManyPointNeed()
    {     
          var xmlHttp1=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttp1=new XMLHttpRequest();
            }else{
                 xmlHttp1=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttp1.onreadystatechange=function()
                   {  
                     if(xmlHttp1.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttp1.responseText;                      
                        xmlHttp1.responseText=null;
                        xmlHttp1.abort();
                        }
                    }
           var url="./HowManyPointsINeed.jsp"         
           xmlHttp1.open("GET", url , true);
           xmlHttp1.send(null);   
    }
   
    
      function CheckPointsNeed(){      
	       var from=document.getElementById("from").value;
	       var to=document.getElementById("to").value;
	       if(from=="" || to==""){
	         alert("please choose from and to");
	         return false;
	       }
	       var xmlHttp3=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttp3=new XMLHttpRequest();
            }else{
                 xmlHtt3p=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttp3.onreadystatechange=function()
                 {  
                    if(xmlHttp3.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttp3.responseText;                      
                    xmlHttp3.responseText=null;
                    xmlHttp3.abort();
                     }
                  }
           var url="./HowManyPointsINeed?from="+from+"&to="+to;         
           xmlHttp3.open("GET", url , true);
           xmlHttp3.send(null);   
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
      </td></tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="pink"></td>
			</tr>
			<tr>
				<td colspan="3" height="240" valign="top">
					<table width="960">
						<tr>
							<td width="100" valign="top">
								<table width="100">
									<tr>
										<td>
											<a href="./GetUserProfile"
												onmouseover="javascript:document.img1.src='images/icon_myaccount1.gif' "
												onmouseout="javascript:document.img1.src='images/icon-myaccount-trans.png' "
												onclick="ShowMyProfile();"> <img
													src="images/icon_myaccount1.gif" width="120" height="40"
													name="img1" border="0"> </a>
										</td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td>
											<a href="./FlyerChangePass.jsp"
												onmousemove="javascript:document.img2.src='images/changepass_2.jpg'"
												onmouseout="javascript:document.img2.src='images/change_pass_on.gif' "
												onclick="ChangePass();"> <img width="100" height="30"
													src="images/changepass_2.jpg" name="img2" border="0">
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="./ShowMyPoints"
												style="text-decoration: none">MyPoints</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="./GetUserMails" style="text-decoration: none">Inbox</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="./MailBox.jsp" style="text-decoration: none">ComposeMail</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="./ViewServicesToFlyer" style="text-decoration: none;">FlightDetails</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="./LogoutAction" style="text-decoration: none;">Logout</a>
										</td>
									</tr>
								</table>
							</td>
							<td width="700" bgcolor="#ff0ffff" align="left" valign="top">
								<table width="700">
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
												Flight Now</a>
											<br>
										</td>
									</tr>
									<tr>
										<td>
											<a href="#" style="font-weight: 150; text-decoration: none"
												onclick="HowManyPointNeed();">How many points do you
												need?</a>
										</td>
									</tr>
									<tr>
										<td bgcolor="lightgray">
										</td>
									</tr>
									<tr>
										<td>
										</td>
									</tr>
									<tr>
										<td align="center">
											<div id="result">
										     <table width="600" align="center" border="1" background="images/bgg1.jpg">
        <tr bgcolor="lightgray">
         <td align="center" colspan="8">
          <font color="red" size="2">AirLine Services</font>
         </td>
        </tr>
        <tr>
         <td>
          <font color="blue" size="2">Service From </font>
         </td>
          <td>
          <font color="blue" size="2">Service TO</font>
         </td>
         <td>
          <font color="blue" size="2">Flight</font>
         </td>
          <td >
          <font color="blue" size="2">B-Fare</font>
         </td>
          <td>
          <font color="blue" size="2">E-Fare</font>
         </td>
         <td>
          <font color="blue" size="2">Departs</font>
         </td>
         <td>
          <font color="blue" size="2">Arrives</font>
         </td>      
        </tr>
        <c:forEach var="services" items="${services}">
          <tr>
              <td>${services.sfrom }</td>
              <td>${services.sto }</td>
              <td>${services.fnum }</td>
              <td>${services.bfare }<font color=red>$</font></td>
              <td>${services.efare }<font color=red>$</font></td>
              <td>${services.dtime }</td>
              <td>${services.atime }</td>
              <td>
              </td>
          </tr>
        </c:forEach>       
       </table>
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td width="180">
								<marquee behavior="scroll" direction="up"
									style="padding: 200px 0pt;" scrollamount="10">
									<img width="140" src="images/flier2.jpg">
									<br>
									<img width="140" src="images/f7.jpg" height="140">
									<br>
									<img width="140" src="images/f3.gif">
								</marquee>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" width="960">
					<jsp:include page="./Footer.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</body>
</html>