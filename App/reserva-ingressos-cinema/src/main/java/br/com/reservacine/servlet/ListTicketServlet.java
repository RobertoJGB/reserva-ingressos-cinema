package br.com.reservacine.servlet;

import br.com.reservacine.model.Ticket;
import br.com.reservacine.dao.TicketDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-ticket")
public class ListTicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Ticket> tickets = new TicketDao().findAllTickets();

        req.setAttribute("ticket", tickets);

        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }
}
