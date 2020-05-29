<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserisci docente</title>
</head>
<body>
<h1 id="docente">Inserisci un nuovo docente</h1>
	<jsp:include page="navbar.jsp"></jsp:include>
	<form action="docente-servlet" method="get" name="modulo2"
		onsubmit="return valida2()">
		<label>Nome</label> <input type="text" name="nome_docente">
		<span id="err6"></span>
		<br> <label>Cognome</label> <input type="text"
			name="cognome_docente">
		<span id="err7"></span>
		<br> <label>E-mail</label> <input type="email"
			name="email_docente">
		<span id="err8"></span>
		<br> <input type="hidden" name="azione" value="inserisci">
		<input type="submit" value="Inserisci" class="btn rounded-pill btn-blu">
	</form>
	<script type="text/javascript">
		function valida2() {
			
			var risultato = true;
			
			if(document.modulo2.nome_docente.value == ""){
				document.getElementById("err6").innerHTML = "Il campo nome deve essere riempito";
				risultato = false;
			}
			
			if(document.modulo2.cognome_docente.value == ""){
				document.getElementById("err7").innerHTML = "Il campo cognome deve essere riempito";
				risultato = false;
			}
			
			if(document.modulo2.email_docente.value == ""){
				document.getElementById("err8").innerHTML = "Il campo email deve essere riempito";
				risultato = false;
			}
			
			return risultato;
		}
	</script>
</body>
</html>