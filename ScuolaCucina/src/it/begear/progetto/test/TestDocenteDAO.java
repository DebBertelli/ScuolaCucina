package it.begear.progetto.test;


import java.util.List;

import it.begear.progetto.dao.DocenteDAO;
import it.begear.progetto.entity.Docente;

public class TestDocenteDAO {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		DocenteDAO docenteDao = new DocenteDAO();
		Docente d = new Docente();
		d.setNome_docente("Gianni");
		d.setCognome_docente("Verdi");
		d.setEmail_docente("giovanni.verdi@gmail.com");
		docenteDao.salvaDocente(d);

		List<Docente> listaDocenti = docenteDao.leggiDocente("Verdi");
		System.out.println("I docenti con Verdi come cognome sono: "+listaDocenti);
		assert (listaDocenti.size() > 0);
		

		List<Docente> tuttiDocenti = DocenteDAO.leggiTutti();
		System.out.println("Ora tutti i docenti sono: "+tuttiDocenti);
		assert (tuttiDocenti.size() > 0);

		Docente docente = docenteDao.leggiDocente(1);
		System.out.println("Il docente con id 1: "+ docente.toString());
		assert docente != null;

		int cancellati = docenteDao.cancellaDocente("Verdi");
		assert (cancellati == 1);
		listaDocenti = docenteDao.leggiDocente("Verdi");
		assert (listaDocenti.size() == 0);
		
		tuttiDocenti = DocenteDAO.leggiTutti();
		System.out.println("Ora tutti i docenti sono: "+tuttiDocenti);

	}

}
