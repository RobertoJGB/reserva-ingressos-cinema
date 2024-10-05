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

        String lugarEsc = req.getParameter("ticket-name");


        System.out.println(lugarEsc);

        Ticket ticket = new Ticket(lugarEsc);


        TicketDao ticketDao = new TicketDao();
        ticketDao.createTicket(ticket);

        resp.sendRedirect("/find-all-ticket");

    }
}
