<%@page import="it.begear.progetto.entity.*"%>
<%@page import="it.begear.progetto.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>	
<link rel="stylesheet" href="css/index.css">	
<body>

<jsp:include page="navbar.jsp"></jsp:include>
<% 
	Utente utente = (Utente) session.getAttribute("utente"); //Session è un oggetto implicito della classe HttpSession
	if(utente==null) session.setAttribute(Utente.IS_ADMIN, false); 
%>

 <!-- Slideshow container -->
<div class="slideshow-container">


  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <img src="image/image1.jpg" style="width:100%">
    
  </div>

  <div class="mySlides fade">
    <img src="image/image2.jpg" style="width:100%">
   
  </div>

  <div class="mySlides fade">
    <img src="image/image3.jpg" style="width:100%">
   
  </div>


</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>

</div>


   <div style="display:inline; width: 50%">

			
			<h1 style="margin-left:25%; margin-right:5%;">La scuola di cucina inarrestabile</h1>
			<hr style="margin-left:25%;">
			<p style="margin-left: 25%;  margin-right:5%;"><i>Siete negati ai fornelli e vorreste iniziare a saper
			 fare qualcosa?
			La vostra passione più grande è cucinare e vi piacerebbe migliorare? 
			 Siete alla ricerca di un modo divertente e stimolante per impegnare qualche ora in settimana? <br>
			 <b>Siete nel posto giusto!</b> Corsi adatti sia ai‘dilettanti’ che a chi già se la cava. 
			<br>
			<br>
			<b>Cook-Vid 19</b> offre i corsi di cucina più accreditati di Milano.Un catalogo ben fornito,
			che spazia dai corsi di cucina base a quelli di pasticceria, torte salate, pizze, focacce, 
 			carne, pesce e più o meno qualsiasi altra cosa vi venga in mente. 
 			<b> Cosa aspetti a iscriverti?!</b> </i></p>

	</div>
			<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
} 
</script>
</html>