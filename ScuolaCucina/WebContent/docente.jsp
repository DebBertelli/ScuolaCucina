<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.entity.Utente"%>
<%@page import="it.begear.progetto.dao.DocenteDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
	<jsp:include page="navbar.jsp" />

	<%
		Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<h3 class="messaggio"><%=messaggio%></h3>
	<%
		} // if
	%>
	<h1>Il nostro corpo docenti</h1>
	<div class="divTableDocente">
		<div class="headRow">
			<div class="divCell">Docente</div>
			<div class="divCell"align="right"></div>
		</div> <!-- headrow -->
	<%
		List<Docente> docenti = DocenteDAO.leggiTutti();
		for (Docente d : docenti) {
	%>
		<div class="divRow">
			<div class="divCell">
			  <a href="homeDocente.jsp?id_docente=<%=d.getId_docente()%>"> <%=d.getNome_docente()%> <%=d.getCognome_docente()%></a>
			</div> <!-- divCell -->
			<div class="divCell" align="right">
	<%
			if (isAdmin != null && isAdmin) {
	%>
				<div class="elimina">
					<form action="docente-servlet" method="get">
						<input type="hidden" name="id_docente" value="<%=d.getId_docente()%>">
						<input type="hidden" name="azione" value="elimina">
						<input type="submit" value="Elimina" class="btn btn-outline-warning rounded-pill">
					</form>
				</div> <!-- elimina -->
	<%
			} // if
	%>
			</div> <!-- divCell -->		
		</div> <!-- divRow -->
	<%
		} // for
		if (isAdmin != null && isAdmin) {
	%>	
		<div class="divRow">
			<div class="the-icons span3" title="" align="right">
				<a class="button" href="inserisciDocente.jsp?">
					<i class='fas fa-arrow-right' ></i>
					<span class="i-name">Inserisci un nuovo docente</span>
				</a>
			</div> 
		</div>	
	<%
		} // if
	%>
	
	<jsp:include page="footer.jsp"></jsp:include>
	</div> <!-- divTableDocente -->
	<script type="text/javascript">
		<%@ include file="/js/validate.js" %>
		changeNavSelect("DOCENTI");
	</script>
</body>
</html>