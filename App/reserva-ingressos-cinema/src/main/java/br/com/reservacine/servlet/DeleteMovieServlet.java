package br.com.reservacine.servlet;


import br.com.reservacine.dao.MoviesDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/delete-movie")
public class DeleteMovieServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String movieId = req.getParameter("idMovie");

        new MoviesDao().deleteMovieById(movieId);

        resp.sendRedirect("/find-all-movies");

    }

}
