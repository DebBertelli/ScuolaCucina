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
@Table(name = "amministratori")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Amministratore {
	 @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name = "id_admin")
	  private int id_admin;

	  @Column(name = "username")
	  private String username;

	  @Column(name = "psw")
	  private String psw;
}
