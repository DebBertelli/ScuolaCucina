package it.begear.progetto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.begear.progetto.dao.DocenteDAO;
import it.begear.progetto.entity.Docente;
import it.begear.progetto.entity.Utente;
import it.begear.progetto.service.DocenteService;

/**
 * Servlet implementation class DocenteServlet
 */
@WebServlet("/docente-servlet")
public class DocenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DocenteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String azione = request.getParameter("azione");

		if (azione.equals("cerca")) {
			String cognome_docente = request.getParameter("cognome_docente");
			List<Docente> docenti = DocenteService.cerca(cognome_docente);
			request.setAttribute("docenti", docenti);
			request.getRequestDispatcher("docenti-nome.jsp").forward(request, response);
		} // cerca docente (puoi cercare anche se non sei loggato)
		else {
			HttpSession sessione = request.getSession(false);

			if (sessione != null) {
				Utente utenteCorrente = (Utente) sessione.getAttribute("utente");
				if (utenteCorrente != null) {
					if (azione.equals("elimina")) {
						int id_docente = Integer.parseInt(request.getParameter("id_docente"));
						DocenteService.elimina(id_docente);
						response.sendRedirect("docente.jsp");
					} // elimina docente
					else if (azione.equals("inserisci")) {
						Docente d = new Docente();
						String nome_docente = request.getParameter("nome_docente");
						String cognome_docente = request.getParameter("cognome_docente");
						String email_docente = request.getParameter("email_docente");
						DocenteService.inserisci(d, nome_docente, cognome_docente, email_docente);
						response.sendRedirect("docente.jsp");
					} // inserisci docente
					else if (azione.equals("aggiorna")) {
						int id_docente = Integer.parseInt(request.getParameter("id_docente"));
						String nome_docente = request.getParameter("nome_docente");
						String cognome_docente = request.getParameter("cognome_docente");
						String email_docente = request.getParameter("email_docente");
						Docente docente = new Docente(id_docente, nome_docente, cognome_docente, email_docente);
						DocenteDAO dao = new DocenteDAO();
						dao.aggiornaDocente(docente);
						response.sendRedirect("docente.jsp");
					} // aggiorna docente
				} // utenteCorrente!=null
				else {
					String messaggio = "Effettua la login prima di compiere un'operazione";
					request.setAttribute("messaggio", messaggio);
					request.getRequestDispatcher("docente.jsp").forward(request, response);
				} // utenteCorrente==null

			} else {
				String messaggio = "Effettua la login prima di compiere un'operazione";
				request.setAttribute("messaggio", messaggio);
				request.getRequestDispatcher("docente.jsp").forward(request, response);
			} // sessione==null
		} // azione!=cerca
	}// doGet()

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
