<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserisci corso</title>
</head>
<body>
<body>
<h1 id="corso">Inserisci un nuovo corso</h1>
	<form action="corsoServlet" method="get" name="modulo2"
		onsubmit="return valida2()">
		<label>Titolo</label> <input type="text" name="titolo">
		<span id="err6"></span>
		<br> <label>Ore</label> <input type="text"name="ore">
		<span id="err7"></span>
		<br> <label>Id_docente</label> <input type="text" name="id_docente">
		<span id="err8"></span>
		<br> <label>maxPartecipanti</label> <input type="text" name="max_partecipanti">
		<span id="err8"></span>
		<br> <input type="hidden" name="azione" value="inserisci">
		<input type="submit" value="Inserisci" class="btn rounded-pill btn-blu">
	</form>
	<script type="text/javascript">
		function valida2() {
			
			var risultato = true;
			
			if(document.modulo2.titolo.value == ""){
				document.getElementById("err6").innerHTML = "Il campo titolo deve essere riempito";
				risultato = false;
			}
			
			if(document.modulo2.ore.value == ""){
				document.getElementById("err7").innerHTML = "Il campo ore deve essere riempito";
				risultato = false;
			}
			
			if(document.modulo2.id_docente.value == ""){
				document.getElementById("err8").innerHTML = "Il campo id_docente deve essere riempito";
				risultato = false;
			}
			if(document.modulo2.max_partecipanti.value == ""){
				document.getElementById("err8").innerHTML = "Il campo max_partecipanti deve essere riempito";
				risultato = false;
			}
			
			return risultato;
		}
	</script>
</body>
</body>
</html>