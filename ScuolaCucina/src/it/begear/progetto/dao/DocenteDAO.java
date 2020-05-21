package it.begear.progetto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import it.begear.progetto.entity.Docente;
import it.begear.progetto.utility.HibernateUtil;

public class DocenteDAO {

	public static void salvaDocente(Docente d) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(d);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void aggiornaDocente(Docente d) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.saveOrUpdate(d);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void leggiDocente(int id_docente) {
		Transaction transaction = null;
		Docente d = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			d = session.get(Docente.class, id_docente);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void leggiDocente(String cognome_docente) {
		Transaction transaction = null;
		Docente d = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			d = session.get(Docente.class, cognome_docente);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	@SuppressWarnings("unchecked")
	public static List<Docente> leggiTutti() {
		Transaction transaction = null;
		List<Docente> docenti = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			docenti = session.createQuery("FROM Docente").list();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return docenti;
	}

	public void cancellaDocente(int id_docente) {
		Transaction transaction = null;
		Docente d = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			d = session.get(Docente.class, id_docente);
			session.delete(d);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

}
