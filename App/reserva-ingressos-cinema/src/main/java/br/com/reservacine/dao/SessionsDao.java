package br.com.reservacine.dao;


import br.com.reservacine.config.ConnectionPoolConfig;

import br.com.reservacine.model.Movies;
import br.com.reservacine.model.Sessions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SessionsDao {

    public void createTableSessions(){
        String SQL ="CREATE TABLE IF NOT EXISTS SESSIONS("
                +"IDSESSION INT NOT NULL AUTO_INCREMENT, "
                +"HORARIO VARCHAR(55) NOT NULL, "
                +"FKSALA INT NOT NULL, "
                +"FKMOVIE INT NOT NULL, "
                +"PRIMARY KEY(IDSESSION), "
                +"FOREIGN KEY(FKSALA) REFERENCES MOVIES(IDSALA)"
                +"FOREIGN KEY(FKMOVIE) REFERENCES MOVIES(IDMOVIE) );";

        try{
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table sessions");

        }catch (Exception e) {
            System.out.println("fail in create table sessions "+ e.getMessage());
        }


    }

    public void createSession(Sessions session) {
        createTableSessions();

        String SQL = "INSERT INTO SESSIONS (HORARIO, FKSALA, FKMOVIE) VALUES (?,?,?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, session.getHorario());
            preparedStatement.setString(2, session.getFkSala());
            preparedStatement.setString(5, session.getFkIdFilme());
            preparedStatement.execute();

            System.out.println("success in insert session");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+e.getMessage());

        }
    }

    public List<Sessions> findAllSessions(){

        String SQL = "SELECT s.IDSESSION, s.HORARIO, m.NAME AS nomeFilme, sa.LUGAR AS lugar, sa.DISPONIVEL AS disponibilidade " +
                "FROM SESSIONS s " +
                "JOIN MOVIES m ON s.FKMOVIE = m.IDMOVIE " +
                "JOIN SALA sa ON s.FKSALA = sa.IDSALA";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Sessions> allSessions = new ArrayList<>();

            while (resultSet.next()){
                String idSession = resultSet.getString("IDSESSION");
                String hora = resultSet.getString("HORARIO");
                String nomeFilme = resultSet.getString("nomeFilme");
                String lugares = resultSet.getString("lugar");
                String disponivel = resultSet.getString("disponibilidade");


                Sessions session = new Sessions(idSession,hora,nomeFilme,lugares,disponivel);

                allSessions.add(session);

            }

            System.out.println("Sucesso ao consultar os dados na tabela");

            connection.close();

            return allSessions;

        } catch (Exception e){

            System.out.println("Falha ao consultar os Sessões " + e.getMessage());

        }

        return Collections.emptyList();
    }

    public void deleteSessionById(String sessionId) {

        String SQL = "DELETE FROM MOVIES WHERE IDSESSION = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, sessionId);
            preparedStatement.execute();

            System.out.println("success on delete session with id: " + sessionId);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+ e);

        }

    }

    public void updateSession(Sessions session) {

        String SQL = "UPDATE SESSIONS SET HORARIO = ?, FKSALA = ?, FKMOVIE = ? WHERE IDSESSION = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, session.getHorario());
            preparedStatement.setString(2, session.getFkSala());
            preparedStatement.setString(3, session.getFkIdFilme());
            preparedStatement.setString(4, session.getIdSession());

            preparedStatement.execute();

            System.out.println("success in update Session");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in update Session");
            System.out.println("Error: " + e.getMessage());

        }

    }
}
