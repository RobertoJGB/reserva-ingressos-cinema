package br.com.reservacine.config;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionPoolConfig {
    private static int cont = 0;


    private static BasicDataSource dataSource;

    private ConnectionPoolConfig() {
        getDataSource();
    }

    private static BasicDataSource getDataSource() {

        if (dataSource == null) {
            dataSource = new BasicDataSource();
            dataSource.setUrl("jdbc:h2:~/test");
            dataSource.setUsername("sa");
            dataSource.setPassword("sa");
            dataSource.setMinIdle(5);
            dataSource.setMaxIdle(10);
            dataSource.setMaxTotal(50);

            System.out.println("New connection pool created with successful");

        }

        return dataSource;

    }

    public static Connection getConnection() throws SQLException {
        if (cont == 0) {
            creates();
            cont++;
        }
        return getDataSource().getConnection();

    }

    private static void creates() {
        try (Connection connection = getDataSource().getConnection()) {
            createTableUsers(connection);
            createTableMovies(connection);
            createTableSessions(connection);
            createTableLugarSessao(connection);
            createTableTicket(connection);

        } catch (SQLException e) {
            System.out.println("Erro na criação das tabelas e procedures: " + e.getMessage());
        }
    }

    private static void createTableUsers(Connection connection) {
        String SQL = "CREATE TABLE IF NOT EXISTS USERS("
                + "IDUSER INT NOT NULL AUTO_INCREMENT, "
                + "NAME VARCHAR(50) NOT NULL, "
                + "dtNasc VARCHAR(11) NOT NULL, "
                + "cpf VARCHAR(15) NOT NULL, "
                + "email VARCHAR(50) NOT NULL, "
                + "senha VARCHAR(20) NOT NULL, "
                + "PRIMARY KEY(IDUSER) ); ";


        try {


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table users");

        } catch (Exception e) {
            System.out.println("fail in create table users " + e.getMessage());
        }
    }

    private static void createTableMovies(Connection connection) {

        String SQL = "CREATE TABLE IF NOT EXISTS MOVIES("
                + "IDMOVIE INT NOT NULL AUTO_INCREMENT, "
                + "NAME VARCHAR(55) NOT NULL, "
                + "GENERO VARCHAR(55) NOT NULL, "
                + "SINOPSE TEXT NOT NULL, "
                + "CLASSIND VARCHAR(3) NOT NULL, "
                + "DURACAO INT NOT NULL, "
                + "EMCARTAZ VARCHAR(10) NOT NULL, "
                + "IMAGE VARCHAR(255), "
                + "PRIMARY KEY(IDMOVIE) );";

        try {


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table movies");

        } catch (Exception e) {
            System.out.println("fail in create table movies " + e.getMessage());
        }

    }

    public static void createTableSessions(Connection connection) {
        String SQL = "CREATE TABLE IF NOT EXISTS SESSIONS("
                + "IDSESSION INT NOT NULL AUTO_INCREMENT, "
                + "HORARIO VARCHAR(55) NOT NULL, "
                + "SALA INT NOT NULL, "
                + "FKMOVIE INT NOT NULL, "
                + "PRIMARY KEY(IDSESSION), "
                + "FOREIGN KEY(FKMOVIE) REFERENCES MOVIES(IDMOVIE) );";

        try {


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table sessions");

        } catch (Exception e) {
            System.out.println("fail in create table sessions " + e.getMessage());
        }

    }

    public static void createTableTicket(Connection connection) {
        String SQL = "CREATE TABLE IF NOT EXISTS TICKETS ("
                + "IDTICKET INT NOT NULL AUTO_INCREMENT, "
                + "FKIDUSER INT NOT NULL, "
                + "FKNOMEFILME INT NOT NULL, "
                + "FKSESSAO INT NOT NULL, "
                + "FKIDLUOGAR INT NOT NULL, "  // Novo campo para associar o lugar ao ticket
                + "PRIMARY KEY(IDTICKET), "
                + "FOREIGN KEY (FKIDUSER) REFERENCES USERS(IDUSER), "
                + "FOREIGN KEY (FKNOMEFILME) REFERENCES MOVIES(IDMOVIE), "
                + "FOREIGN KEY (FKSESSAO) REFERENCES SESSIONS(IDSESSION), "
                + "FOREIGN KEY (FKIDLUOGAR) REFERENCES lugar_sessao(id_lugar_sessao) "  // Relacionando ao lugar na sessão
                + ");";

        try {


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table ticket");

        } catch (Exception e) {
            System.out.println("fail in create table ticket " + e.getMessage());
        }
    }

    public static void createTableLugarSessao(Connection connection) {
        String SQL = "CREATE TABLE IF NOT EXISTS lugar_sessao ("
                + "id_lugar_sessao INT NOT NULL AUTO_INCREMENT, "
                + "fk_sessao INT NOT NULL, "
                + "lugar VARCHAR(10) NOT NULL, "
                + "disponivel BOOLEAN NOT NULL, "
                + "PRIMARY KEY(id_lugar_sessao), "
                + "FOREIGN KEY (fk_sessao) REFERENCES SESSIONS(IDSESSION) "
                + ");";

        try {

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.execute();
            System.out.println("Tabela lugar_sessao criada com sucesso.");
        } catch (SQLException e) {
            System.out.println("Erro ao criar a tabela lugar_sessao: " + e.getMessage());
        }
    }


}

