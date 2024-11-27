package br.com.reservacine.servlet;

import br.com.reservacine.dao.SessionsDao;
import br.com.reservacine.model.Movies;
import br.com.reservacine.model.Sessions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-session")
public class ListSessionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        SessionsDao sd = new SessionsDao();
        List<Sessions> allSessions = sd.findAllSessionsByMovie(id);

        req.setAttribute("session", allSessions);

        req.getRequestDispatcher("/sinopse.jsp").forward(req, resp);
    }
}
