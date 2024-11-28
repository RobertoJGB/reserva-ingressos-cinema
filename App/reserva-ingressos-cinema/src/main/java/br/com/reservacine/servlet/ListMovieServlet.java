package br.com.reservacine.servlet;

import br.com.reservacine.dao.MoviesDao;
import br.com.reservacine.model.Movies;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/find-all-movies", "/admin/find-all-movies"})
public class ListMovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MoviesDao dao = new MoviesDao();
        List<Movies> allMovies = dao.findAllMovies();
        Movies destaque = null;


        for (Movies movie : allMovies) {
            if ("emDestaq".equals(movie.getEmcart())) {
                destaque = movie;
                break;
            }
        }


        if (destaque != null) {
            allMovies.remove(destaque);
            allMovies.add(0, destaque);
        }

        req.setAttribute("movies", allMovies);
        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
