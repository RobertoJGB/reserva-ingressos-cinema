package br.com.reservacine.dao;

import br.com.reservacine.config.ConnectionPoolConfig;
import br.com.reservacine.model.Users;

import java.sql.Connection;
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
                + "email VARCHAR(50) NOT NULL, "
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

        String SQL = "INSERT INTO USERS (NAME, dtNasc, cpf, email, senha) VALUES (?, ?, ?, ?, ?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, users.getNome());
            preparedStatement.setString(2, users.getDtNasc());
            preparedStatement.setString(3, users.getCpf());
            preparedStatement.setString(4, users.getEmail());
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
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");

                Users users = new Users(iduser,name,dtNasc,cpf,email,senha);

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

    public ResultSet searchUser(String email) {
        createTableUsers();
        String SQL = "SELECT * FROM USERS WHERE email = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                System.out.println("Sucesso ao consultar os dados na tabela");
                return resultSet;
            } else {

                connection.close();
                return null;
            }

        } catch (Exception e) {
            System.out.println("Falha ao consultar os Usuarios: " + e.getMessage());
            return null;
        }
    }

    public ResultSet searchUsers(String email, String senha) {
        createTableUsers();
        String SQL = "SELECT * FROM USERS WHERE email = ? AND senha = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);  // Agora verifica a senha também
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                System.out.println("Sucesso ao consultar os dados na tabela");
                return resultSet;
            } else {
                connection.close();
                return null;
            }
        } catch (Exception e) {
            System.out.println("Falha ao consultar os Usuarios: " + e.getMessage());
            return null;
        }
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
            preparedStatement.setString(4, user.getEmail());
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
