<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corsi</title>
</head>
<body>
	<a href="index.jsp">Torna alla home</a>
	<h1>I nostri corsi</h1>
	
	 <table border="1" cellpadding="5">
		<tr>
			<th>Id</th>
			<th>Titolo</th>
			<th>Ore</th>
			<th>Id_docente</th>
			<th>max_Partecipanti</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		 <c:forEach var="corso" items="${listaCorsi}">
			<tr>
				<td>${'${'}corso.id}</td>
				<td>${'${'}corso.titolo}</td>
				<td>${'${'}corso.ore}</td>
				<td>${'${'}corso.id_docente}</td>
				<td>${'${'}corso.max_partecipanti}</td>

				<td>
					<form action="<c:url value="/corso/delete"/>" method="post">
						<input type="hidden" name="Id" value="${'${'}corso.id}"> <input
							style="background: #F00;" type="submit" value="Delete">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>