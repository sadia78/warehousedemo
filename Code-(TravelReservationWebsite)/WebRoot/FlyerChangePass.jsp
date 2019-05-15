<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String user = (String) session.getAttribute("ownuser");
	if (user.equals(null)) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
	ArrayList<ServicesDTO> slist = null;
	try {
		slist = new MasterDAO().getServices();
	} catch (Exception e) {
		e.printStackTrace();
	}
	request.setAttribute("services", slist);

	Calendar call = Calendar.getInstance();
	int day = call.getTime().getDate();
	int mon = call.getTime().getMonth() + 1;
	int year = call.getTime().getYear() + 1900;
	int min = call.getTime().getMinutes();
	int end = 30;
	if (mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8
			|| mon == 10 || mon == 12) {
		end = 31;
	} else if (mon == 2)
		end = 28;
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
     function ShowPoints(){
	       var xmlHttp4=null;
           try{
              if(window.XMLHttpRequest){
                xmlHttp4=new XMLHttpRequest();
            }else{
                 xmlHttp4=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                xmlHttp4.onreadystatechange=function()
                 {  
                    if(xmlHttp4.readyState==4){                       
                    document.getElementById("result").innerHTML = xmlHttp4.responseText;                      
                    xmlHttp4.responseText=null;
                    xmlHttp4.abort();
                     }
                  }
           var url="./ShowMyPoints";         
           xmlHttp4.open("GET", url , true);
           xmlHttp4.send(null); 
	  }
    
     function DisableRdate()
     {
        
         var jtype=document.getElementById("journey").value;          
         if(jtype=="return")
         {
          document.getElementById("rod").disabled=false;
          document.getElementById("rom").disabled=false;
          document.getElementById("roy").disabled=false;         
         }else if(jtype=="oneway"){
           document.getElementById("rod").disabled=true;
           document.getElementById("rom").disabled=true;
           document.getElementById("roy").disabled=true;
         }else
         {
             alert("please choose any one");
             return false;
          }
     }
<%--     document.getElementById("linkid").style.visibility = 'hidden';--%>
    function checkFields(){
      if(""==document.forms.bookaflight.from.value){
         alert("please specify starting point");
         document.forms.bookaflight.from.focus();
         return false;
      }
       if(""==document.forms.bookaflight.to.value){
         alert("please specify end point");
         document.forms.bookaflight.to.focus();
         return false;
      }
       if(""==document.forms.bookaflight.journey.value){
         alert("select journey type");
         document.forms.bookaflight.journey.focus();
         return false;
      }
    }    
	
    function  checkForm()
    {   
    var uid=document.getElementById("userid").value;
   
    var pwd=document.getElementById("pwd").value;
     alert(pwd);
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
												onmouseout="javascript:document.img1.src='images/icon-myaccount-trans.png' ">
												<img src="images/icon_myaccount1.gif" width="120"
													height="40" name="img1" border="0"> </a>
										</td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td>
											<a href="FlyerChangePass.jsp"
												onmousemove="javascript:document.img2.src='images/changepass_2.jpg'"
												onmouseout="javascript:document.img2.src='images/change_pass_on.gif'"">
												<img width="100" height="30" src="images/changepass_2.jpg"
													name="img2" border="0"> </a>
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
											<a href="./LogoutAction" style="text-decoration: none">Logout</a>
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
											<div id="result">
												<form action="./ChangeUserPass" name="password" onsubmit="return checkForm();">
													<table align="center">
														<tr>
															<td colspan="2" align="center">
																<font color="green" size="3" face="verdana">change
																	pass word page</font>
															</td>
														</tr>
														<tr>
														 <td colspan="2" align="center">
															<c:if test="${requestScope.status ne null }">
															 <c:out value="${requestScope.status}"></c:out>
															</c:if>
														 </td>
														</tr>
														<tr>
															<td colspan="2" align="center">
																<div id="success"></div>
															</td>
														</tr>
														<tr>
															<td>
																<font color="blue" size="3">Your id is</font>
															</td>
															<td>
																<input type="text" id="userid" name="userid"
																	value='${sessionScope.ownuser }' readonly="readonly">
															</td>
														</tr>
														<tr>
															<td>
																<font color="blue" size="3">Enter Your New
																	Password</font>
															</td>
															<td>
																<input type="password" id="pwd" name="pwd">
															</td>
														</tr>
														<tr>
															<td>
																<font color="blue" size="3">Re-Enter New Password</font>
															</td>
															<td>
																<input type="password" name="newpwd">
															</td>
														</tr>
														<tr>
															<td align="center" colspan="2">													
															 <input type="image" value="submit" src="images/changepass_button.png" width="100" height="30">			
															</td>
														</tr>
													</table>
												</form>
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