/**
 * Valida form 
 */

function valida() {

	var risultato = true;

	if (document.modulo2.titolo.value == "") {
		document.getElementById("eTitolo").innerHTML = "Il campo titolo deve essere riempito";
		risultato = false;
	}

	if (document.modulo2.ore.value == "") {
		document.getElementById("eOre").innerHTML = "Il campo ore deve essere riempito";
		risultato = false;
	}

	if (document.modulo2.max_partecipanti.value == "") {
		document.getElementById("eMaxPArtecipanti").innerHTML = "Il campo max_partecipanti deve essere riempito";
		risultato = false;
	}

	return risultato;
}

function changeNavSelect(itemMenu) {
	var children = [].slice.call(document.getElementsByClassName("topnav")[0].children);
	children.forEach(function(item){
		item.classList.remove("active");
		if(itemMenu == item.innerHTML) item.classList.add("active");
	});
}