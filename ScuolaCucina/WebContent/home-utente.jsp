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
			
		</div>
				
			<div class="dx" style="padding-top: 60px">
			<h4 style="display: inline-block;">Corsi salvati: </h4>
			<%
				if (preferiti.getCorsiPreferiti().size() != 0) {
			%>
			
			<form style="display: inline-block;" action="preferiti-servlet">
				<input type="hidden" name="azione" value="svuota">
				<input type="submit" value="svuota" class="trasparente" style="width: auto; text-decoration: underline">
			</form>
			<div style="overflow-x: auto; margin-bottom: 40px">
				<table>
					<tr>
						<th>Titolo</th>
						<th>Rimuovi</th>
					</tr>
					
					
					<%
						for (Corso c : preferiti.getCorsiPreferiti()) {
					%>
					<tr>
						<td><a href="homeCorso.jsp?id=<%=c.getId()%>"><%=c.getTitolo()%></a></td>
						<td>
							<form action="preferiti-servlet">
								<input type="hidden" name="id" value="<%= c.getId()%>">
								<input type="hidden" name="azione" value="rimuovi">
								<input type="submit" value="&times;" style="width: 30px" class="trasparente">
							</form>
						</tr>
					<%
						}
					%>
				</table>
			</div>
			<%
				}else
					out.println("la lista è vuota.");
			%>
		</div>
</body>
</html>