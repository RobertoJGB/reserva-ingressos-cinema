package br.com.reservacine.servlet;


import br.com.reservacine.dao.SessionsDao;
import br.com.reservacine.model.Sessions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-session")
public class CreateSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String horario = req.getParameter("horario");

        String sala = req.getParameter("sala");


        String fkfilme = req.getParameter("fkfilme");

        Sessions s = new Sessions(horario, sala, fkfilme);
        SessionsDao sd = new SessionsDao();


        sd.createSession(s);


        resp.sendRedirect("/index.jsp");

    }
}
