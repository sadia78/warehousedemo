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
	function ChangePass()
    {     
          var xmlHttpass=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpass=new XMLHttpRequest();
            }else{
                 xmlHttpass=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpass.onreadystatechange=function()
                   {  
                     if(xmlHttpass.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpass.responseText;                      
                        xmlHttpass.responseText=null;
                        xmlHttpass.abort();
                        }
                    }
           var url="./ChangePassword.jsp"         
           xmlHttpass.open("GET", url , true);
           xmlHttpass.send(null);   
    }
    function UpdateNewPass()
    {   
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
     var xmlHttpup=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpup=new XMLHttpRequest();
            }else{
                 xmlHttpup=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpup.onreadystatechange=function()
                   {  
                     if(xmlHttpup.readyState==4){                       
                        document.getElementById("success").innerHTML = xmlHttpup.responseText;                      
                        xmlHttpup.responseText=null;
                        xmlHttpup.abort();
                        }
                    }
           var url="./ChangeUserPass?pwd="+pwd;         
           xmlHttpup.open("GET", url , true);
           xmlHttpup.send(null);   
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
										<td bgcolor="lightgray">
										</td>
									</tr>
									<tr>
										<td>
											<div id="result">
												<table width="600" align="center" border="1">
													<tr>
														<td colspan="5" bgcolor="#fffff" align="left">
															<font color="#59ff0ff" size="5">INBOX</font>
														</td>
													</tr>
													<tr bgcolor="">
														<td>
															<font color="blue" size="4">From</font>
														</td>
														<td width="100">
															<font color="blue" size="4">Subject</font>
														</td>
														<td width="250">
															<font color="blue" size="4">Body</font>
														</td>
														<td>
															<font color="blue" size="4">DateOfSend</font>
														</td>
														<td>
														   <font color="blue" size="4">Delete</font>
														</td>
													</tr>
													<c:forEach var="mails" items="${mails}">
														<tr>
															<td>
																${mails.sender}
															</td>
															<td>
																${mails.subject}
															</td>
															<td style="overflow: scroll; width: 100; height: 60;">
																${mails.body }
															</td>
															<td>
																${mails.dos}
															</td>
															<td>
																<a href="./DeleteFlyerMail?mid=${mails.mid }"
																 style="text-decoration: none;">delete</a>
															</td>															
		     										     </tr>
													</c:forEach>
												</table>
											</div>
										</td>
									</tr>
								</table>
							
				<td colspan="3" width="960">
					<jsp:include page="./Footer.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</body>
</html>