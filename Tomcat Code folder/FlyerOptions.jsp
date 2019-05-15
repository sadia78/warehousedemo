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
	font-size: 24px;
}

.asd {
	text-decoration: none;
	font-family: arial, verdana, san-serif;
	font-size: 24px;
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
	width:100 px;
	background: ;
	position: relative;
	z-index: 400;
	margin: 0 2px;
}

/*****parent menu*****/
#nav li a {
	display: block;
	padding: 4px 4px 0 4px;
	font-weight: 600;
	height: 25px;
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
	width: 100px;
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
	padding-left: 10px;
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
				<a href='MasFrame.jsp'>Home</a></li>
		    			
			<li>
				<a href='./AboutTheProgram.jsp'>AboutUs</a></li>				
			<li>
				<a href='Regustration.jsp'>Registration_Now</a>		</li>	
			
			<li>		
				<a href='./FlyerLogin.jsp'> Login</a>
			</li>
		</ul>

	</body>
</html>
