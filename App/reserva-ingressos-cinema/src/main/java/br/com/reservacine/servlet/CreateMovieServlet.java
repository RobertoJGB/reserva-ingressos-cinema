package br.com.reservacine.servlet;


import br.com.reservacine.dao.MoviesDao;
import br.com.reservacine.model.Movies;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-movie")
public class CreateMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idMovie = req.getParameter("id");

        String NOMEFILME = req.getParameter("nomeFilme");

        String GENERO = req.getParameter("genero");

        String SINOPSE = req.getParameter("sinopse");

        String CLASSIND = req.getParameter("classind");

        String DURACAO = req.getParameter("duracao");

        String emcart = req.getParameter("categoria");


        MoviesDao moviesDao = new MoviesDao();
        if(idMovie.equals("")){
            Movies movies = new Movies(NOMEFILME, GENERO, SINOPSE, CLASSIND, DURACAO,emcart);
            moviesDao.createMovie(movies);
        }else{
            Movies movies = new Movies(idMovie,NOMEFILME, GENERO, SINOPSE, CLASSIND, DURACAO,emcart);
            moviesDao.updateMovie(movies);
        }





        resp.sendRedirect("/find-all-movies");

    }
}
