package it.begear.progetto.test;

import it.begear.progetto.dao.DocenteDAO;
import it.begear.progetto.dao.UtenteDAO;
import it.begear.progetto.entity.Docente;
import it.begear.progetto.entity.Utente;

public class TestUtenteDAO {

	public static void main(String[] args) {
		
		UtenteDAO utenteDao = new UtenteDAO();
		Utente u = new Utente();
		u.setNome_utente("Gianmarco");
		u.setCognome_utente("Tozzi");
		u.setEmail_utente("gianmeari@gmail.com");
		
		u.setUsername("gianmarcotozzi");
		u.setPsw("gianamarco");
		utenteDao.salvaUtente(u);
		
		//Utente u2=new Utente(12,"Gianmarco","Tozzi","gianmarcotozzi@gmail.com","gianmarcotozzi","gianmarco");
		//UtenteDAO user=new UtenteDAO();
		
		//System.out.println(user.salvaUtente(u2));
		
		//System.out.println(user.verificaUtente("gianmarcotozzi", "cane"));
		
	}

}
