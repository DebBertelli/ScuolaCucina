package it.begear.progetto.service;

import java.util.List;
import it.begear.progetto.dao.DocenteDAO;
import it.begear.progetto.entity.Docente;


public class DocenteService {
	private static DocenteDAO d = new DocenteDAO();

	// Inserisci
	public static void inserisci(Docente docente) {
		d.salvaDocente(docente);
	}

	// Cerca
	public static Docente cerca(int id_docente) {
		return d.leggiDocente(id_docente);
	}

	public static List<Docente> cerca(String cognome_docente) {
		return d.leggiDocente(cognome_docente);
	}

	// Aggiorna
	public static void aggiorna(Docente docente) {
		d.aggiornaDocente(docente);
	}

	// Elimina
	public static void elimina(int id_docente) {
		d.cancellaDocente(id_docente);
	}

	public static void elimina(String cognome_docente) {
		d.cancellaDocente(cognome_docente);
	}
}
