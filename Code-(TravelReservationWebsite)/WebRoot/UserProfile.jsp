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
	
   
	 function checkPointsForm(){
	       var from=document.getElementById("from").value;
	       var to=document.getElementById("to").value;
	       if(from == '' || to == '' ){
	        alert("From and To required");
	        return false;
	       }
	  }
	
  </script>
  <script type="text/javascript">
    function checkForm(profile){
     if(""==document.forms.profile.surname.value){
       alert("Name fields cant be empty");
       document.forms.profile.surname.focus();
     }
       if(""==document.forms.profile.fullname.value){
       alert("Name fields cant be empty");
       document.forms.profile.fullname.focus();
     }
       if(""==document.forms.profile.gender.value){
       alert("Gender field cant be empty");
       document.forms.profile.gender.focus();
     }
       if(""==document.forms.profile.email.value){
       alert("Email field cant be empty");
       document.forms.profile.email.focus();
     }
       if(""==document.forms.profile.mobile.value){
       alert("Mobile field cant be empty");
       document.forms.profile.mobile.focus();
     }
       if(""==document.forms.profile.city.value){
       alert("City field cant be empty");
       document.forms.profile.city.focus();
     }
      if(""==document.forms.profile.state.value){
       alert("State field cant be empty");
       document.forms.profile.state.focus();
     }
       if(""==document.forms.profile.country.value){
       alert("Country field cant be empty");
       document.forms.profile.country.focus();
     }     
       if(""==document.forms.profile.pin.value){
       alert("State field cant be empty");
       document.forms.profile.pin.focus();
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
      <td width="870" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td></tr>
			<tr>
				<td align="center"> <font color="#003355" size="4">View Profile</font></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="pink"></td>
			</tr>
			<tr>
										<td bgcolor="lightgray">
										</td>
									</tr>
									<tr>
										<td>
											<div id="result">
												<form action="./UpdateUserProfile" name="profile"
													onsubmit="return checkForm(this);">
													<table width="500" align="center">
														<tr bgcolor="pink">
															<td>
																<font face="verdana" size="2">Personal Details</font>
															</td>
														</tr>
														<tr>
															<td>
																Your Name
																<select name="title" id="title">
																	<option value=${user.title }>
																		${user.title }
																	</option>
																	<option value="mr">
																		MR
																	</option>
																	<option value="mrs">
																		MRS
																	</option>
																	<option value="miss">
																		MISS
																	</option>
																</select>
																<input type="text" name="surname" id="surname"
																	value="${user.surname }">
																<input type="text" value="${user.fullname }"
																	id="fullname" name="fullname">
															</td>
														</tr>
														<tr>
															<td>
																Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<select name="gender" id=gender>
																	<option value="${user.gender }">
																		${user.gender }
																	</option>
																	<option value="male">
																		Male
																	</option>
																	<option value="female">
																		Female
																	</option>
																</select>
															</td>
														</tr>
														<tr>
															<td>
																Mail -ID&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="text" value="${user.email }" name="email"
																	id="email">
															</td>
														</tr>
														<tr>
															<td>
																Mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="text" name="mobile" id="mobile"
																	value="${user.mobile }">
															</td>
														</tr>
														<tr bgcolor="pink">
															<td>
																<font face="verdana" size="2"> Address Details </font>
															</td>
														</tr>
														<tr>
															<td>
																City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="text" name="city" value="${user.city }">
															</td>
														</tr>
														<tr>
															<td>
																State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;
																<input type="text" value="${user.state }" name="state"
																	id="state">
															</td>
														</tr>
														<tr>
															<td>
																Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="text" value="${user.country }"
																	name="country" id="country">
															</td>
														</tr>
														<tr>
															<td>
																Pin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="text" name="pin" id="pin"
																	value="${user.pin }">
															</td>
														</tr>
														<tr>
															<td align="center">
																<input type="submit" value="Update">
																&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
																<a href="./UserHome.jsp">Back</a>
															</td>
														</tr>
													</table>
												</form>
											</div>
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