package it.begear.progetto.controller;

import it.begear.progetto.dao.*;
import it.begear.progetto.entity.Utente;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class UtenteServlet
 */
@WebServlet("/utente-servlet")
public class UtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UtenteServlet() {
        super();
  
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Leggo il parametro azione
				String azione = request.getParameter("azione");

				// Registrazione
				if (azione.equals("registrazione")) {
					// Leggo i parametri username, nome, cognome, email, password
					String nome_utente = request.getParameter("nome_utente");
					String cognome_utente = request.getParameter("cognome_utente");
					String email_utente = request.getParameter("email_utente");
					String username = request.getParameter("username");
					String psw = request.getParameter("psw");
					
					UtenteDAO utenteDAO = new UtenteDAO();
					
					Utente user = new Utente();
					user.setNome_utente(nome_utente);
					user.setCognome_utente(cognome_utente);
					user.setEmail_utente(nome_utente);
					user.setUsername(username);
					user.setPsw(psw);
					
					// Invoco il metodo registrazione
					boolean ok = UtenteDAO.salvaUtente(user);

					// Se tutto ok, inviare con un messaggio di conferma la risposta a login.jsp
					if (ok) {
						String messaggio = "Registrazione effettuata, ora procedi con la login";
						request.setAttribute("messaggio", messaggio);
						request.getRequestDispatcher("login.jsp").forward(request, response);
					} else { // Altrimenti, inviare con un messaggio di errore la risposta a
								// registrazione.jsp
						String messaggio = "Registrazione fallita: username non è disponinibile, ritenta";
						request.setAttribute("messaggio", messaggio);
						request.getRequestDispatcher("registrazione.jsp").forward(request, response);
					}

				}else if(azione.equals("login")) { // Login
					//Leggo i parametri nickname e password
					String username = request.getParameter("username");
					String psw = request.getParameter("psw");
					
					//Chiamo il metodo login
					Boolean ok = UtenteDAO.verificaUtente(username, psw);
				
					//Se tutto ok, link a index.jsp
					if(ok) {
						response.sendRedirect("index.jsp");
					}else {//Altrimenti, link a login.jsp con un messaggio di errore
						String messaggio = "Login fallita, ritenta";
						request.setAttribute("messaggio", messaggio);
						request.getRequestDispatcher("login.jsp").forward(request, response);
						
					}
					
				}
		
	}

}
				

