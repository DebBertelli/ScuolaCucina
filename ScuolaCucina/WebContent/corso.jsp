<%@page import="it.begear.progetto.dao.DocenteDAO"%>
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
<style type="text/css">
.divTable
    {
        display:  table;
        width:auto;
        background-color:#eee;
        border:1px solid  #666666;
        border-spacing:5px;/*cellspacing:poor IE support for  this*/
       /* border-collapse:separate;*/
    }

    .divRow
    {
       display:table-row;
       width:auto;
    }

    .divCell
    {
        float:left;/*fix for  buggy browsers*/
        display:table-column;
        width:200px;
        background-color:#ccc;
    }
</style>
<title>Corsi</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>


	<h1>I nostri corsi</h1>
	<%
		List<Corso> corsi = CorsoService.listaCorsi();
	%>

	<div class="divTable">
		<div class="headRow">
			<div class="divCell">Titolo</div>
			<div class="divCell">Ore</div>
			<div class="divCell">Docente</div>
			<div class="divCell">Max Partecipanti</div>
			<div class="divCell">Elimina</div>
		</div>
		<%
			for (Corso c : corsi) {
				DocenteDAO docente = new DocenteDAO();
		%>
		<div class="divRow">
			<div class="divCell">
				<a href="homeCorso.jsp?id=<%=c.getId()%>"><%=c.getTitolo()%></a>
			</div>
			<div class="divCell"><%=c.getOre()%></div>
			<div class="divCell"><%=docente.leggiDocente(c.getId_docente()).getCognome_docente()%></div>
			<div class="divCell"><%=c.getMaxPartecipanti()%></div>
			<div class="divCell">
				<form action="CorsoServlet" method="get">
					<input type="hidden" name="id" value="<%=c.getId()%>"> <br>
					<input type="hidden" name="azione" value="delete"> <input
						type="submit" value="Elimina" class="btn rounded-pill btn-blu">
				</form>
			</div>
		</div>
		<%
			}
		%>

	</div>
	<a href="inserisciCorso.jsp?">&rarr; Inserisci un nuovo corso</a>
</body>
</html>
