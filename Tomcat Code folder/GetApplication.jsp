<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%String country=request.getParameter("country"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
     <script type="text/javascript">
     
     </script>
  </head>
  
  <body>
   <form action="./RegisterAction" method="post" name="register" onsubmit="return formValidation();">
    <table width="600">
     <tr bgcolor="lightgray">
      <td align="left" colspan="2">
       <font face=verdana size="4">Personal Details</font>
      </td>
     </tr>
     <tr>
      <td>
       Gender:<font color="red">* &nbsp; &nbsp;</font><select name="gender">
                                         <option value="male">Male</option>
                                         <option value="female">Female</option>
                                        </select>
      </td>
      <td>
       	Title:<font color="red">* &nbsp; &nbsp; &nbsp; &nbsp;</font><select name="title" >
       	                                 <option value="Mr">Mr</option>
       	                                 <option value="Miss">Miss</option>
       	                                 <option value="Mrs">Mrs</option>
       	                                </select>
      </td>
     </tr>
     <tr>
      <td>
       SurName:<font color="red">*</font><input type="text" name="surname" size="30">
      </td>
       <td>
       FullName:<font color="red">*</font><input type="text" name="fullname" size="30">
      </td>
     </tr>
     <tr>
      <td colspan="2">
       DateOfBirth:<font color="red">*</font>
       <input type="text" name="dob" readonly="readonly">
        <a href="javascript:show_calendar('document.register.dob', document.register.dob.value);">
              <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a>
      </td>
     </tr>
     <tr bgcolor="lightgray" >
      <td colspan="2">
      <font face=verdana size="4">Contact Details</font>
      </td>
     </tr>
     <tr>
      <td colspan="2">
       Email:<font color="red">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp; </font><input type="text" name="email" size="30">
      </td>
     </tr>
     <tr>
      <td colspan="2">
       Mobile Contact:<font color="red">*&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp; </font><input type="text" name="mobile" size="30">
      </td>
     </tr> 
     
     
     
     <tr bgcolor="lightgray" >
      <td colspan="2">
      <font face=verdana size="4">Account Details</font>
      </td>
     </tr>
    <tr>
				<td>
					<font size="4">BankName</font>
				</td>
				<td>
					<select name="bank">
					<option>--Select One--</option>
					<option value="CITI">CITI</option>
					<option value="HDFCBank">HDFCBank</option>
					<option value="ICICIBank">ICICIBank</option>
					<option value="HSBCBank">HSBCBank</option>
					<option>   </option>
					
					</select>
					
				</td>
			</tr>
		
			<tr>
    <td ><font size="4">Account Type</font></td>
    <td><select name="acctype" onchange=" return showAmount();">
       <option value="" >Select</option>
      <option value="SavingAccount">SavingAccount</option>
      <option value="Current">Current</option>
      <option value="JointAccount">Joint Account</option>
   </select>
    </td>
  </tr>
 
  <tr>
    <td><font size="4">AccountBal</font></td>
    <td><input type="text" name="accbal" /></td>
  </tr>
      <tr bgcolor="lightgray" >
      <td colspan="2">
      <font face=verdana size="4">Address Details</font>
      </td>
     </tr>
     <tr>
      <td colspan="2">
       City:<font color="red">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </font><input type="text" name="city" size="30">
      </td>
     </tr>
     <tr>
      <td colspan="2"> 
       State:<font color="red">*&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        </font><input type="text" name="state" size="30">
      </td>
     </tr>
     <tr>
      <td colspan="2"> 
       Country:<font color="red">*&nbsp;&nbsp;  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;  </font><input type="text" value="<%=country %>" name="country" size="30" readonly="readonly">
      </td>
     </tr>
     <tr>
     <td colspan="2"> 
       Pin:<font color="red">*&nbsp;&nbsp;  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;  
        </font><input type="text" name="pin" size="30">
      </td>
      </tr>
       <tr bgcolor="lightgray" >
      <td colspan="2">
      <font face=verdana size="4">Authentication Details</font>
      </td>
     </tr>
     <tr>
      <td colspan="2">
       User ID:<font color="red">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;  
        </font><input type="text" name="userid" id="userid" size="30" onblur="checkUserId();"><div id="avail"></div>
      </td>
     </tr>
     <tr>
      <td colspan="2"> 
       Password:<font color="red">*&nbsp;&nbsp;  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
       &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;   
        </font><input type="password" name="pwd" size="30">
      </td>
     </tr>
     <tr>
      <td colspan="2"> 
       Re-Password:<font color="red">*&nbsp;&nbsp;  
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
       &nbsp;&nbsp;   
        </font><input type="password" name="mobile" size="30">
      </td>
     </tr>
     <tr>
     <td colspan="2">Security Question<font color="red">*</font><font size="3" face="Verdana"> &nbsp; &nbsp; &nbsp; 
     <select name="squest">
      <option value="select" selected="selected">--Select One---</option>
      <option value="What is your favorite pastime?">What is your favorite pastime?</option>
      <option value="Who your childhood hero?">Who your childhood hero?</option>
      <option value="What is the name of your first school?">What is the name of your first school?</option>
      <option value="Where did you meet your spouse?">Where did you meet your spouse?</option>
      <option value="What is your favorite sports team?">What is your favorite sports team?</option>
      <option value="What is your father middle name?">What is your father middle name?</option>
      <option value="What was your high school mascot?">What was your high school mascot?</option>
      <option value="What make was your first car or bike?">What make was your first car or bike?</option>
      <option value="What is your pet name?">What is your pet name?</option>
    </select></font></td>
      </tr>
      <tr>        
         <td colspan="2"> Security Answer<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
           <input type="text" name="ans" value="" size="30" maxlength="190"/></td>
      </tr>
      <tr>
         <td align="center" colspan="2">
          <input type="submit" value="submit">
         </td>
      </tr>
    </table>
    </form>
  </body>
</html>
