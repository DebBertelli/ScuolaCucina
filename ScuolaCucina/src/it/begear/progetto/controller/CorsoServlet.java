package it.begear.progetto.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.begear.progetto.dao.CorsoDAO;
import it.begear.progetto.entity.Corso;
import it.begear.progetto.entity.Utente;
import it.begear.progetto.service.CorsoService;

@WebServlet("/CorsoServlet")
public class CorsoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String azione = request.getParameter("azione");

		if (azione.equals("cercaPerKey")) {
			try {
				switch (azione) {
				case "cercaPerKey":
					corsiPerKeyword(request, response);
					break;
				} //try
			} catch (SQLException ex) {
				throw new ServletException(ex);
			} //catch
		}//"cercaPerKey"(cerca match anche parziali) 
		else{
			HttpSession sessione = request.getSession(false);

			if (sessione != null) {
				Utente utenteCorrente = (Utente) sessione.getAttribute("utente");
				if (utenteCorrente != null) {
					try {
						switch (azione) {

						case "insert":
							inserisciCorso(request, response);
							break;
						case "delete":
							eliminaCorso(request, response);
							break;
						case "update":
							aggiornaCorso(request, response);
							break;
						default:
							listaCorsi(request, response);
							break;
						}
					} catch (SQLException ex) {
						throw new ServletException(ex);
					}
				} else {
					String messaggio = "Effettua la login prima di compiere un'operazione";
					request.setAttribute("messaggio", messaggio);
					request.getRequestDispatcher("corso.jsp").forward(request, response);
				} // utenteCorrente==null

			} else {
				String messaggio = "Effettua la login prima di compiere un'operazione";
				request.setAttribute("messaggio", messaggio);
				request.getRequestDispatcher("corso.jsp").forward(request, response);
			} // sessione==null
		} // azione!=cerca


	}

	private void listaCorsi(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Corso> listacorsi = CorsoService.listaCorsi();
		request.setAttribute("listaCorsi", listacorsi);
		RequestDispatcher dispatcher = request.getRequestDispatcher("corso.jsp");
		dispatcher.forward(request, response);
	}

	private void inserisciCorso(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		Corso corso = new Corso();
		String titolo = request.getParameter("titolo");
		int ore = Integer.parseInt(request.getParameter("ore").trim());
		int id_docente = Integer.parseInt(request.getParameter("id_docente").trim());
		int maxPartecipanti = Integer.parseInt(request.getParameter("max_partecipanti").trim());
		CorsoService.inserisci(corso, titolo, ore, id_docente, maxPartecipanti);
		response.sendRedirect("corso.jsp");

	}

	private void corsiPerKeyword(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		CorsoDAO corsodao = new CorsoDAO();
		String keyword = request.getParameter("keyword");
		List<Corso> corsi = corsodao.cercaPerKeyword(keyword);
		request.setAttribute("corsi", corsi);
		try {
			request.getRequestDispatcher("corsi-titolosimile.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void eliminaCorso(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		CorsoService.elimina(id);
		request.setAttribute("id", id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("corso.jsp");
		dispatcher.forward(request, response);
	}

	private void aggiornaCorso(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String titolo = request.getParameter("titolo");
		int ore = Integer.parseInt(request.getParameter("ore").trim());
		int id_docente = Integer.parseInt(request.getParameter("id_docente").trim());
		int maxPartecipanti = Integer.parseInt(request.getParameter("max_partecipanti").trim());
		Corso corso = new Corso(id, titolo, ore, id_docente, maxPartecipanti);
		CorsoService.aggiorna(corso);
		response.sendRedirect("corso.jsp");
	}
	
	

//	private void cercaCorso(HttpServletRequest request, HttpServletResponse response)
//			throws SQLException, IOException, ServletException {
//		int id_docente = Integer.parseInt(request.getParameter("id_docente"));
//		List<Corso> listacorsi = CorsoService.cercaDocente(id_docente);
//		request.setAttribute("listacorsi", listacorsi);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("corso.jsp");
//		dispatcher.forward(request, response);
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
