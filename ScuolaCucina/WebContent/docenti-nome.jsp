<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.entity.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
<%@include file="/css/divTable.css"%>
<%@include file="/css/style.css"%>
</style>
<title>Risultati ricerca</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<%

			List<Docente> docenti = (List<Docente>)request.getAttribute("docenti");

			if (docenti.isEmpty()) {
		%>
		<h2>La ricerca non ha prodotto risultati</h2>
		<a href="cerca.jsp">&larr; Riprova</a>
		<%
			} else {
				Boolean isAdmin = (Boolean) session.getAttribute(Utente.IS_ADMIN);
				String cognome = docenti.get(0).getCognome_docente();
		%>
		<h2>
			Risultati per il cognome
			<%=cognome%></h2>
		<div class="divTableDocente">
		<div class="headRow">
			<div class="divCell">Docente</div>
			<div class="divCell" align="right"></div>
		</div> <!-- headRow -->
				<%
					for (Docente d : docenti) {
				%>
					<div class="divRow">
						<div class="divCell">
							<a href="homeDocente.jsp?id_docente=<%=d.getId_docente()%>"><%=d.getNome_docente()%> <%=d.getCognome_docente()%></a> 
						</div>
						<div class="divCell">
						<%
							if (isAdmin != null && isAdmin){
						%>
								<form action="docente-servlet" method="get">
									<input type="hidden" name="idArtista"
										value="<%=d.getId_docente()%>"> <input type="hidden"
										name="azione" value="elimina"> <input type="submit"
										value="Elimina" class="btn btn-outline-warning rounded-pill">
								</form>
						</div>
					</div>
				<%
					}//if
		
				}//for
			}//else
			%>
			</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	<%@ include file="/js/validate.js" %>
	changeNavSelect("DOCENTI");
</script>
</html>