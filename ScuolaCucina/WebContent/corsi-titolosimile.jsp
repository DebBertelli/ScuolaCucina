<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@page import="it.begear.progetto.entity.Utente"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.service.DocenteService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
<%@include file="/css/divTable.css"%>
<%@include file="/css/style.css"%>
</style>
<title>Risultati ricerca</title>
</head>
<body>
<%
			Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
			List<Corso> corsi = (List<Corso>)request.getAttribute("corsi");

			if (corsi.isEmpty()) {
		%>
		<h2>La ricerca non ha prodotto risultati</h2>
		<a href="cerca.jsp">&larr; Riprova</a>
		<%
			}
			else{
		%>
		<h1>Risultati ricerca</h1>
		<div class="divTableDocente">
		<div class="headRow">
			<div class="divCell">Titolo</div>
			<div class="divCell">Docente</div>
			<div class="divCell" align="right"></div>
		</div> <!-- headRow -->
				<%
					for (Corso corso : corsi) {
					Docente docente = DocenteService.cerca(corso.getId_docente());	
				%>
				
			<div class="divRow">
				<div class="divCell">
					<a href="homeCorso.jsp?id=<%=corso.getId()%>"><%=corso.getTitolo()%></a>
				</div> <!-- divCell -->
				<div class="divCell">
					<a href="homeDocente.jsp?id_docente=<%=docente.getId_docente()%>"><%=String.format("%s %s", docente.getNome_docente(), docente.getCognome_docente())%></a>
				</div> <!-- divCell -->
				<div class="divCell">
					<%
						if (isAdmin != null && isAdmin){
					%>
							<form action="CorsoServlet" method="get">
								<input type="hidden" name="idArtista"
									value="<%=corso.getId()%>"> 
									<input type="hidden"
									name="azione" value="delete"> <input type="submit"
									value="Elimina" class="btn btn-outline-warning rounded-pill">
							</form>
				</div> <!-- divCell -->
			</div> <!-- divRow -->
					<%
						}//if
					%>
				
				<%
					}//for
		
			}//else
			%>
		</div>
<jsp:include page="footer.jsp"></jsp:include>			
</body>
</html>