package it.begear.progetto.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode

public class Corsi {

	@Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "id_corsi")
	  private int id;
	
    @Column(name="titolo")
	private String titolo;
    
    @Column(name="ore")
	private int durata;
    
    @Column(name="id_docente")
	private String docenti;
    
    @Column(name="max_partecipanti")
	private int maxPartecipanti;
    
   
    
}
