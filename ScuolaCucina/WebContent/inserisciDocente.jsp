<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserisci docente</title>
<style type="text/css">
<%@ include file="/css/form.css" %>
</style>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
			<h1 id="docente">Inserisci un nuovo docente</h1>
			<form action="docente-servlet" method="get" name="modulo2" onsubmit="return valida2()">
				<label>Nome</label> 
				<input type="text" name="nome_docente" placeholder="Inserici nome"> 
				<span id="eNome"></span> 
				<br> 
				<label>Cognome</label> 
				<input type="text" name="cognome_docente" placeholder="Inserici cognome"> 
				<span id="eCognome"></span> 
				<br> 
				<label>Email_docente</label>
				<input type="text" name="email_docente" placeholder="Inserici email"> 
				<span id="eMail"></span> 
				<br>
				<div class="row">
					<input type="hidden" name="azione" value="inserisci">
		            <input type="submit" value="Inserisci" class="btn rounded-pill btn-blu">
				</div>
				<jsp:include page="footer.jsp"></jsp:include>
			</form>
		</div>
	    <script type="text/javascript">
		function valida2() {
			
			var risultato = true;
			
			if(document.modulo2.nome_docente.value == ""){
				document.getElementById("eNome").innerHTML = "Il campo nome deve essere riempito";
				risultato = false;
			}
			
			if(document.modulo2.cognome_docente.value == ""){
				document.getElementById("eCognome").innerHTML = "Il campo cognome deve essere riempito";
				risultato = false;
			}
			
			if(document.modulo2.email_docente.value == ""){
				document.getElementById("eMail").innerHTML = "Il campo email deve essere riempito";
				risultato = false;
			}
			
			return risultato;
		}
	  </script>
</body>
</html>