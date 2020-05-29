<%@page import="it.begear.progetto.entity.*"%>

<%@page import="it.begear.progetto.controller.*"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
			

			//Carico i dati dell'utente che ha effettuato la login dal DB
			Utente utente = (Utente) session.getAttribute("utente"); //Session è un oggetto implicito della classe HttpSession

			ListaPreferiti preferiti = (ListaPreferiti) session.getAttribute("preferiti");
		%>
		
		
		
		<div class="sx">
			<h1 class="titolo1"><%=utente.getUsername()%>
			</h1>
			<form action="utente-servlet" method="post" class="logout-form">
				<input type="hidden" name="azione" value="logout"> <input
					type="submit" value="Logout"
					class="btn btn-outline-warning btn-logout">
			</form>
			<h5><%=utente.getNome_utente()%>
				<%=utente.getCognome_utente()%></h5>
			<h5>
				Email:
				<%=utente.getEmail_utente()%></h5>
			
			<hr>
				
			
</body>
</html>