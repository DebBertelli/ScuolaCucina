<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione</title>
</head>
<body style="background-size: 100%">
	<h2>Cuciniamolo</h2>
	<br>
	<h2>Registrazione</h2>
	<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<p class="error-js"><%=messaggio%></p>
	<%
		}
	%>
	<form action="utente-servlet" method="post" name="modulo" onsubmit="return valida()">
		<div>Nome</div>
		<input type="text" name="nome_utente"><div class="error-js" id="eNome"></div>
		<div>Cognome</div>
		<input type="text" name="cognome_utente"><div class="error-js" id="eCognome"></div>
		<div>Email</div>
		<input type="email" name="email_utente"><div class="error-js" id="eEmail"></div>
		<div>Username</div>
		<input type="text" name="username"><div class="error-js" id="eUsername"></div>
		<div>Password</div>
		<input type="password" name="psw"><div class="error-js" id="ePassword"></div>
		<div>Conferma password</div>
		<input type="password" name="conferma"><div class="error-js" id="eConferma"></div>
		<input type="hidden" name="azione" value="registrazione"> <input
			type="submit" value="Registrati">
	</form>
	<a style="margin-bottom: 50px" href="login.jsp">Oppure effettua la
		login</a>
	<script>
		function valida() {

			var risultato = true; //suppongo che non ci siano errori nel form


			//se il campo nome è vuoto, non posso andare avanti
			if (document.modulo.nome_utente.value == "") {
				document.getElementById("eNome").innerHTML = "Il campo nome deve essere riempito";

				risultato = false;
			}

			//se il campo cognome è vuoto, non posso andare avanti
			if (document.modulo.cognome_utente.value == "") {
				document.getElementById("eCognome").innerHTML = "Il campo cognome deve essere riempito";

				risultato = false;
			}

			//se il campo email è vuoto, non posso andare avanti
			if (document.modulo.email_utente.value == "") {
				document.getElementById("eEmail").innerHTML = "Il campo email deve essere riempito";

				risultato = false;
			}

			//se il campo username è vuoto, non posso andare avanti
			if (document.modulo.username.value == "") {
				document.getElementById("eUsername").innerHTML = "Il campo username deve essere riempito";

				risultato = false;
			}

			//se il campo cognome è vuoto, non posso andare avanti
			if (document.modulo.psw.value == "") {
				document.getElementById("ePassword").innerHTML = "Il campo password deve essere riempito";

				risultato = false;
			}

	

			if (document.modulo.psw.value != document.modulo.conferma.value) {
				document.getElementById("ePassword").innerHTML = "Le password non coincidono";

				risultato = false;
			}

			//se il campo cognome è vuoto, non posso andare avanti
			if (document.modulo.conferma.value == "") {
				document.getElementById("eConferma").innerHTML = "Il campo conferma deve essere riempito";

				risultato = false;
			}

			return risultato;
		}
	</script>
</body>
</html>