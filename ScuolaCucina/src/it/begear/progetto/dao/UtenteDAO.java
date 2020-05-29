package it.begear.progetto.dao;






import org.hibernate.Session;
import org.hibernate.Transaction;

import org.hibernate.exception.ConstraintViolationException;

import it.begear.progetto.entity.Utente;
import it.begear.progetto.utility.HibernateUtil;

public class UtenteDAO {
	
	
	// registrazione nuovo utente
	public boolean salvaUtente(Utente user) {
		
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			 // inizia la transaction
			transaction = session.beginTransaction();
			 //salva un nuovo utente
			session.save(user);
			transaction.commit();
			return true;
			
		}catch (ConstraintViolationException e) {
			
			System.out.println("Username già presente nel db");
			return false;

		}catch(Exception e) {
			
				e.printStackTrace();
				if (transaction != null) {
				
				transaction.rollback();
			}
			
			return false;
			
		} 
			
		
		
	} 
	
	
	
	
	  public Utente verificaUtente(String username, String psw) {

        Transaction transaction = null;
        Utente user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // inizia la transaction
            transaction = session.beginTransaction();
            // prende un oggetto di tipo utente creando una query sulla base dell'username (unique)
           Utente userok = (Utente) session.createQuery("FROM Utente U WHERE U.username = :username").setParameter("username", username)
                .uniqueResult();
            // ne verifica la password inserita
            if (userok != null && userok.getPsw().equals(psw)) {
            	
                return userok;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }

}
