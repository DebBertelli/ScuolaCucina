<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cerca</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div>
		<h4>Cerca un docente</h4>
		<form action="docente-servlet" method="get"
			onsubmit="return valida('cognome_docente', 'err3')">
			<label>Cognome</label>
			<input type="text" name="cognome_docente" id="cognome_docente">
			<span id="err3"></span><br> 
			<input type="hidden" name="azione" value="cerca"> 
			<input type="submit" value="Cerca" class="btn rounded-pill btn-blu">
		</form>
		<br>
		</div> <!-- form di ricerca per i docenti x cognome, reindirizza a lista docenti con quel cognome -->
		<hr>
		<div>
			<h4>Cerca un corso</h4>
				<div>
		<form action="CorsoServlet" method="get"
			onsubmit="return valida('cognome_docente', 'err4')">
			<label>Titolo</label>
			<input type="text" name="keyword" id="keyword">
			<span id="err4"></span><br> 
			<input type="hidden" name="azione" value="cercaPerKey"> 
			<input type="submit" value="Cerca" class="btn rounded-pill btn-blu">
		</form>
		<br>
 		</div>
			<br>
		</div> <!-- form di ricerca per i corsi x titolo -->
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>