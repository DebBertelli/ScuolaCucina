<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="it.begear.progetto.entity.Corso"%>
<%@page import="it.begear.progetto.service.CorsoService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Corso corso = CorsoService.cerca(id);
	%>
	<div>
		<h1><%=corso.getTitolo() + " " + corso.getId_docente()%></h1>
	</div>

	<h5>Corsi:</h5>
	<hr>
	<!-- modifica -->
	<h5>Aggiorna dati del corso</h5>
	<form action="docente-servlet" method="get" name="modulo"
		onsubmit="return valida()">
				<label></label><input type="hidden" name="id"
			value="<%=corso.getId()%>">
				<span id="eId"></span>
				<label>Titolo</label><input type="text" name="titolo"
			placeholder="<%=corso.getTitolo()%>">
				<span id="eTitolo"></span>
				<br>
				<label>Ore</label><input type="text" name="ore"
			placeholder="<%=corso.getOre()%>">
				<span id="eOre"></span>
				<br> 
				<label>Id_docente</label><input type="text" name="id_docente" 
				placeholder="<%=corso.getId_docente()%>">
				<span id="eId_docente"></span>
				<br> 
				<label>maxPartecipanti</label><input type="text" name="max_partecipanti"
			placeholder="<%=corso.getMaxPartecipanti()%>">
				<span id="eMaxPArtecipanti"></span>
				<br> 
				<input type="hidden" name="azione" value="aggiorna">
				<input type="submit" value="Aggiorna"
			      class="btn btn-blu rounded-pill">
			</form>
	<!-- elimina -->
	<h5 style="display: inline-block;">Elimina</h5>
	<form style="display: inline-block; padding: 0"
		action="corso-servlet" method="get">
		<input type="hidden" name="id" value="<%=id%>">
		<!-- QUI -->
		<input type="hidden" name="azione" value="elimina"> <input
			type="submit" value="&times;" class="btn btn-warning rounded-pill">
	</form>
</body>

</body>

</html>