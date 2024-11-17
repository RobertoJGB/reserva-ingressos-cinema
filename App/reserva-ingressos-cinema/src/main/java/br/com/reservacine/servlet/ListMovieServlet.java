package br.com.reservacine.servlet;

import br.com.reservacine.dao.MoviesDao;
import br.com.reservacine.model.Movies;
import br.com.reservacine.model.Ticket;
import br.com.reservacine.dao.TicketDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/find-all-movies", "/admin/find-all-movies"})
public class ListMovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        MoviesDao moviesDao = new MoviesDao();
        List<Movies> allMovies = moviesDao.findAllMovies();


        req.setAttribute("movies", allMovies);

        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
