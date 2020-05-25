<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body style="background-size: 100%">
	<h1 class="titolo">Cuciniamolo</h1>
	<br>
	<h1 class="errore">ERRORE</h1>
	<br>
	<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<p class="messaggio"><%=messaggio%></p>
	<%
		}
	%>
	<a href="index.jsp" class="bottone">Torna alla home</a>
</body>
</html>