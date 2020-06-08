<%@page import="it.begear.progetto.entity.*"%>
<%@page import="it.begear.progetto.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

/* Style the header with a white background and some padding */
.header {
	overflow: hidden;
	background-color:#FAFBFC;
	padding-bottom:10px;
	
	
}

/* Style the header links */
.header a {
	float: left;
	color:   #FFFAF0;
	text-align: center;
	padding-left: 14px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

/* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
.header a.logo {
	font-size: 25px;
	font-weight: bold;
}

/* Change the background color on mouse-over */
.header a:hover {
	background-color:  #FFDEAD;
	color: black;
}


/* Style the list */
ul.breadcrumb {
  padding: 100px 16px 0px 10px;
  
  list-style: none;
  background-color: #fffff;
}

/* Display list items side by side */
ul.breadcrumb li {
  display: inline;
  font-size: 18px;
   font-family: Arial, Helvetica, sans-serif;
}


/* Add a color to all links inside the list */
ul.breadcrumb li a {
  color: #EDA340;
  text-decoration: none;
}

/* Add a color on mouse-over */
ul.breadcrumb li a:hover {
  color: #C82C02;
  text-decoration: underline;
}

/* Float the link section to the right */
.header-right {
	float: right;
}

/* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */
@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align:left;
	}
	.header-right {
		float: none;
		padding-bottom:15px;
	}
}
/* Add a black background color to the top navigation */
.topnav {
	background-color: #C82C02;
	overflow: hidden;
	
}

/* Style the links inside the navigation bar */
.topnav a {
	float: left;
	color: #f2f2f2;
	text-align: center;
	padding: 24px 22px;
	text-decoration: none;
	font-size: 17px;
	 font-family: Arial, Helvetica, sans-serif;
}

/* Change the color of links on hover */
.topnav a:hover {
	background-color:#FFDEAD;
	color: #EDA340;
}

/* Add a color to the active/current link */
.topnav a.active {
	background-color: #EDA340;
	color: white;
}

/* Right-aligned section inside the top navigation */
.topnav-right {
	float: right;
	
}
</style>
</head>
<body style="background-color:#FAFBFC;">

	<div class="header">
		<a href="index.jsp" class="logo"><img src="image/logo1.png" alt="Cook-Vid19" style="width:90%;max-width:150px"></a>
			<%
		//Carico i dati dell'utente che ha effettuato la login dal DB
		Utente utente = (Utente) session.getAttribute("utente"); //Session è un oggetto implicito della classe HttpSession
		if(utente!=null){
		%>
			<div class="header-right">
			<ul class="breadcrumb">
			<li><a href="home-utente.jsp">Utente: <%=utente.getUsername()%></a></li>
			</ul>
			</div>
		<%}
		else {
			
		%>
			<div class="header-right">
			<ul class="breadcrumb">
			<li><a href="login.jsp">Accedi</a></li>
			<li><a href="registrazione.jsp">Registrati</a></li>
			
			
		</ul>
	</div>
		<%
		}
		%>
	</div>





	<div class="topnav">
		<a class="active" href="index.jsp">HOME</a> <a href="corso.jsp">CORSI</a> <a
			href="docente.jsp">DOCENTI</a> <a href="formContatto.jsp">CONTATTACI</a>
		<div class="topnav-right">
			<a href="cerca.jsp"><i class="fa fa-fw fa-search" style= "padding-right: 10px"></i>Cerca</a>
		</div>
	</div>
	<!-- creaiamo il menu del nostro sito (navbar)
	Prendiamo per riferimento il menu del sito w3schools 
	deve esserci un titolo e una sezione con i link alle pagine 
	principali
	
	In questa pagina navbar.jsp inseriamo solo la navbar, poi la 
	importeremo nelle altre pagine jsp
	-->
</body>
</html>