package it.begear.progetto.service;

import java.util.List;


import it.begear.progetto.dao.DocenteDAO;
import it.begear.progetto.entity.Docente;


public class DocenteService {
	private static DocenteDAO doc = new DocenteDAO();

	// Inserisci
	public static void inserisci(Docente docente, String nome, String cognome, String email) {
		docente.setNome_docente(nome);
		docente.setCognome_docente(cognome);
		docente.setEmail_docente(email);
		doc.salvaDocente(docente);
	}

	// Cerca
	public static Docente cerca(int id_docente) {
		return doc.leggiDocente(id_docente);
	}

	public static List<Docente> cerca(String cognome_docente) {
		return doc.leggiDocente(cognome_docente);
	}

	// Aggiorna
	public static void aggiorna(int id_docente, String nome_docente, String cognome_docente, String email_docente) {
		Docente d = doc.leggiDocente(id_docente);
		d.getId_docente();
		d.setNome_docente(nome_docente);
		d.setCognome_docente(cognome_docente);
		d.setEmail_docente(email_docente);
		doc.aggiornaDocente(d);
	}

	// Elimina
	public static void elimina(int id_docente) {
		doc.cancellaDocente(id_docente);
	}

	public static void elimina(String cognome_docente) {
		doc.cancellaDocente(cognome_docente);
	}
}
