<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.dao.DocenteDAO"%>
<%@page import="it.begear.progetto.service.CorsoService"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Inserisci corso</title>
<style type="text/css">
<%@ include file="/css/form.css" %>
</style>
</head>
	<body>
		<jsp:include page="navbar.jsp"></jsp:include>
		<div class="container">
			<h1 id="corso">Inserisci un nuovo corso</h1>
			<form action="CorsoServlet" method="post" name="modulo2" onsubmit="return valida()">
				<label>Titolo</label> 
				<input type="text" name="titolo" placeholder="Inserici titolo"> 
				<span id="eTitolo"></span> 
				<br> 
				<label>Ore</label> 
				<input type="text" name="ore" placeholder="Inserici ore"> 
				<span id="eOre"></span> 
				<br> 
				<label>Docente</label>
				<select id="id_docente" name="id_docente">
					<%
						List<Docente> docenti = DocenteDAO.leggiTutti();
						for (Docente d : docenti) {
					%>
					<option value="<%=d.getId_docente()%>"><%=String.format("%s %s", d.getNome_docente(), d.getCognome_docente())%></option>
					<%
						}
					%>
				</select>
				<br> 
				<label>Max Partecipanti</label> <input type="text" name="max_partecipanti" placeholder="Inserici max participanti"> 
				<span id="eMaxPArtecipanti"></span>
				
				<div class="row">
					<input type="hidden" name="azione" value="insert"> 
					<input type="submit" value="Inserisci" class="btn rounded-pill btn-blu">
				</div>
			</form>
		</div>
		<script type="text/javascript">
			
			<%@ include file="/js/validate.js" %>
			changeNavSelect("CORSI");
		</script>
	</body>
</html>