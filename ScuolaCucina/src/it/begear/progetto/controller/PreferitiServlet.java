package it.begear.progetto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.begear.progetto.dao.CorsoDAO;
import it.begear.progetto.entity.Corso;
import it.begear.progetto.entity.ListaPreferiti;


@WebServlet("/preferiti-servlet")
public class PreferitiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreferitiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Leggo parametro azione
				String azione = request.getParameter("azione");
				
				HttpSession sessione = request.getSession(false);		
				ListaPreferiti preferiti = (ListaPreferiti)sessione.getAttribute("preferiti");
				
				//Aggiungi album
				if(azione.equals("aggiungi")) {
					//Leggo il parametro id
					int id = Integer.parseInt(request.getParameter("id"));
					
					//Aggiungere il corso ai preferiti.
					
					CorsoDAO corsoDAO=new CorsoDAO();
				
					Corso preferito = corsoDAO.leggiCorso(id);
					System.out.println("Trovato corso");
					
					preferiti.aggiungiCorso(preferito);
					System.out.println("Aggiunto corso");
							
					//Tornare nell'elenco corsi
					response.sendRedirect("corso.jsp");
				}else if(azione.equals("rimuovi")) { //Rimuovi corso
					//Leggo il parametro id
					int id = Integer.parseInt(request.getParameter("id"));
					
					//Cerco il corso dalla lista
					CorsoDAO corsoDAO=new CorsoDAO();
					Corso preferito = corsoDAO.leggiCorso(id);
					
					//Rimuovo il corso dalla lista preferiti
					preferiti.rimuoviCorso(preferito);
					
					//Link a home-utente.jsp
					response.sendRedirect("home-utente.jsp");
				}else if(azione.equals("svuota")) { //Svuota lista
					
					preferiti.svuotaLista();
					
					System.out.println("Nella servlet, dopo la rimozione: " + preferiti.getCorsiPreferiti());
					
					response.sendRedirect("home-utente.jsp");
				}	
				
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
