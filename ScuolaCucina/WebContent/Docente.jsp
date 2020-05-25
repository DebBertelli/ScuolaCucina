<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Docente"%>
<%@page import="it.begear.progetto.dao.DocenteDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Docenti</title>
</head>
<body>
<h1>Il nostro corpo docenti</h1>
<p>
<%
List<Docente> docenti = DocenteDAO.leggiTutti(); 
for(Docente d: docenti){ 
%>	
	<p><% out.println(d.getNome_docente());
	out.println(d.getCognome_docente());
	out.println(d.getEmail_docente());
	%></p>
<%
}
%>
</body>
</html>