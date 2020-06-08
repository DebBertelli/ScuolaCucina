<%@page import="it.begear.progetto.controller.UtenteServlet"%>
<%@page import="it.begear.progetto.service.DocenteService"%>
<%@page import="it.begear.progetto.dao.DocenteDAO"%>
<%@page import="it.begear.progetto.service.CorsoService"%>
<%@page import="it.begear.progetto.dao.CorsoDAO"%>
<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.entity.Utente"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<style type="text/css">
	<%@ include file="/css/divTable.css" %>
	<%@ include file="/css/style.css" %>
	</style>
	
	<title>I nostri Corsi</title>
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

	<h1>I nostri corsi</h1>
	<%
		List<Corso> corsi = CorsoService.listaCorsi();
	%>
    
	<div class="divTableDocente" >
		<div class="headRow">
			<div class="divCell">Titolo</div>
			<div class="divCell">Docente</div>
			<div class="divCell"align="right">Elimina</div>
		</div>
		<%
			for (Corso c : corsi) {
				DocenteDAO docenteDoa = new DocenteDAO();
				Docente docente = DocenteService.cerca(c.getId_docente());
		%>
		<div class="divRow">
			<div class="divCell">
				<a href="homeCorso.jsp?id=<%=c.getId()%>"><%=c.getTitolo()%></a>
			</div>
			<div class="divCell">
				<a href="homeDocente.jsp?id_docente=<%=docente.getId_docente()%>"><%=String.format("%s %s", docente.getNome_docente(), docente.getCognome_docente())%></a>
			</div>
			<div class="divCell" align="right">
			  <div class="elimina">
				<form action="CorsoServlet" method="get">
					<input type="hidden" name="id" value="<%=c.getId()%>">
					<input type="hidden" name="azione" value="delete"> 
					<input type="button" value="Elimina" class="btn rounded-pill btn-blu">
				</form>
				</div>
			</div>
		</div>

		<%
			}
		Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
		if(isAdmin!=null && isAdmin){
		%>
		<div class="divRow">
			<div class="divCell"></div>
			<div class="divCell"></div>
			<div class="divCell" align="right">
				<div class="the-icons span3" title="">
					<a class="button" href="inserisciCorso.jsp?">
						<i class='fas fa-arrow-right' ></i>
						<span class="i-name">Inserisci un nuovo corso</span>
					</a>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
<script type="text/javascript">
	<%@ include file="/js/validate.js" %>
	changeNavSelect("CORSI");
</script>
</html>