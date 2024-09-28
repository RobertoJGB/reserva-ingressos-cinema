package br.com.reservacine.dao;

import br.com.reservacine.model.Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UsersDao {

    public void createUsers(Users users){

        String SQL = "INSERT INTO USERS (NAME, dtNasc) VALUES (?, ?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, users.getNomeUsuario());
            preparedStatement.setString(2, users.getDtNasc());
            preparedStatement.execute();

            System.out.println("success in insert ticket");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }

}
