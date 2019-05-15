<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.mas.dto.JourneyDTO"%>
<%@page import="com.mas.dao.UserDAO"%>
<%@page import="com.mas.dao.AccountDAO"%>
<%@page import="com.mas.dto.TransactionFormBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
 JourneyDTO jdto=(JourneyDTO)session.getAttribute("flightdto");
  double miles=0;
 try{
     miles=miles+new UserDAO().getMyPoints((String)session.getAttribute("ownuser"));
 }catch(Exception e)
 {
   e.printStackTrace();
 }
 
 %>
   <%
   
         float totalammout=(Float)request.getAttribute("totalcharge");
         
         float ammout=totalammout-(totalammout*20)/100;
         
         int toatalperson=(Integer)request.getAttribute("person");
          
          String login=(String)session.getAttribute("loginuser");
          
           %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <script type="text/javascript">
  function ConfirmTicket()
  {
    var miles=document.getElementById("miles").value;
    var xmlHttpp=null;
          try{
              if(window.XMLHttpRequest){
                xmlHttpp=new XMLHttpRequest();
            }else{
                 xmlHttpp=new ActiveXObject("Microsoft.XMLHTTP");
            }          
        }catch(e){
           alert("xmlHttp object creation failed");
        }   
                   xmlHttpp.onreadystatechange=function()
                   {  
                     if(xmlHttpp.readyState==4){                       
                        document.getElementById("result").innerHTML = xmlHttpp.responseText;                      
                        xmlHttpp.responseText=null;
                        xmlHttpp.abort();
                        }
                    }
          var url="./ConfirmTickets?miles="+miles;    
           xmlHttpp.open("GET", url , true);
           xmlHttpp.send(null);   
  }
 </script>
 </head>
 <body>
 <form action="./HotelPaymentAction">
   <table width="700" align="center">
    <tr bgcolor="#FFFFF">
     
    </tr>
   
    <tr bgcolor="#FFFFF">
    
    </tr>
    
    
    
    
    <tr>
    <td>
     <center><font size="2" face="verdana">Online Payment</font><br>
     
     
      <%
           
            AccountDAO loanDAO=new AccountDAO();
            
            Vector<TransactionFormBean> loanList=loanDAO.getAccno(login);
            System.out.println("in jsp vector obj ...is........"+loanList);
            System.out.println("in jsp vector obj ...is........"+loanList+"and size is ........"+loanList.size());  
           
          
         Iterator it=loanList.listIterator();

 while(it.hasNext())
 {%><%
 
 TransactionFormBean tfb=(TransactionFormBean)it.next();
  %>
			<tr>
			<td><font size="4">AccountNo</font></td><td> <input type="text" name="accno" value="<%=tfb.getAccno() %>" readonly="readonly"> </td>
			</tr>
			 <%} %>
			 <tr>
                     <td>TransactionType</td>
                     <td>
                     <select name="ttype">
                     <option value="">--SELECT--</option>
                     <option value="OnlinePayment"  >OnlinePayment</option>
                     
                     </select>
                     </td>
                     </tr>
                      <tr>
                     <td>totalPerson</td>
                      <td>
                        <input type="text" name="person" value="<%=toatalperson %>" readonly="readonly" />
                        </td>
                      </tr>
                       <tr>
                     <td>TotalAmount</td>
                      <td>
                        <input type="text" name="totalamount" value="<%=totalammout %>" readonly="readonly" />
                        </td>
                      </tr>
                    <tr>
                     <td>20% discount Ammount</td>
                      <td>
                        <input type="text" name="tamount" value="<%=ammout %>" readonly="readonly" />
                        </td>
                      </tr>
     
     
    
     
     
    
    <tr><td align="center"><input type="submit" value="Confirm">  </td> </tr>
   </table></form>
 </body>
</html>