package br.com.reservacine.servlet;

import br.com.reservacine.dao.LugarSessaoDao;
import br.com.reservacine.dao.TicketDao;
import br.com.reservacine.model.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/create-ticket")
public class CreateTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TicketDao ticketDao = new TicketDao();
        LugarSessaoDao lugarSessaoDao = new LugarSessaoDao();

        String lugarEsc = (String) req.getSession().getAttribute("lugarEsc");
        String fkIdUser = (String) req.getSession().getAttribute("idUser"); // Alterado para pegar da sessão
        String fkIdFilme = (String) req.getSession().getAttribute("idMovie"); // Alterado para pegar da sessão
        String fkIdSession = (String) req.getSession().getAttribute("idSession"); // Alterado para pegar da sessão

        System.out.println(fkIdUser);
        System.out.println(fkIdFilme);
        System.out.println(fkIdSession);
        System.out.println(lugarEsc);

        if (lugarEsc == null || lugarEsc.isEmpty() || fkIdUser == null || fkIdFilme == null || fkIdSession == null) {
            System.out.println("Erro: Dados incompletos para criar tickets.");
            resp.sendRedirect("/error.jsp");
            return;
        }

        String[] seats = lugarEsc.split(",");

        // Criar os tickets
        for (String seat : seats) {
            int idLugar = lugarSessaoDao.mapearIdLugarPorSessaoTicket(seat, fkIdSession);

            if (idLugar == -1) {
                System.out.println("Erro: Lugar não encontrado para o assento " + seat);
                continue;
            }

            Ticket ticket = new Ticket(fkIdUser, fkIdFilme, fkIdSession, String.valueOf(idLugar));
            ticketDao.createTicket(ticket);
        }

        List<Ticket> createdTickets = ticketDao.findAllTicketsSession(fkIdSession, fkIdUser);

        req.setAttribute("tickets", createdTickets);

        System.out.println("Tickets criados com sucesso.");

        req.getRequestDispatcher("/confirmacao.jsp").forward(req, resp);
    }
}


