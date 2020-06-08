<%@page import="it.begear.progetto.entity.*"%>
<%@page import="it.begear.progetto.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/divTable.css">

 
 
<style>input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-align:center;
	margin-top: 6px;
	font-family: Arial, Helvetica, sans-serif;
}</style>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
			

			//Carico i dati dell'utente che ha effettuato la login dal DB
			Utente utente = (Utente) session.getAttribute("utente"); //Session è un oggetto implicito della classe HttpSession

			ListaPreferiti preferiti = (ListaPreferiti) session.getAttribute("preferiti");
		%>
		
		
		
		<div>
		
			<h1 class="titolo1"><%=utente.getUsername()%>
			</h1>
			<form action="utente-servlet" method="post">
				<input type="hidden" name="azione" value="logout"> <input
					type="submit" value="Logout">
			</form>
			
			
			<h5><%=utente.getNome_utente()%></h5>
			
			<h5><%=utente.getCognome_utente()%></h5>
			
			<h5>
				Email:
				<%=utente.getEmail_utente()%></h5>
				
			</div>
			<hr>
			
	
				
			<div class="dx" style="padding-top: 60px">
			<h4 style="display: inline-block;">Corsi salvati: </h4>
			<%
				if (preferiti.getCorsiPreferiti().size() != 0) {
			%>
			
			<form style="display: inline-block;" action="preferiti-servlet">
				<input type="hidden" name="azione" value="svuota">
				<input type="submit" value="svuota" class="trasparente" style="width: auto; text-decoration: underline">
			</form>
		<div class="divTableDocente" style="width:50%" >
		<div class="headRow">
				<div class="divCell">Titolo</div>
				<div class="divCell"align="right">Rimuovi</div>
				</div>	
					
					
					<%
						for (Corso c : preferiti.getCorsiPreferiti()) {
					%>
					<div class="divRow">
					<div class="divCell"><a href="homeCorso.jsp?id=<%=c.getId()%>"><%=c.getTitolo()%></a></div>
						
					<div class="divCell" align="right">
			 		 <div class="elimina">
							<form action="preferiti-servlet">
								<input type="hidden" name="id" value="<%= c.getId()%>">
								<input type="hidden" name="azione" value="rimuovi">
								<input type="submit" value="Elimina"class="btn rounded-pill btn-blu">
							</form>
							</div>
						</div>
					</div>
						
					<%
						}
					%>
				
			</div>
			<%
				}else
					out.println("la lista è vuota.");
			%>
		</div>
</body>
</html>