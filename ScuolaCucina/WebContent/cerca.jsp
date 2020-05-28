<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cerca</title>
</head>
<body>

	<div>
		<h1>Cerca un docente</h1>
		<form action="docente-servlet" method="get"
			onsubmit="return valida('cognome_docente', 'err3')">
			<label>Cognome</label>
			<input type="text" name="cognome_docente" id="cognome_docente">
			<span id="err3"></span><br> 
			<input type="hidden" name="azione" value="cerca"> 
			<input type="submit" value="Cerca" class="btn rounded-pill btn-blu">
		</form>
		<br>
		</div>

</body>
</html>