<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  </head> 
  <body>
    <table width="980" align="center">
     <tr>
      <td colspan="2" width="980" height="170" align="center" valign="top">
         <jsp:include page="./HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="980" height="30" align="left" bgcolor="skyblue" colspan="2">
       <jsp:include page="/FlyerOptions.jsp"></jsp:include>
      </td>     
     </tr>
     <tr>
      <td width="850" align="center" valign="top" height="200" colspan="0">
       <table width="800" align="center">
        <tr bgcolor="#fffff">
         <td align="center" colspan="2">
          <font color="red" size="4">How To Use My Points?</font>
         </td>
        </tr>
        <tr>
         <td width="200">
          <img width="200" height="100" src="./images/planes-gns.jpg">
         </td>
         <td width="600" height="40">
          <font size="4" color="#5890f"> Use your points to travel by my airline services </font><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <font face="verdana" size="2"> Use your points for a one way, return or multi-destination Classic Award flying our partner airlines.  
           Find out how many points you need after login.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            You can use points to book any available seat on any Our flight or Jetstar flight.</font> <br>
            <center><a href="./FlyerLogin.jsp">BookNow</a></center>
         </td>         
        </tr>
        <tr>
        <td>
          <img width="200" height="90" src="./images/BanquetHotels7.jpg">
         </td> 
         <td width="600" height="40">
           <font size="4" color="#5890f">Using your points You can Stay My Hotels and Braches across The World</font><br>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <font face="verdana" size="2"> Using  Your point you can stay any where in my Hotels and Branches
           with less cost and with lot of facilities.</font>
         </td>              
        </tr>
        <tr>
        <td>
          <img width="200" height="90" src="./images/shop1.jpg">
         </td> 
         <td>&nbsp; <font size="4" color="#5890f">You can redeem your&nbsp; points in my stores
         <br>&nbsp; &nbsp; &nbsp; &nbsp; </font><font face="verdana" size="2">You could redeem your
          points in My  Frequent Flyer stores on over 2,000 fantastic
          products  and gift cards. Plus, for most items you can use points or Points Plus Pay.
         </font>
         </td>
        </tr>             
       </table>
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
