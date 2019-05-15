<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@page import="com.mas.dao.AccountDAO"%>
<%@page import="com.mas.dto.TransactionFormBean"%>

  <%
          
          String login=(String)session.getAttribute("loginuser");
          
           %>
           
             <%
   
         float totalammout=(Float)request.getAttribute("totalcharge");
         
         float ammout=totalammout-(totalammout*20)/100;
         
         int toatalperson=(Integer)request.getAttribute("person");
          
         String jdate=(String)request.getAttribute("jdate");
         String rdate=(String)request.getAttribute("rdate");
         
          
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
           var url="./ConfirmHotel";         
           xmlHttpp.open("GET", url , true);
           xmlHttpp.send(null);   
  }
 </script>
 </head>
	<body bgcolor="#ff0ffff">&nbsp;
	<form action="./HotelPaymentAction">
	<table width="960">
			<tr>
				<td colspan="3">
					<jsp:include page="./FlyerHeader.jsp"></jsp:include>
				</td>
				
			</tr>
			 <tr>
      <td width="900" height="30" align="left" bgcolor="skyblue">
       <jsp:include page="/UserOptions.jsp"></jsp:include>
      </td>
			<tr>
				<td colspan="3"></td>
			</tr>
			
							
    <td>
     <center><font size="2" face="verdana">Online Payment</font><br>
     
      <table width="300" align="center" height="234">
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
                     <td><font size="4">TransactionType</td>
                     <td>
                     <select name="ttype">
                    
                     <option value="OnlinePayment"  >OnlinePayment</option>
                     
                     </select>
                     </td>
                     </tr>
                      <tr>
                     <td><font size="4">TotalPerson</font></td>
                      <td>
                        <input type="text" name="person" value="<%=toatalperson %>" readonly="readonly" />
                        </td>
                      </tr>
                       <tr>
                     <td><font size="4">TotalAmount</font></td>
                      <td>
                        <input type="text" name="totalamount" value="<%=totalammout %>" readonly="readonly" />
                        </td>
                      </tr>
                    <tr>
                     <td><font size="4">20% discount Amount</font></td>
                      <td>
                        <input type="text" name="tamount" value="<%=ammout %>" readonly="readonly" />
                        </td>
                      </tr>
     
     <input type="hidden" name="jdate" value="<%=jdate %>"  />
     <input type="hidden" name="rdate" value="<%=rdate %>" />
    
                       <tr><td align="center"><input type="submit" value="Confirm">  </td>
                       <td><a href="./BookAHotel.jsp" style="text-decoration: none">Cancel</a></td>
                        </tr>
      
    
			</table>
			
			
			
			
			
			
			
   
    
    
  
 </br>
					</br>
					</br>
					</br>
					
				<table><tr>
				<td colspan="3" width="960">
					<jsp:include page="./Footer.jsp"></jsp:include>
				</td>
			</tr>
		</table></form>
	</body>
</html>