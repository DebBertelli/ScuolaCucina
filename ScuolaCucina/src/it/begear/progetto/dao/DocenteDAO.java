package it.begear.progetto.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import it.begear.progetto.entity.Docente;
import it.begear.progetto.utility.HibernateUtil;

public class DocenteDAO implements DocenteDAOI {

	public void salvaDocente(Docente d) {
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
	} // salvaDocente()

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
	}// aggiornaDocente()

	public Docente leggiDocente(int id_docente) {
		Docente d = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			d = session.get(Docente.class, id_docente);
		} catch (Exception e) {
			throw e;
		}
		return d;
	} // leggiDocente() per id

	@SuppressWarnings("unchecked")
	public List<Docente> leggiDocente(String cognome_docente) {
		List<Docente> docenti = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			docenti = session.createQuery("FROM Docente DOC WHERE DOC.cognome_docente = :cognome")
					.setParameter("cognome", cognome_docente).list();
		} catch (Exception e) {
			throw e;
		}
		return docenti; // lista di docenti con quel cognome
	} // leggiDocente() per cognome

	@SuppressWarnings("unchecked")
	public static List<Docente> leggiTutti() {
		List<Docente> docenti = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			docenti = session.createQuery("FROM Docente").list();
		} catch (Exception e) {
			throw e;
		}
		return docenti;
	} // leggiTutti()

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
	}// cancellaDocente() per id

	@SuppressWarnings("rawtypes")
	public int cancellaDocente(String cognome_docente) {
		int docentiCancellati=0;
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			Query query = session.createQuery("delete Docente where cognome_docente = :cognome");
			query.setParameter("cognome", cognome_docente);
			docentiCancellati = query.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return docentiCancellati;
	}

}
