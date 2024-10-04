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

        String ticketName = req.getParameter("ticket-name");
        String lugarEsc = req.getParameter("");

        System.out.println(ticketName);

        Ticket ticket = new Ticket();
        ticket.setTicket(ticketName);
        ticket.setLugarEsc(lugarEsc);

        TicketDao ticketDao = new TicketDao();
        ticketDao.createTicket(ticket);

        req.getRequestDispatcher("index.html").forward(req,resp);

    }
}
