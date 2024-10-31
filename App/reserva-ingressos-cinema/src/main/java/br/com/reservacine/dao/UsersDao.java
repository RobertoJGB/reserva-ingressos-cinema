package br.com.reservacine.dao;

import br.com.reservacine.config.ConnectionPoolConfig;
import br.com.reservacine.model.Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
            Connection connection = ConnectionPoolConfig.getConnection();

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

            Connection connection = ConnectionPoolConfig.getConnection();

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

    public List<Users> findAllUsers(){

        String SQL = "SELECT * FROM USERS";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Users> allUsers = new ArrayList<>();

            while (resultSet.next()){
                String iduser = resultSet.getString("IDUSER");
                String name = resultSet.getString("NAME");
                String dtNasc = resultSet.getString("dTNasc");
                String cpf = resultSet.getString("cpf");
                String usuario = resultSet.getString("usuario");
                String senha = resultSet.getString("senha");

                Users users = new Users(iduser,name,dtNasc,cpf,usuario,senha);

                allUsers.add(users);

            }

            System.out.println("Sucesso ao consultar os dados na tabela");

            connection.close();

            return allUsers;

        } catch (Exception e){

            System.out.println("Falha ao consultar os Usuarios " + e.getMessage());

        }

        return Collections.emptyList();
    }

    public void deleteUserById(String userId) {

        String SQL = "DELETE FROM USERS WHERE IDUSER = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userId);
            preparedStatement.execute();

            System.out.println("success on delete user with id: " + userId);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+ e);

        }

    }

    public void updateUser(Users user) {

        String SQL = "UPDATE USERS SET NAME = ?, dtNasc = ?, cpf = ?, usuario = ?, senha = ? WHERE IDUSER = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getNome());
            preparedStatement.setString(2, user.getDtNasc());
            preparedStatement.setString(3, user.getCpf());
            preparedStatement.setString(4, user.getUsuario());
            preparedStatement.setString(5, user.getSenha());
            preparedStatement.setString(6, user.getIdUser());
            preparedStatement.execute();

            System.out.println("success in update User");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in update User");
            System.out.println("Error: " + e.getMessage());

        }

    }

}
