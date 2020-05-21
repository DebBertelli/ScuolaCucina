package it.begear.progetto.test;

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

//		List<Docente> docenti = DocenteDAO.leggiTutti();
//		for (Docente d1 : docenti) {
//			System.out.println(d1.toString());
//		}
		
		
		//docenteDao.cancellaDocente(10);

	}

}
