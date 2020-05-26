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
import it.begear.progetto.entity.Corso;
import it.begear.progetto.service.CorsoService;

@WebServlet("/CorsoServlet")
public class CorsoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String azione = request.getParameter("azione");

		try {
			switch (azione) {

			case "/insert":
				inserisciCorso(request, response);
				break;
			case "/delete":
				break;
			case "/edit":
				break;
			case "/update":
				break;
			default:
				listaCorsi(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
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
		int ore  = Integer.parseInt(request.getParameter("ore"));
		int id_docente  = Integer.parseInt(request.getParameter("id_docente"));
		int maxPartecipanti  = Integer.parseInt(request.getParameter("maxPartecipanti"));
		CorsoService.inserisci(corso, titolo, ore, id_docente, maxPartecipanti);
		response.sendRedirect("corso.jsp");
	}
}
