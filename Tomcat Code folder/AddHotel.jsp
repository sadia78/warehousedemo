<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String user=(String)session.getAttribute("ownuser");
	if (user==null) {
		response.sendRedirect("/Logout.jsp");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <script language="JavaScript" type="text/javascript" src="./scripts/ts_picker.js"></script>
    <script type="text/javascript">
    
    function checkHotelName(hname){
      if(hname==""){
         alert("Hotel Name is required");
         return false;
      }
      var xmlHttp=null;
      try{
          if(window.XMLHttpRequest){
            xmlHttp=new XMLHttpRequest();
          }
          else{
              xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
          }
         
      }catch(e){
        alert("Request object creation failed");
      }
       xmlHttp.onreadystatechange=function(){
              if(xmlHttp.readyState==4){
                document.getElementById("hotel").innerHTML = xmlHttp.responseText;
                xmlHttp.responseText=null;
                xmlHttp.abort();
              }
          }
       var url="./CheckHotelName?hname="+hname;
       xmlHttp.open("GET" , url , true);
       xmlHttp.send(null);
    }
    
     function checkHotel(hotels){
       if(""==document.forms.hotels.hname.value){
          alert("Please Enter Hotel name");
          document.forms.hotels.focus();
          return false;
       }
       if(""==document.forms.hotels.city.value){
         alert("City name is Required");
         document.forms.hotels.city.focus();
          return false;
       }
       if(""==document.forms.hotels.streat.value){
         alert("Please enter street name");
         document.forms.hotels.streat.focus();
         return false;
       }
       if(""==document.forms.hotels.charge.value){
         alert("Please Enter Charges per day");
         document.forms.hotels.charge.focus();
         return false;
       }
         if(""==document.forms.hotels.mobile.value){
         alert("Please Enter Mobile number");
         document.forms.hotels.mobile.focus();
         return false;
       }
        if(""==document.forms.hotels.country.value){
         alert("Please Enter country name");
         document.forms.hotels.country.focus();
         return false;
       }
       
     }
    </script>
  </head>
  
  <body> 
     <table width="980">
     <tr>
      <td align="center" height="200" width="980" valign="middle" colspan="2">
       <jsp:include page="/HomeHeader.jsp"></jsp:include>
      </td>
     </tr>
     <tr>
      <td width="830" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/AdminOptions.jsp"></jsp:include>
      </td>
      <td width="120" align="left" valign="bottom" bgcolor="skyblue">
        <font color="blue" size="4">
        <c:out value='${sessionScope.ownuser}'> </c:out>&nbsp;&nbsp; In</font>
      </td>
     </tr>
     <tr bgcolor="#b0c4de">
     <td width="800" align="center" valign="middle" height="200">   
     <form name="hotels" action="./AddNewHotel" onsubmit="return checkHotel(this);">
      <table width="600">
       <tr bgcolor="">
        <td colspan="2" align="center"><font color="yellow" size="5">Enter Hotels In Various Countries</font></td>
       </tr>
       <tr>
        <td colspan="2" align="center">
         <%if(request.getParameter("status")!=null)out.println(request.getParameter("status")); %>
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">Hotel&nbsp; Name</font>
        </td>
        <td>
          <input type="text" name="hname" id="hname" size="30" onblur="checkHotelName(this.value);"><div id="hotel"></div>
        </td>
       </tr>
       <tr >
        <td>
         <font size="4">City Name</font>
        </td>
        <td>
          <input type="text" name="city" id="city" size="30">
        </td>
       </tr>
       <tr>
        <td> 
         <font size="4">Street Name</font>
        </td>
        <td>
          <input type="text" name="street" id="street" size="30" >         
        </td>
        
       </tr>
         <tr>
        <td> 
         <font size="4">Country Name</font>
        </td>
        <td>
          <input type="text" name="country" id="country" size="30" >         
        </td>
        
       </tr>
       <tr>
        <td>
         <font size="4">Contact Number</font>
        </td>
        <td>
         <input type="text" name="mobile" size="30">
        </td>
       </tr>
        <tr>
        <td>
         <font size="4">RoomCapacity</font>
        </td>
        <td>
         <input type="text" name="rcapacity" ><font color="red" size="4"></font>
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">MinimumCharge</font>
        </td>
        <td>
         <input type="text" name="charge" ><font color="red" size="4">-$</font>
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">ACRoomCapacity</font>
        </td>
        <td>
         <input type="text" name="acrcapacity" ><font color="red" size="4"></font>
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">Charge</font>
        </td>
        <td>
         <input type="text" name="accharge" ><font color="red" size="4">-$</font>
        </td>
       </tr> <tr>
        <td>
         <font size="4">NonAcCapacity</font>
        </td>
        <td>
         <input type="text" name="nonacrcapacity" ><font color="red" size="4"></font>
        </td>
       </tr>
       <tr>
        <td>
         <font size="4">NonAcCharge</font>
        </td>
        <td>
         <input type="text" name="nonaccharge" ><font color="red" size="4">-$</font>
        </td>
       </tr>
       
        <tr>
        <td>
         <font size="4">HotelType</font>
        </td>
        <td>
          <select name="hoteltype">
                     <option value="">--SELECT--</option>
                     <option value="5-star"  >5-star</option>
                     <option value="4-star"  >4-star</option>
                     <option value="3-star"  >3-star</option>
                     <option value="2-star"  >2-star</option>
                     <option value="1-star"  >1-star</option>
                     
                     </select>
        </td>
       </tr>
       
       <tr>
        <td align="center" colspan="2">
         <input type="submit" value="AddHotel" >
        </td>
       </tr>
      </table>
     </form>
     </td>
     <td>
      <img src="./images/Lobby.jpg" width="260" height="220">
     </td>
     <tr>
      <td width="980" height="50" align="center" valign="bottom" colspan="2">
       <jsp:include page="/Footer.jsp"></jsp:include>
      </td>
     </tr>
    </table>
  </body>
</html>
