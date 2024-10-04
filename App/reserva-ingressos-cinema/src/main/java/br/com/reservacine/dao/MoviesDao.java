package br.com.reservacine.dao;

import br.com.reservacine.model.Movies;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MoviesDao {

    public void createMovie(Movies movie) {

        String SQL = "INSERT INTO MOVIES (NOMEFILME, SINOPSE, CLASSIND, DURACAO) VALUES (?,?,?,?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, movie.getNomeFilme());
            preparedStatement.setString(2, movie.getSinopse());
            preparedStatement.setString(3, movie.getClassInd());
            preparedStatement.setString(4, movie.getDuracao());
            preparedStatement.execute();

            System.out.println("success in insert movie");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }
}
