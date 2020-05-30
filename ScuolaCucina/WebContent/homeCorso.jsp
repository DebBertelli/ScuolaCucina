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
<title>scheda Docente</title>
<style type="text/css">
/* Style inputs, select elements and textareas */
input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	resize: vertical;
}

/* Style the label to display next to the inputs */
label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

/* Style the submit button */
input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

/* Style the container */
.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

/* Floating column for labels: 25% width */
.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

/* Floating column for inputs: 75% width */
.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Corso corso = CorsoService.cerca(id);
		Docente doc = new Docente();
		Corso c = new Corso();
	%>
	<div>
		<h1><%=corso.getTitolo()%></h1>
	</div>

	<p>
		<img src="image.gif"><br />some text
	</p>


	<h5>Docente:</h5>
	<%
		DocenteDAO docenteDao = new DocenteDAO();
		Docente docente = docenteDao.leggiDocente(corso.getId_docente());
	%>
	<a href="homeDocente.jsp?id=<%=docente.getId_docente()%>"><%=String.format("%s %s", docente.getNome_docente(), docente.getCognome_docente())%></a>
	<br>

	<h5>Ore:</h5>
	<%=corso.getOre()%>

	<h5>MaxPartecipanti:</h5>
	<%=corso.getMaxPartecipanti()%>

	<hr>
	<!-- modifica -->
	<div class="container">
		<h5>Aggiorna dati del corso</h5>
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

</body>

</html>