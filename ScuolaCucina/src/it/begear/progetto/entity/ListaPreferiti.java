package it.begear.progetto.entity;

import java.util.HashSet;

public class ListaPreferiti {
	
private HashSet<Corso> corsiPreferiti = new HashSet<Corso>();
	
	public ListaPreferiti() {
	}
	
	public void aggiungiCorso(Corso corso) {
		corsiPreferiti.add(corso);
	}
	
	public void rimuoviCorso(Corso corso) {
		corsiPreferiti.remove(corso);
	}
	
	public void svuotaLista() {
		corsiPreferiti = new HashSet<Corso>();		
	}

	public HashSet<Corso> getCorsiPreferiti() {
		return corsiPreferiti;
	}

	public void setAlbumPreferiti(HashSet<Corso> corsiPreferiti) {
		this.corsiPreferiti = corsiPreferiti;
	}

	@Override
	public String toString() {
		return "ListaPreferiti [albumPreferiti=" + corsiPreferiti + "]";
	}

}
