<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.HotelDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String user=(String)session.getAttribute("ownuser");
	if(user.equals(null)){
		response.sendRedirect("/Logout.jsp");
	}
%>
<%
	ArrayList<HotelDTO> slist = null;
	try {
		slist = new MasterDAO().getHotelCity();
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
		
    int rday = 1;
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="JavaScript" type="text/javascript"
			src="scripts/ts_picker.js"></script>
		<script type="text/javascript">
	  
	  function checkDays()
	  {
	   var d=new Date();
	 
	   var cdate=d.getDate()+"-"+(d.getMonth()+1)+"-"+d.getFullYear();
	   alert("cdate:"+cdate+"a");
	   var doj=document.getElementById("doj").value;
	   doj=doj.trim();
	   alert("doj:"+doj+"a");
	   var dor=document.getElementById("dor").value;
	   dor=dor.trim();
	   alert("dor:"+dor+"a");
	   if(document.getElementById("journey").value == 'return')
	   {
	     if(dor < cdate && dor < doj)
	     {
	      alert("Please Choose valid return date");
	      return false;
	     }
	     else 
	     {
	      return true;
	     }
	   }else if(document.getElementById("journey").value == 'oneway')
	   {
	     if(doj < cdate)
	     {
	       alert("Please Choose valid Date of journey");
	       return false;
	     }
	     else
	     {
	     return true;
	     }
	   } else
	   {
	      alert("Please Choose valid return date");
	      return false;
	   }
	  }
	  
	  
	  
	  
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
            document.getElementById("dor").disabled=false;      
         }else if(jtype=="oneway"){
            document.getElementById("dor").disabled=true;
            
         }else
         {
             alert("please choose any one");
             return false;
          }
     }
<%--     document.getElementById("linkid").style.visibility = 'hidden';--%>
    function checkFields(){
      if(checkDays())
      {       
       return true;      
      }else
      {       
       return false;
      }
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
				
							<td width="700" bgcolor="#ff0ffff" align="left" valign="top">
								<table width="700">
									<tr>
										<td align="right">
											<font color="gray" size="4"> Welcome To <c:out
													value='${sessionScope.ownuser}'></c:out> </font>
										</td>
									</tr>
									
									
									<tr>
										<td bgcolor="lightgray">
										</td>
									</tr>
									<tr>
										<td>
											<div id="result">
												<form action="./GetHotelDetails" name="bookaflight"
													>
													<table align="center" background="images/bgg1.jpg" width="400" height="52">
														<tr>
															<td align="center" colspan="2">&nbsp;<font size="4" face="verdana" color="#003366">Select Hotel<br><br>&nbsp;</font>
															</td>
														</tr>
														<tr>
															<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																<font color="red"><b>CityName</b></font>
																<select name="city">
																	<option value="">
																		--Start Hotel --
																	</option>
																	<c:forEach var="services" items="${services}">
																		<option value="${services.city }">
																			${services.city }
																		</option>
																	</c:forEach>
																</select>
															</td>
															
														<tr>
															<td colspan="2"></td>
														</tr>
														<tr>
															<td colspan="2" align="center">
																<br>&nbsp;&nbsp;&nbsp; <input type="submit" name="submit"
																	value="GetHotelDetails">
															</td>
														</tr>
													</table>
												</form>
											</div>
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