package br.com.reservacine.servlet;


import br.com.reservacine.dao.TicketDao;
import br.com.reservacine.model.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-ticket")
public class CreateTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fkiduser = req.getParameter("fkiduser");

        String fknomefilme = req.getParameter("fknomefilme");

        String fksession = req.getParameter("fksession");

        Ticket tic = new Ticket(fkiduser,fknomefilme,fksession);
        TicketDao td = new TicketDao();
        td.createTicket(tic);

        resp.sendRedirect("/index.jsp");

    }
}
