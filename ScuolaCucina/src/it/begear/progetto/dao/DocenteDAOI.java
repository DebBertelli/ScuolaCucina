package it.begear.progetto.dao;

import java.util.List;

import it.begear.progetto.entity.Docente;

public interface DocenteDAOI {
	//CREATE
	void salvaDocente(Docente d); 
	
	//READ
	Docente leggiDocente(int id_docente); //cerca per id
	List<Docente> leggiDocente(String cognome_docente); //cerca per cognome (restituisce lista di docenti con quel cognome)

	//UPDATE
	void aggiornaDocente(Docente d); 
	
	//DELETE
	void cancellaDocente(int id_docente);
	int cancellaDocente(String cognome_docente); 
	
	
	

}
