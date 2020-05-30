<%@page import="it.begear.progetto.dao.DocenteDAO"%>
<%@page import="it.begear.progetto.service.CorsoService"%>
<%@page import="it.begear.progetto.dao.CorsoDAO"%>
<%@page import="java.util.List"%>
<%@page import="it.begear.progetto.entity.Corso"%>
<%@page import="it.begear.progetto.entity.Docente"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<style type="text/css">
	.divTable
	    {
	      display:  table;
	      width:auto;
	      border-spacing:5px;/*cellspacing:poor IE support for  this*/
	       /* border-collapse:separate;*/
	    }
	
	    .divRow
	    {
	      display:table-row;
	      width:auto;
	      border-bottom: 2px solid #dee2e6;
	    }
	
	    .divCell
	    {
	        float:left;/*fix for  buggy browsers*/
	        display:table-column;
	        min-width:150px;
	        height:25px;
	    }
	    
	    .divCell a {
		    float: left;
		    color: #C82C02;
		    text-align: center;
		    text-decoration: none;
		    font-size: 14px;
		}
	
		.headRow{
		   font-size: 1.3rem;
		   font-weight: 400;
		   text-align: inherit;
		   vertical-align: top;
		   border-top: 1px solid #dee2e6;
		   vertical-align: bottom;
		   border-bottom: 2px solid #dee2e6;
		   background-color: #EDA340;
	       overflow: hidden;
		   color: white;
		   padding: 9px 8px;
		}
		
		*, ::after, ::before {
		    box-sizing: border-box;
		}
		
		a.button {
		    -webkit-appearance: button;
		    -moz-appearance: button;
		    appearance: button;
		    text-decoration: none;
		    color: initial;
		}
	</style>
	<title>I nostri Corsi</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>


	<h3>I nostri corsi</h3>
	<%
		List<Corso> corsi = CorsoService.listaCorsi();
	%>

	<div class="divTable">
		<div class="headRow">
			<div class="divCell">Titolo</div>
			<div class="divCell">Ore</div>
			<div class="divCell">Docente</div>
			<div class="divCell">Max Partecipanti</div>
			<div class="divCell"></div>
		</div>
		<%
			for (Corso c : corsi) {
				DocenteDAO docenteDoa = new DocenteDAO();
				Docente docente = docenteDoa.leggiDocente(c.getId_docente());
		%>
		<div class="divRow">
			<div class="divCell">
				<a href="homeCorso.jsp?id=<%=c.getId()%>"><%=c.getTitolo()%></a>
			</div>
			<div class="divCell"><%=c.getOre()%></div>
			<div class="divCell">
				<a href="homeDocente.jsp?id=<%=docente.getId_docente()%>"><%=String.format("%s %s", docente.getNome_docente(), docente.getCognome_docente())%></a>
			</div>
			<div class="divCell"><%=c.getMaxPartecipanti()%></div>
			<div class="divCell" align="center">
				<form action="CorsoServlet" method="get">
					<input type="hidden" name="id" value="<%=c.getId()%>">
					<input type="hidden" name="azione" value="delete"> 
					<input type="submit" value="Elimina" class="btn rounded-pill btn-blu">
				</form>
			</div>
		</div>
		<%
			}
		%>
		<div class="divRow">
			<div class="divCell"></div>
			<div class="divCell"></div>
			<div class="divCell"></div>
			<div class="divCell" align="right">
				<div class="the-icons span3" title="">
					<a class="button" href="inserisciCorso.jsp?">
						<i class="demo-icon icon-layers">&#xe800;</i> 
						<span class="i-name">Inserisci un nuovo corso</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	<%@ include file="/js/validate.js" %>
	changeNavSelect("CORSI");
</script>
</html>