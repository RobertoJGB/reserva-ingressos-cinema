package br.com.reservacine.dao;

import br.com.reservacine.model.Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UsersDao {

    public void createUsers(Users users){

        String SQL = "INSERT INTO USERS (NAME, dtNasc, cpf, usuario, senha) VALUES (?, ?, ?, ?, ?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, users.getNome());
            preparedStatement.setString(2, users.getDtNasc());
            preparedStatement.setString(3, users.getCpf());
            preparedStatement.setString(4, users.getUsuario());
            preparedStatement.setString(5, users.getSenha());
            preparedStatement.execute();

            System.out.println("success in insert ticket");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }

}
