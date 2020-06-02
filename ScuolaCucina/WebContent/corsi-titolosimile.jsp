<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

			List<Corso> corsi = (List<Corso>)request.getAttribute("corsi");

			if (corsi.isEmpty()) {
		%>
		<h2>La ricerca non ha prodotto risultati</h2>
		<a href="cerca.jsp">&larr; Riprova</a>
		<%
			}
		
		%>
	
				<%
					for (Corso corso : corsi) {
				%>
				
					<a href="homeCorso.jsp?id=<%=corso.getId()%>"><%=corso.getTitolo()%></a> 
				
						<form action="CorsoServlet" method="get">
							<input type="hidden" name="idArtista"
								value="<%=corso.getId()%>"> <input type="hidden"
								name="azione" value="delete"> <input type="submit"
								value="&times;" class="btn btn-outline-warning rounded-pill">
						</form>
				</div>
				<%
					}
		
				
			%>
<jsp:include page="footer.jsp"></jsp:include>			
</body>
</html>