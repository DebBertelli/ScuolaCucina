/**
 * Valida form 
 */

function valida() {

	var risultato = true;

	if (document.modulo2.titolo.value == "") {
		document.getElementById("err6").innerHTML = "Il campo titolo deve essere riempito";
		risultato = false;
	}

	if (document.modulo2.ore.value == "") {
		document.getElementById("err7").innerHTML = "Il campo ore deve essere riempito";
		risultato = false;
	}

	if (document.modulo2.id_docente.value == "") {
		document.getElementById("err8").innerHTML = "Il campo id_docente deve essere riempito";
		risultato = false;
	}
	if (document.modulo2.max_partecipanti.value == "") {
		document.getElementById("err8").innerHTML = "Il campo max_partecipanti deve essere riempito";
		risultato = false;
	}

	return risultato;
}