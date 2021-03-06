<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.entity.Utente"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@page import="it.begear.progetto.dao.CorsoDAO"%>
<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.service.DocenteService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scheda docente</title>
<style type="text/css">
<%@ include file="/css/form.css" %>
<%@ include file="/css/style.css" %>
</style>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		int id_docente = Integer.parseInt(request.getParameter("id_docente"));
		Docente docente = DocenteService.cerca(id_docente);
	%>
	<div class="container">
		<h1><%=docente.getNome_docente() + " " + docente.getCognome_docente()%></h1>
	
	    <h5>Email:<%=docente.getEmail_docente()%></h5>


	    <h5>Corsi:
		 <% CorsoDAO corso = new CorsoDAO();
	        List<Corso> corsi = corso.leggiCorsoD(id_docente);
	 
	        for(Corso c: corsi){ %>
		    <a href="homeCorso.jsp?id=<%=c.getId()%>"><%=c.getTitolo()%></a>
		    <br>
		<%
		}
	    %></h5>
	</div>

	<%
		Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
		if (isAdmin != null && isAdmin) {
	%>

	

	<div class="container">
	<!-- elimina -->
	<div>
		<form action="docente-servlet" method="get">
			<input type="hidden" name="id_docente" value="<%=id_docente%>">
			<!-- bottone elimina -->
			<input type="hidden" name="azione" value="elimina"> 
			<input type="submit" value="Elimina" class="btn btn-warning rounded-pill" style="float:left">
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
		<!-- modifica -->
	  <h2>Aggiorna dati del docente</h2>
			<form action="docente-servlet" method="get" name="modulo"
				onsubmit="return valida()">
				<input type="hidden" name="id_docente" value="<%=docente.getId_docente()%>">
			<div class="row">
				<div class="col-25">
					<label for="nome_docente">Nome</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="text" id="nome_docente" name="nome_docente"
						placeholder="Inserici nome" value="<%=docente.getNome_docente()%>" /> <span
						id="eNome"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="cognome_docente">Cognome</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="text" id="cognome_docente" name="cognome_docente"
						placeholder="Inserici cognome" value="<%=docente.getCognome_docente()%>" /> <span
						id="eCognome"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="email">E-mail</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="email" id="eEmail" name="email_docente"
						placeholder="Inserici mail" value="<%=docente.getEmail_docente()%>" /> <span
						id="eEmail"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="hidden" name="azione" value="aggiorna"> 
					<input type="submit" value="Aggiorna" class="btn rounded-pill btn-blu">
				 </div>
				</div>
			
		</form>

	
		
	
	
	
	
	

	<%
		}
	%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>