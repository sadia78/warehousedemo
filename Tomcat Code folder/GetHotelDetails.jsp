<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mas.dto.StatusDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@page import="java.lang.String"%>

<%
	String user = (String) session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>

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
	       var xmlHttpcp=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttpcp=new XMLHttpRequest();
            }else{
                 xmlHttpcp=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttpcp.onreadystatechange=function()
                 {  
                    if(xmlHttpcp.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttpcp.responseText;                      
                    xmlHttpcp.responseText=null;
                    xmlHttpcp.abort();
                     }
                  }
           var url="./HowManyPointsINeed?from="+from+"&to="+to;         
           xmlHttpcp.open("GET", url , true);
           xmlHttpcp.send(null);
           xmlHttpcp.abort();   
	  }
     function ChangePass()
    {     
          var xmlHttpf=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpf=new XMLHttpRequest();
            }else{
                 xmlHttpf=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpf.onreadystatechange=function()
                   {  
                     if(xmlHttpf.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpf.responseText;                      
                        xmlHttpf.responseText=null;
                        xmlHttpf.abort();
                        }
                    }
           var url="./ChangePassword.jsp"         
           xmlHttpf.open("GET", url , true);
           xmlHttpf.send(null);   
    }
    function UpdateNewPass()
    {
    alert("dskkldskjf");
    var uid=document.getElementById("userid").value;
    var pwd=document.getElementById("pwd").value;
    var newpwd=document.getElementById("newpwd").value;
    if(pwd==""){
      alert("please enter new password");
      document.forms.password.pwd.focus();
      return false;
    }
    if(pwd!=newpwd){
      alert("password not matched");
      document.forms.password.newpwd.focus();
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
                        document.getElementById("success").innerHTML = xmlHttp.responseText;                      
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
           var url="./ChangeUserPass?pwd="+pwd;         
           xmlHttp.open("GET", url , true);
           xmlHttp.send(null);   
    }
      function ShowPoints(){
	     var xmlHttpg=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttpg=new XMLHttpRequest();
            }else{
                 xmlHttpg=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttpg.onreadystatechange=function()
                 {  
                    if(xmlHttpg.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttpg.responseText;                      
                    xmlHttpg.responseText=null;
                    xmlHttpg.abort();
                     }
                  }
           var url="./ShowMyPoints";         
           xmlHttpg.open("GET", url , true);
           xmlHttpg.send(null); 
	  }
      function ChangePass()
    {     
          var xmlHttp2=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttp2=new XMLHttpRequest();
            }else{
                 xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttp2.onreadystatechange=function()
                   {  
                     if(xmlHttp2.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttp2.responseText;                      
                        xmlHttp2.responseText=null;
                        xmlHttp2.abort();
                        }
                    }
           var url="./ChangePassword.jsp"         
           xmlHttp2.open("GET", url , true);
           xmlHttp2.send(null);   
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
						
									<td width="770" valign="top" bgcolor="#fffff0" align="left">
										<table width="750">
											
											
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
													<div id="result" style="width: 850px;">
														<table align="left" style="width: 850px;">
															<tr>
																<td align="center">
																	<font size="4" face="verdana" color="#003366" s>Hotel
																		details </font>
																</td>
															</tr>
															<tr>
																<td style="width: 850px;">
																	<table align="center" style="width: 850px;" border="4" bordercolor="black">
																		<tr>
																			<td colspan="8">
																				
																			</td>
																		</tr>
																		<c:forEach var="journey" items="${journey}">
																			<tr bgcolor="#FFFFFF" bordercolor="white">
																			<td bordercolor="white">
																					<font size="2" face="verdana" color="red">CityName:</font>${journey.city
																					}
																				</td>
																				<td bordercolor="white">
																					<font size="2" face="verdana" color="red">HotelName:</font>${journey.hname
																					}
																				</td>
																				<td bordercolor="white">
																					<font size="2" face="verdana" color="red">HotelType:</font>${journey.hotelhype
																					}
																				</td>
																				
																				
																				<td bordercolor="white">
																					<font size="2" face="verdana" color="red">Available:</font>${journey.capacity
																					}
																				</td>
																				<td bordercolor="white">
																					<font size="2" face="verdana" color="red">AcRoom/day:</font>
																					<a
																						href='./ConfirmHotel.jsp?hnumber=${journey.hid }&hname=${journey.hname }&city=${journey.city }&amount=${journey.accharge }&htype=${journey.hotelhype}'
																						style="text-decoration: none">${journey.accharge}</a>
																					$
																				</td>
																				<td bordercolor="white">
																					<font size="2" face="verdana" color="red">NonAcRoom/day:</font>
																					<a
																						href='./ConfirmHotel.jsp?hnumber=${journey.hid }&hname=${journey.hname }&city=${journey.city }&amount=${journey.nonaccharge }&htype=${journey.hotelhype}'
																						style="text-decoration: none">${journey.nonaccharge
																						}</a>$
																				</td>
																			</tr>
																			
																		</c:forEach>
																	</table>
																</td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</table>
									</td>
									
								</tr>
							</table>
						<table>
						</BR></BR></BR></BR>
					<tr>
						<td width="960" colspan="3">
							<jsp:include page="./Footer.jsp"></jsp:include>
						</td>
					</tr>
				</table>
	</body>
</html>
