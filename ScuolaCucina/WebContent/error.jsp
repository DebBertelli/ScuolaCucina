<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body style="background-size: 100%">
	<br>
	<h1>ERRORE</h1>
	<br>
	<%
		String messaggio = (String) request.getAttribute("messaggio");
		if (messaggio != null) {
	%>
	<p class="messaggio"><%=messaggio%></p>
	<%
		}
	%>
	<a href="index.jsp">Torna alla home</a>

</body>
</html>