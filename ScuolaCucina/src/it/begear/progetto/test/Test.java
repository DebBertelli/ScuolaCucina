package it.begear.progetto.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import it.begear.progetto.entity.Docente;
import it.begear.progetto.entity.Amministratore;
import it.begear.progetto.entity.Utente;



public class Test {

	public static void main(String[] args) {

		/*List<Utenti> listaUtenti = read();
		for(Utenti user: listaUtenti) {
			System.out.println(user.toString());
		}*/
		
		List<Docente> listaDocenti = read2();
		for(Docente docente: listaDocenti) {
			System.out.println(docente.toString());
		}

		List<Amministratore> listaAdmin = leggiAdmin();
		for (Amministratore admin : listaAdmin) {
			System.out.println(admin.toString());
		}
	}

	public static SessionFactory getSessionFactory() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata metadata = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory sFactory = metadata.getSessionFactoryBuilder().build();
		return sFactory;
	}

	public static List<Utente> read() {
		Session session = getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Utente> utenti = session.createQuery("FROM Utente").list();
		session.close();
		System.out.println("Trovati " + utenti.size() + " utenti");
		return utenti;

	}
	
	public static List<Amministratore> leggiAdmin() {
		Session session = getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Amministratore> admin = session.createQuery("FROM Amministratore").list();
		session.close();
		System.out.println("Trovati " + admin.size() + " amministratori");
		return admin;

	}


	public static List<Docente> read2() {
		Session session = getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Docente> docenti = session.createQuery("FROM Docente").list();
		session.close();
		System.out.println("Trovati " + docenti.size() + " docenti");
		return docenti;

	}	


}
