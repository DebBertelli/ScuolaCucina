<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.entity.Utente"%>
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
	<jsp:include page="navbar.jsp"></jsp:include>

	<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<h3 class="messaggio"><%=messaggio%></h3>
	<%
		}
	%>
	<h1>Il nostro corpo docenti</h1>
	<div>
		<%
			List<Docente> docenti = DocenteDAO.leggiTutti();
			for (Docente d : docenti) {
		%>
		<div>
		<a href="homeDocente.jsp?id_docente=<%=d.getId_docente()%>"> <%=d.getNome_docente()%>
			<%=d.getCognome_docente()%>
		</a>
		<%
			Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
				if (isAdmin != null && isAdmin) {
		%>

		<form action="docente-servlet" method="get">
			<input type="hidden" name="id_docente" value="<%=d.getId_docente()%>">
			<input type="hidden" name="azione" value="elimina"> <input
				type="submit" value="&times;"
				class="btn btn-outline-warning rounded-pill">
		</form>
		<%
			}
		%>
		</div>
		<br>
	</div>

	<%
		}
		Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
		if (isAdmin != null && isAdmin) {
	%>
	<a href="inserisciDocente.jsp?">&rarr; Inserisci un nuovo docente</a>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		}
	%>
</body>
</html>