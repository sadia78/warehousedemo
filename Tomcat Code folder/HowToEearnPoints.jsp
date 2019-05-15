<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    function earnByFly()
    {        
                   var xmlHttp=getXmlHttpObj();
                   xmlHttp.onreadystatechange=function()
                   {
                     if(xmlHttp.readyState==4){
                        document.getElementById("fly").innerHTML = xmlHttp.responseText;
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
           var url="./EarnByFly.jsp"
           xmlHttp.open("GET",url,true);
           xmlHttp.send(null);   
    }
    function earnByStay()
    {        
                   var xmlHttp=getXmlHttpObj();
                   xmlHttp.onreadystatechange=function()
                   {
                     if(xmlHttp.readyState==4){
                        document.getElementById("fly").innerHTML = xmlHttp.responseText;
                        xmlHttp.responseText=null;
                        xmlHttp.abort();
                        }
                    }
           var url="EarnByStay.jsp"
           xmlHttp.open("GET",url,true);
           xmlHttp.send(null);   
    }
    </script>  
  </head> 
  <body>
    <table width="980">
     <tr>
      <td colspan="2" width="980" height="170" align="center" valign="top">
         <jsp:include page="./HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="980" height="30" align="left" bgcolor="skyblue" colspan="3">
       <jsp:include page="/FlyerOptions.jsp"></jsp:include>
      </td>     
     </tr>
     <tr>
      <td width="700" align="center" valign="top" height="200" colspan="1">
       <table width="600" align="center">
        <tr bgcolor="#fffff">
         <td align="left" colspan="2">
          <font color="red" size="4">How Can I Earn More Miles?</font>
         </td>
        </tr>
        <tr>
         <td width="300" height="40">
          <font size="4" color="red"> fly </font><br>
          <font face="verdana" size="2"> Travel the world with <a href="#" onclick="earnByFly();">Our airlines,</a> one world&reg; and our&nbsp; 
           other&nbsp; airline&nbsp; partners.&nbsp;&nbsp; 
           Calculate the number of points earned on Our flights. </font>
         </td> 
         <td width="300" height="40">
           <font size="4" color="red"> Stay</font><br> 
          <font face="verdana" size="2"> Earn points when you stay at various braches  of My&nbsp; 
           <a href="#" onclick="earnByStay();" > hotels</a> and&nbsp;  properties in&nbsp; various cities in world .. </font>
         </td>       
        </tr>
         <tr bgcolor="red">
         <td colspan="2"></td>
        </tr>
        <tr>
         <td width="690" colspan="2" bordercolor="yellow">
          <div id="fly"></div>
         </td>
        </tr>
       
       </table>
      </td>   
      <td align="left">
         <img src="./images/images.jpg" width="200" height="90"><br>
         <img src="./images/bedrooms_sherwood_lg.jpg" width="200" height="90"><br>
      </td>    
     </tr>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="3">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
