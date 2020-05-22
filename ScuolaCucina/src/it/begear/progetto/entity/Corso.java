package it.begear.progetto.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "corsi")
@AllArgsConstructor
@NoArgsConstructor
@Data

public class Corso {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_corsi")
    private int id;
	
    @Column(name="titolo")
	private String titolo;
    
    @Column(name="ore")
	private int durata;
    
    @Column(name="id_docente")
	private int docente;
    
    @Column(name="max_partecipanti")
	private int maxPartecipanti;
    
   
    
}
