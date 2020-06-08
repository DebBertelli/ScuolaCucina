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
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style type="text/css">
	<%@ include file="/css/style.css" %>
	<%@ include file="/css/divTable.css" %>
	</style>
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
		<%
			List<Docente> docenti = DocenteDAO.leggiTutti();
			for (Docente d : docenti) {
		%>

		<div class="divTableDocente" >
			<div class='fas fa-circle'>
			  <a href="homeDocente.jsp?id_docente=<%=d.getId_docente()%>"> <%=d.getNome_docente()%>
				<%=d.getCognome_docente()%></a>
			</div>
		</div>

		
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
	

	<%
		}
		Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
		if (isAdmin != null && isAdmin) {
	%>
	<div class="the-icons span3" title="">
					<a class="button" href="inserisciDocente.jsp?">
						<i class='fas fa-arrow-right' ></i>
						<span class="i-name">Inserisci un nuovo docente</span>
					</a>
				</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		}
	%>
</body>
</html>