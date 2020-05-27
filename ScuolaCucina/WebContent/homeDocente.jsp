<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.service.DocenteService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scheda docente</title>
</head>
<body>
	<%
		int id_docente = Integer.parseInt(request.getParameter("id_docente"));
		Docente docente = DocenteService.cerca(id_docente);
	%>
	<div>
		<h1><%=docente.getNome_docente() + " " + docente.getCognome_docente()%></h1>
	</div>

	<h5>Email:</h5>

	<%=docente.getEmail_docente()%>

	<h5>Corsi:</h5>
	<hr>
	<!-- modifica -->
	<h5>Aggiorna dati del docente</h5>
			<form action="docente-servlet" method="get" name="modulo"
				onsubmit="return valida()">
				<label>Nome</label><input type="text" name="nome_docente"
					value="<%=docente.getNome_docente()%>">
				<span id="eNome"></span>
				<br>
				<label>Cognome</label><input type="text" name="cognome_docente"
					value="<%=docente.getCognome_docente()%>">
				<span id="eCognome"></span>
				<br> <label>E-mail</label><input type="email_docennte"
					name="email_docente" value="<%=docente.getEmail_docente()%>">
				<span id="eEmail"></span>
				<br> 
				<input type="submit" value="Aggiorna"
					class="btn btn-blu rounded-pill">
			</form>
	<!-- elimina -->
	<h5 style="display: inline-block;">Elimina</h5>
	<form style="display: inline-block; padding: 0"
		action="docente-servlet" method="get">
		<input type="hidden" name="id_docente" value="<%=id_docente%>">
		<!-- QUI -->
		<input type="hidden" name="azione" value="elimina"> <input
			type="submit" value="&times;" class="btn btn-warning rounded-pill">
	</form>
</body>
</html>