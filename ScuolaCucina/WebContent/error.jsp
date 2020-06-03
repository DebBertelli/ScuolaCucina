<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body style="background-size: 100%">
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>