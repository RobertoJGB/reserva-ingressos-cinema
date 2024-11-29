package br.com.reservacine.servlet;

import br.com.reservacine.dao.MoviesDao;
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

@WebServlet("/all-resumo")
public class FindResumoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MoviesDao md = new MoviesDao();
        SessionsDao sd = new SessionsDao();

        String lugarEsc = req.getParameter("selectedSeats");
        String idMovie = req.getParameter("idMovie");
        String sessaoId = req.getParameter("sessaoId");


        req.setAttribute("lugarEsc", lugarEsc);
        List<Movies> theMovie = md.findMovieById(idMovie);
        List<Sessions> theSession = sd.findOneSessionsByMovie(sessaoId);
        req.setAttribute("movie", theMovie);
        req.setAttribute("session", theSession);


        req.getRequestDispatcher("Resumo.jsp").forward(req, resp);


    }
}