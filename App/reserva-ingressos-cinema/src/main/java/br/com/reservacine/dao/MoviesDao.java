package br.com.reservacine.dao;

import br.com.reservacine.model.Movies;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MoviesDao {


    public void createTableMovies(){
        String SQL ="CREATE TABLE IF NOT EXISTS MOVIES("
                    +"IDMOVIE INT NOT NULL AUTO_INCREMENT, "
                    +"NAME VARCHAR(55) NOT NULL, "
                    +"GENERO VARCHAR(55) NOT NULL, "
                    +"SINOPSE TEXT NOT NULL, "
                    +"CLASSIND VARCHAR(3) NOT NULL, "
                    +"DURACAO INT NOT NULL, "
                    +"PRIMARY KEY(IDMOVIE) );";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table movies");

        }catch (Exception e) {
            System.out.println("fail in create table movies "+ e.getMessage());
        }

    }

    public void createMovie(Movies movie) {
        createTableMovies();

        String SQL = "INSERT INTO MOVIES (NAME, GENERO, SINOPSE, CLASSIND, DURACAO) VALUES (?,?,?,?,?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, movie.getNomeFilme());
            preparedStatement.setString(2, movie.getGenero());
            preparedStatement.setString(3, movie.getSinopse());
            preparedStatement.setString(4, movie.getClassInd());
            preparedStatement.setString(5, movie.getDuracao());

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

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

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

                Movies movies = new Movies(idmovie,name, genero, sinopse, classind, duracao);

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

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, movieId);
            preparedStatement.execute();

            System.out.println("success on delete movie with id: " + movieId);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+ e);
            
        }

    }

}