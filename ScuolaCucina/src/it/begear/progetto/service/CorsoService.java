package it.begear.progetto.service;

import java.util.List;

import it.begear.progetto.dao.CorsoDAO;
import it.begear.progetto.entity.Corso;

public class CorsoService {

	static CorsoDAO c = new CorsoDAO();

	// Inserisci
	public static void inserisci(Corso corso, String titolo, int ore, int id_docente, int maxPartecipanti) {
		corso.setTitolo(titolo);
		corso.setOre(ore);
		corso.setId_docente(id_docente);
		corso.setMaxPartecipanti(maxPartecipanti);
		c.salvaCorso(corso);
	}

	// Cerca
	public static Corso cerca(int id) {
		return c.leggiCorso(id);
	}

	public static List<Corso> cerca(String titolo) {
		return c.leggiCorso(titolo);
	}

	public static List<Corso> listaCorsi() {
		return CorsoDAO.leggiTutti();
	}

	// Aggiorna
	public static void aggiorna(Corso corso) {
		c.aggiornaCorso(corso);
	}

	// Elimina
	public static void elimina(int id) {
		c.cancellaCorso(id);
	}

}
