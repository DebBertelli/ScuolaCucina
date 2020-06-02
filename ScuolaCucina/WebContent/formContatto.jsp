<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contattaci</title>
<style>
input, textarea, label {
	width: 1000px;
	padding: 12px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

textarea {
	height: 200px;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
</head>
<body>
	<h1>Contattaci!</h1>
	<div class="container">
	<form>
		
			<div>
				<label>Email</label> 
				<br> 
				<input type="email" placeholder="example@example.com" required></input>
			</div>
			<br>
			<div>
				<label>Numero di telefono</label>
				<br>
				<input type="number" placeholder="0123456789" required></input>
			</div>
			<br>
			<div>
				<label>Oggetto</label><br> 
				<input type="text" placeholder="Oggetto" required></input>
			</div>
			<br>
			<div>
				<textarea name="text" placeholder="Scrivi un messaggio..." required></textarea>
			</div>
			
			<input type="hidden" name="azione" value="invio">
			<input type="submit" value="Invia" class="bottone bottone-small" onclick="invio()">
		</form>
		</div>
		
		<script>
		function invio(){
			alert('Grazie del messaggio. Ti ricontatteremo il prima possibile!');
			}
		</script>
	
	
</body>
</html>

