<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Risultati ricerca</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<%

			List<Docente> docenti = (List<Docente>)request.getAttribute("docenti");

			if (docenti.isEmpty()) {
		%>
		<h2>La ricerca non ha prodotto risultati</h2>
		<a href="cerca.jsp">&larr; Riprova</a>
		<%
			} else {

				String cognome = docenti.get(0).getCognome_docente();
		%>
		<h2>
			Docenti di cognome
			<%=cognome%></h2>
		<div>
				<%
					for (Docente d : docenti) {
				%>
				
					<a href="homeDocente.jsp?id=<%=d.getId_docente()%>"><%=d.getNome_docente()%> <%=d.getCognome_docente()%></a> 
				
						<form action="docente-servlet" method="get">
							<input type="hidden" name="idArtista"
								value="<%=d.getId_docente()%>"> <input type="hidden"
								name="azione" value="elimina"> <input type="submit"
								value="&times;" class="btn btn-outline-warning rounded-pill">
						</form>
				</div>
				<%
					}
		
				}
			%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>