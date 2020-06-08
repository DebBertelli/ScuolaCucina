<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/style.css">

<title>Contattaci</title>

</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<h1>Contattaci!</h1>
	<div class="container">
	<form onsubmit="invio()" method="post">
		
			<div class="row">
				<div class="col-25">
				<label>Email</label> 
			</div>
		</div>
			<div class="row">
				<div class="col-25">
				<input type="email" placeholder="example@example.com" name="mail" required></input>
			</div>
		</div>
			
		<div class="row">
				<div class="col-25">
				<label>Numero di telefono</label>
			</div>
		</div>
		
		<div class="row">
			<div class="col-75">
				<input type="number" placeholder="0123456789" name="tel" required></input>
			</div>
		</div>
		<div class="row">
			<div class="col-75">
				<label>Oggetto</label><br> 
				<input type="text" placeholder="Oggetto" name="obj" required></input>
			</div>
		</div>
		<div class="row">
			<div class="col-75">
				<textarea name="text" placeholder="Scrivi un messaggio..." required></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-75">
			<input type="submit" value="Invia" class="bottone bottone-small">
		</div>
		</div>
		</form>
		</div>
		
		<script>
		function invio(){
			alert('Grazie del messaggio. Ti ricontatteremo il prima possibile!')
		}
		</script>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

