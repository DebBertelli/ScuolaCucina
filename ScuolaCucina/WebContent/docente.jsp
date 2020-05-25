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

		<%=d.getNome_docente()%>
		<%=d.getCognome_docente()%>
		<%=d.getEmail_docente()%>
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

</body>
</html>