package it.begear.progetto.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import it.begear.progetto.entity.Amministratori;
import it.begear.progetto.entity.Docenti;
import it.begear.progetto.entity.Utenti;



public class Test {

	public static void main(String[] args) {
		/*List<Utenti> listaUtenti = read();
		for(Utenti user: listaUtenti) {
			System.out.println(user.toString());
		}*/
		
		List<Docenti> listaDocenti = read2();
		for(Docenti docente: listaDocenti) {
			System.out.println(docente.toString());
		}

		List<Amministratori> listaAdmin = leggiAdmin();
		for (Amministratori admin : listaAdmin) {
			System.out.println(admin.toString());
		}
	}

	public static SessionFactory getSessionFactory() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		Metadata metadata = new MetadataSources(ssr).getMetadataBuilder().build();
		SessionFactory sFactory = metadata.getSessionFactoryBuilder().build();
		return sFactory;
	}

	public static List<Utenti> read() {
		Session session = getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Utenti> utenti = session.createQuery("FROM Utenti").list();
		session.close();
		System.out.println("Trovati " + utenti.size() + " utenti");
		return utenti;

	}

	public static List<Amministratori> leggiAdmin() {
		Session session = getSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Amministratori> admin = session.createQuery("FROM Amministratori").list();
		session.close();
		System.out.println("Trovati " + admin.size() + " amministratori");
		return admin;

	}

}
