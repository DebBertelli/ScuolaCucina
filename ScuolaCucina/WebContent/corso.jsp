<%@page import="it.begear.progetto.service.CorsoService"%>
<%@page import="it.begear.progetto.dao.CorsoDAO"%>
<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corsi</title>
</head>
<body>
	<a href="index.jsp">Torna alla home</a>
	<h1>I nostri corsi</h1>

	<div>
		<%
			List<Corso> corsi = CorsoDAO.leggiTutti();
			for (Corso c : corsi) {
		%>

		<%=c.getTitolo()%>
		<%=c.getOre()%>
		<%=c.getMaxPartecipanti()%>
		<%=c.getId_docente() %>
		<form action="corso-servlet" method="get">
			<input type="hidden" name="id" value="<%=c.getId()%>">
			<input type="hidden" name="azione" value="elimina"> <input
				type="submit" value="&times;"
				class="btn btn-outline-warning rounded-pill">
		</form>
	</div>

	<%
		}
	%>
	<a href="inserisciCorso.jsp?">&rarr; Inserisci un nuovo corso</a>
</body>
</html>
