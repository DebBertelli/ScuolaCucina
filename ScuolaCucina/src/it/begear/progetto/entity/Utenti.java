package it.begear.progetto.entity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "utenti")
public class Utenti {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_utente")
	private int id;
	
	@Column(name = "nome_utente")
	private String nome_utente;
	
	@Column(name="cognome_utente")
	private String cognome_utente;
	
	@Column(name="email_utente")
	private String email_utente;
	
	@Column(name="username")
	private String username;
	
	@Column(name="psw")
	private String psw;
	
	public Utenti() {
	}

	public Utenti(String nome_utente, String cognome_utente, String email_utente, String username, String psw) {
		this.nome_utente=nome_utente;
		this.cognome_utente=cognome_utente;
		this.email_utente=email_utente;
		this.username=username;
		this.psw=psw;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome_utente() {
		return nome_utente;
	}

	public void setNome(String nome_utente) {
		this.nome_utente = nome_utente;
	}

	public String getCognome() {
		return cognome_utente;
	}

	public void setCognome(String cognome) {
		this.cognome_utente = cognome_utente;
	}

	

	
	public String getEmail_utente() {
		return email_utente;
	}

	public void setEmail_utente(String email_utente) {
		this.email_utente = email_utente;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	@Override
	public String toString() {
		return "Utenti [id=" + id + ", nome_utente=" + nome_utente + ", cognome_utente=" + cognome_utente
				+ ", email_utente=" + email_utente + ", username=" + username + ", psw=" + psw + "]";
	}




	

	
	
}