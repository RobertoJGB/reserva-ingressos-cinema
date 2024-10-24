package br.com.reservacine.dao;

import br.com.reservacine.model.Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UsersDao {

    public void createTableUsers() {
        String SQL = "CREATE TABLE IF NOT EXISTS USERS("
                + "IDUSER INT NOT NULL AUTO_INCREMENT, "
                + "NAME VARCHAR(50) NOT NULL, "
                + "dtNasc VARCHAR(11) NOT NULL, "
                + "cpf VARCHAR(15) NOT NULL, "
                + "usuario VARCHAR(50) NOT NULL, "
                + "senha VARCHAR(20) NOT NULL, "
                + "PRIMARY KEY(IDUSER) ); ";


        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table users");

        } catch (Exception e) {
            System.out.println("fail in create table users " + e.getMessage());
        }
    }

    public void createUsers(Users users){
        createTableUsers();

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

            System.out.println("success in insert user");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+ e.getMessage());

        }
    }

}
