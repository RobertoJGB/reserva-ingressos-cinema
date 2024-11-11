package br.com.reservacine.dao;

import br.com.reservacine.model.Movies;
import br.com.reservacine.config.ConnectionPoolConfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MoviesDao {




    public void createMovie(Movies movie) {


        String SQL = "INSERT INTO MOVIES (NAME, GENERO, SINOPSE, CLASSIND, DURACAO,EMCARTAZ) VALUES (?,?,?,?,?,?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, movie.getNomeFilme());
            preparedStatement.setString(2, movie.getGenero());
            preparedStatement.setString(3, movie.getSinopse());
            preparedStatement.setString(4, movie.getClassInd());
            preparedStatement.setString(5, movie.getDuracao());
            preparedStatement.setString(6, movie.getEmcart());


            preparedStatement.execute();

            System.out.println("success in insert movie");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection: " + e.getMessage());

        }
    }

    public List<Movies> findAllMovies(){

        String SQL = "SELECT * FROM MOVIES";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Movies> allMovies = new ArrayList<>();

            while (resultSet.next()){
                String idmovie = resultSet.getString("IDMOVIE");
                String name = resultSet.getString("NAME");
                String genero = resultSet.getString("GENERO");
                String sinopse = resultSet.getString("SINOPSE");
                String classind = resultSet.getString("CLASSIND");
                String duracao = resultSet.getString("DURACAO");
                String emcartaz = resultSet.getString("EMCARTAZ");

                Movies movies = new Movies(idmovie,name, genero, sinopse, classind, duracao,emcartaz);
                System.out.print(allMovies);
                allMovies.add(movies);

            }

            System.out.println("Sucesso ao consultar os dados na tabela");

            connection.close();

            return allMovies;

        } catch (Exception e){

            System.out.println("Falha ao consultar os filmes " + e.getMessage());

        }

        return Collections.emptyList();
    }

    public void deleteMovieById(String movieId) {

        String SQL = "DELETE FROM MOVIES WHERE IDMOVIE = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, movieId);
            preparedStatement.execute();

            System.out.println("success on delete movie with id: " + movieId);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+ e);
            
        }

    }

    public void updateMovie(Movies movie) {

        String SQL = "UPDATE MOVIES SET NAME = ?, GENERO = ?, SINOPSE = ?, CLASSIND = ?, DURACAO = ?, EMCARTAZ = ? WHERE IDMOVIE = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, movie.getNomeFilme());
            preparedStatement.setString(2, movie.getGenero());
            preparedStatement.setString(3, movie.getSinopse());
            preparedStatement.setString(4, movie.getClassInd());
            preparedStatement.setString(5, movie.getDuracao());
            preparedStatement.setString(6, movie.getIdMovie());
            preparedStatement.setString(7, movie.getEmcart());
            preparedStatement.execute();

            System.out.println("success in update Movie");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in update Movie");
            System.out.println("Error: " + e.getMessage());

        }

    }



}