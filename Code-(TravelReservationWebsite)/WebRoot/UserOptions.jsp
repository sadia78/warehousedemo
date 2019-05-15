<%@page session="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String user = (String) session.getAttribute("ownuser");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<style type="text/css">
.tab {
	font-family: arial, verdana, san-serif;
	font-size: 10px;
}

.asd {
	text-decoration: none;
	font-family: arial, verdana, san-serif;
	font-size: 10px;
	color: #4234ff;
}

/*****remove the list style****/
#nav {
	margin: 0;
	padding: 0;
	list-style: none;
}

/*****LI display inline *****/
#nav li {
	float: left;
	display: block;
	width: 80px;
	background: ;
	position: relative;
	z-index: 400;
	margin: 0 2px;
}

/*****parent menu*****/
#nav li a {
	display: block;
	padding: 8px 5px 0 5px;
	font-weight: 500;
	height: 23px;
	text-decoration: none;
	color:#fffffff;
	text-align: center;
	color: #ffeecc;
}

#nav li a:hover {
	color: #470020;
}

/* style for default selected value */
#nav a.selected {
	color: #4234ff;
}

/* submenu */
#nav ul {
	position: absolute;
	left: 0;
	display: none;
	margin: 0 0 0 -1px;
	padding: 0;
	list-style: none;
}

#nav ul li {
	width: 95px;
	float: left;
	border-top: 1px solid #fff;
}

/* display block will make the link fill the whole area of LI */
#nav ul a {
	display: block;
	height: 13px;
	padding: 7px 5px;
	color: #ff77
}

#nav ul a:hover {
	text-decoration: underline;
	padding-left: 13px;
}
</style>

		<script type="text/javascript" src="scripts/jquery.js">
</script>

		<script type="text/javascript">
$(document).ready(function () {
$('#nav li').hover(
function () {
//show its submenu
$('ul', this).slideDown(350);
},
function () {
//hide its submenu
$('ul', this).slideUp(350);
}
);
});
</script>
	</head>

	<body>
		<input type=hidden name=arav value="5*#*#*1*#*#*4*#*#*3*#*#*1*#*#*1">
		<ul id='nav'>
			<li>
				<a href='UserHome.jsp'>Home</a></li>
			
			<li>
				<a href='./FlightStatuss.jsp'>FlightsStatus</a>
				</li>
			
				
			<li><a href='#'> BookingDetails</a>			
				<ul>
					<li style='background-color: #b0c4de;'>
						<a  href='./GetBookingDetail'>FlightBookingDetails</a>
					</li>
									
					<li style='background-color: #b0c4de;'>
						<a href='./GetHotelBookingDetails'>HotelBookingDetails</a>
					</li>										
				</ul>			
				</li>
			
			
				<li><a href='#'>AccountDetails</a>			
				<ul>
					<li style='background-color: #b0c4de;'>
						<a  href='./GetBalanceAction'>View_Balance</a>
					</li>
						
						<li style='background-color: #b0c4de;'>
						<a  href='./GetTransactionDetails'>View_Transaction</a>
					</li>			
					<li style='background-color: #b0c4de;'>
						<a href='./Deposite.jsp'>Deposit</a>
					</li>	
														
				</ul></li>
			<li>
			
				<a href='#'>Mails</a>
				<ul>
					<li style='background-color: #b0c4de;'>
						<a  href='./MailBox.jsp'>ComposeMail</a>
					</li>
									
					<li style='background-color: #b0c4de;'>
						<a href='./GetUserMails'>Inbox</a>
					</li>										
				</ul></li>
				<li>
				<a href='./GetUserProfile'>ViewProfile</a>
				</li>
				<li>
				<a href='ChangePass.jsp'>ChangePass</a></li>
			  <li>			
				<a href='./LogoutAction'> LogOut</a>
			</li>
		</ul>

	</body>
</html>
