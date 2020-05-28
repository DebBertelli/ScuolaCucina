<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.dao.DocenteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Docenti</title>
</head>
<body>
	<a href="index.jsp">Torna alla home</a>
	<h1>Il nostro corpo docenti</h1>
	<div>
		<%
			List<Docente> docenti = DocenteDAO.leggiTutti();
			for (Docente d : docenti) {
		%>

		<a href="homeDocente.jsp?id_docente=<%=d.getId_docente()%>"><%=d.getNome_docente()%>
		<%=d.getCognome_docente()%></a>
		

		<form action="docente-servlet" method="get">
			<input type="hidden" name="id_docente" value="<%=d.getId_docente()%>">
			<input type="hidden" name="azione" value="elimina"> <input
				type="submit" value="&times;"
				class="btn btn-outline-warning rounded-pill">
		</form>
	</div>

	<%
		}
	%>
	<a href="inserisciDocente.jsp?">&rarr; Inserisci un nuovo docente</a>
</body>
</html>