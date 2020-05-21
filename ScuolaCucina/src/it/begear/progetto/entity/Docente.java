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
@Table(name = "docenti")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Docente {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_docente")
  private int id_docente;

  @Column(name = "nome_docente")
  private String nome_docente;

  @Column(name = "cognome_docente")
  private String cognome_docente;

  @Column(name = "email_docente")
  private String email_docente;
}
