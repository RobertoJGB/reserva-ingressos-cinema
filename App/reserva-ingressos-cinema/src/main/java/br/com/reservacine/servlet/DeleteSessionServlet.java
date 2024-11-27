package br.com.reservacine.servlet;

import br.com.reservacine.dao.SessionsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update-session")
public class DeleteSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String movieId = req.getParameter("idMovie");
        SessionsDao sd = new SessionsDao();

        sd.deleteSessionById(movieId);
        resp.sendRedirect("/find-session?id=" + movieId);

    }
}
