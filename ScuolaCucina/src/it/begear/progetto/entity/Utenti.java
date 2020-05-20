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
import lombok.ToString;

@Entity
@Table(name = "utenti")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Utenti {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_utente")
  private int id;

  @Column(name = "nome_utente")
  private String nome_utente;

  @Column(name = "cognome_utente")
  private String cognome_utente;

  @Column(name = "email_utente")
  private String email_utente;

  @Column(name = "username")
  private String username;

  @Column(name = "psw")
  private String psw;
}