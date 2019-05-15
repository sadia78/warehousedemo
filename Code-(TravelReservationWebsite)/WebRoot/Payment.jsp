<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@page import="com.mas.dao.AccountDAO"%>
<%@page import="com.mas.dto.TransactionFormBean"%>

  <%
          
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
           var url="./ConfirmTickets";         
           xmlHttpp.open("GET", url , true);
           xmlHttpp.send(null);   
  }
 </script>
 </head>
	<body bgcolor="#ff0ffff">&nbsp;
	
	
	
		
					
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
                     <td>TransactionType</td>
                     <td>
                     <select name="ttype">
                  
                     <option value="OnlinePayment"  >OnlinePayment</option>
                     
                     </select>
                     </td>
                     </tr>
                     <tr>
                     <td>TransactionAmount</td>
                      <td>
                        <input type="text" name="tamount"/>
                        </td>
                      </tr>
                      
                      <td align="center"><a href="#" onclick="ConfirmTicket();" style="text-decoration: none">Confirm</a>&nbsp;   
      <a href="./BookAFlight.jsp" style="text-decoration: none">Cancel</a>
     </td>
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
		</table>
	</body>
</html>