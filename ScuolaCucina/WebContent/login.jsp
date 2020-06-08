<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <style type="text/css">
     <%@ include file="/css/login.css" %>
   </style>
</head>

<body style="background-size: 100%">
 <div class="container">
	<h2>Cuciniamolo</h2>
	<br>
	<h2>Login</h2>
	<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<p><%=messaggio%></p>
	<%
		}
	%>
	<form action="utente-servlet" method="post" name="modulo"
		onsubmit="return valida()">
		<div>Username</div>
		<input type="text" name="username"><div class="error-js" id="eUsername"></div><br>
		<div>Password</div>
		<input type="password" name="psw"><br><div class="error-js" id="ePassword"></div>
		<input type="hidden" name="azione" value="login">
		<input type="submit" value="Login">
	</form>
	<a href="registrazione.jsp">Oppure registrati</a>
	</div>
	<script>
		function valida() {

			var risultato = true; //suppongo che non ci siano errori nel form

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

			return risultato;
		}
	</script>
</body>
</html>