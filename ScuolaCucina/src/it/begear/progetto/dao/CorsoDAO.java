package it.begear.progetto.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import it.begear.progetto.entity.Corso;
import it.begear.progetto.utility.HibernateUtil;

public class CorsoDAO {

	public void salvaCorso(Corso corso) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(corso);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void aggiornaCorso(Corso corso) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(corso);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void cancellaCorso(int id) {
		Transaction transaction = null;
		Corso corso = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			corso = session.get(Corso.class, id);
			session.delete(corso);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public Corso leggiCorso(int id) {
		Corso corso = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			corso = session.get(Corso.class, id);
		} catch (Exception e) {
			throw e;
		}
		return corso;
	} // leggiCorso() per id

	@SuppressWarnings("unchecked")
	public List<Corso> leggiCorso(String titolo) {
		List<Corso> corsi = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			corsi = session.createQuery("FROM Corso WHERE titolo = :titolo").setParameter("titolo", titolo).list();
		} catch (Exception e) {
			throw e;
		}
		return corsi;
		// lista di corsi con quel titolo
	} // leggiCorso() per titolo
	
	@SuppressWarnings("unchecked")
	public List<Corso> leggiCorsoD(int id_docente) {
		List<Corso> corsi = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			corsi = session.createQuery("FROM Corso WHERE id_docente = :id_docente").setParameter("id_docente", id_docente).list();
		} catch (Exception e) {
			throw e;
		}
		return corsi;
		// lista di corsi con quel id_docente
	} // leggiCorsoD() per id_docente

	@SuppressWarnings("unchecked")
	public static List<Corso> leggiTutti() {
		List<Corso> corsi = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			corsi = session.createQuery("FROM Corso").list();
		} catch (Exception e) {
			throw e;
		}
		return corsi;
	} // leggiTutti()

}
