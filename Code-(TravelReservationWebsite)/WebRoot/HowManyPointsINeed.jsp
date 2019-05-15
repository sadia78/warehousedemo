<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.ServicesDTO"%>
<%@page import="com.mas.dao.MasterDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 ArrayList<ServicesDTO> slist=null;
    try{
        slist=new MasterDAO().getServices();
    }catch(Exception e){
     e.printStackTrace();
    }
    request.setAttribute("services",slist);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	 <script type="text/javascript">
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
	<body>
	
	  <form action="./HowManyPointsINeed" onsubmit="return checkPointsForm();">
		<table align="center">
			<tr>
				<td>
					<font color="gray">From</font>
					<select name="from" id="from">
						<option value="">
							--Start From --
						</option>
						<c:forEach var="services" items="${services}">
							<option value="${services.sfrom }">
								${services.sfrom }
							</option>
						</c:forEach>
					</select>
				</td>
				
				<td>
					<font color="gray" size="4">To</font>
					<select name="to" id="to">
						<option value="">
							--To Where --
						</option>
						<c:forEach var="services" items="${services}">
							<option value="${services.sto }">
								${services.sto }
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		  <tr>
		   <td colspan="2" align="center">
		     <input type="submit" value="get">
		   </td>
		  </tr>
		</table>
	</form>
	</body>
</html>
