<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.dao.DocenteDAO"%>
<%@page import="it.begear.progetto.service.CorsoService"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scheda Docente</title>
<style type="text/css">
<%@ include file="/css/form.css" %>

input.trasparente{
	background-color: #C82C02;
	border: none;
	outline: none;
	color: white;
	padding:5px;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>

<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Corso corso = CorsoService.cerca(id);
		Docente doc = new Docente();
		Corso c = new Corso();
	%>
	<div>
		<h1><%=String.format("%s %s", corso.getId_docente(),corso.getTitolo())%></h1>
		<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<p><%=messaggio%></p>
	<%
		}
	%>
		<form action="preferiti-servlet" style="display:inline-block">
									<input type="hidden" name="id" value="<%=corso.getId()%>">
									<input type="hidden" name="azione" value="aggiungi">
									<input type="submit" value="&hearts; Salva" class="trasparente"
										>
								</form>
	</div>
	<%
		DocenteDAO docenteDao = new DocenteDAO();
		Docente docente = docenteDao.leggiDocente(corso.getId_docente());
	%>
	<!-- modifica -->
	<div class="container">
		<h4>Aggiorna dati del corso</h4>
		<form action="CorsoServlet" method="get" name="modulo"
			onsubmit="return valida()">
			<input type="hidden" name="id" value="<%=corso.getId()%>">
			<div class="row">
				<div class="col-25">
					<label for="titolo">Titolo</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="text" id="titolo" name="titolo" placeholder="Inserici titolo"
						value="<%=corso.getTitolo()%>" /> <span id="eTitolo"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="ore">Ore</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="text" name="ore" id="ore" placeholder="Inserici ore"
						value="<%=corso.getOre()%>"> <span id="eOre"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="id_docente">Docente</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">

					<select id="id_docente" name="id_docente">
						<%
							List<Docente> docenti = DocenteDAO.leggiTutti();
							for (Docente d : docenti) {
						%>
						<option value="<%=d.getId_docente()%>" <%if((d.getId_docente())==corso.getId_docente()){%> selected <%}%>><%=String.format("%s %s", d.getNome_docente(), d.getCognome_docente())%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label>Max Partecipanti</label>
				</div>
			</div>
			<div class="row">
				<div class="col-75">
					<input type="text" name="max_partecipanti"
						value="<%=corso.getMaxPartecipanti()%>"
						placeholder="Inserici max partecipanti"> <span
						id="eMaxPArtecipanti"></span>
				</div>
			</div>
			<input type="hidden" name="azione" value="update">
			<div class="row">
				<input type="submit" value="Aggiorna"
					class="btn btn-blu rounded-pill">
			</div>

		</form>
	</div>
</body>

<script type="text/javascript">
	<%@ include file="/js/validate.js" %>
	changeNavSelect("CORSI");
		
</script>

</html>