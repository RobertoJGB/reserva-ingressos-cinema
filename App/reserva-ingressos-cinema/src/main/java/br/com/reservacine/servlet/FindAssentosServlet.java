package br.com.reservacine.servlet;

import br.com.reservacine.dao.LugarSessaoDao;
import br.com.reservacine.dao.MoviesDao;
import br.com.reservacine.model.LugarSessao;
import br.com.reservacine.model.Movies;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-assentos")
public class FindAssentosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sessaoId = req.getParameter("sessaoId");


        LugarSessaoDao ld = new LugarSessaoDao();
        List<LugarSessao> allAssentos = ld.getLugaresPorSessao(sessaoId);




       req.setAttribute("assentos", allAssentos);
       req.getRequestDispatcher("/assentos.jsp").forward(req, resp);
    }
}
