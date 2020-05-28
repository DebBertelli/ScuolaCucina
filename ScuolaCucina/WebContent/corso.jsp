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

	<table border="1">
		<thead>
			<tr>
			    <th>Id</th>
				<th>Titolo</th>
				<th>Ore</th>
				<th>Id_docente</th>
				<th>MaxPartecipanti</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				int i = 1;
				List<Corso> corsi = CorsoService.listaCorsi();
			%>

			<%
				for (Corso c : corsi) {
			%>
			<tr>
				<td><%=i++%></td>
				<td><%=c.getTitolo()%></td>
				<td><%=c.getOre()%></td>
				<td><%=c.getId_docente()%></td>
				<td><%=c.getMaxPartecipanti()%></td>
				<td><a href='CorsoServlet?id="+c.getId()+"'>elimina</a></td>  
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="inserisciCorso.jsp?">&rarr; Inserisci un nuovo corso</a>
</body>
</html>
