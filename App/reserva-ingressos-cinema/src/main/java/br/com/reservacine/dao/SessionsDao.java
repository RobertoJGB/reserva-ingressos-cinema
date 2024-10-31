package br.com.reservacine.dao;


import br.com.reservacine.model.Sessions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SessionsDao {

    public void createTableSessions(){
        String SQL ="CREATE TABLE IF NOT EXISTS SESSIONS("
                +"IDSESSION INT NOT NULL AUTO_INCREMENT, "
                +"HORARIO VARCHAR(55) NOT NULL, "
                +"SALA INT NOT NULL, "
                +"FKMOVIE INT NOT NULL, "
                +"PRIMARY KEY(IDSESSION), "
                +"FOREIGN KEY(FKMOVIE) REFERENCES MOVIES(IDMOVIE) );";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.execute();

            System.out.println("sucess in create table sessions");

        }catch (Exception e) {
            System.out.println("fail in create table sessions "+ e.getMessage());
        }


    }

    public void createSession(Sessions session) {
        createTableSessions();

        String SQL = "INSERT INTO SESSIONS (HORARIO, SALA, LUGARDISP, LUGAROCU, FKMOVIE) VALUES (?,?,?,?,?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, session.getHorario());
            preparedStatement.setString(2, session.getSala());
            preparedStatement.setString(3, session.getLugarDisp());
            preparedStatement.setString(4, session.getLugarOcup());
            preparedStatement.setString(5, session.getFkIdFilme());
            preparedStatement.execute();

            System.out.println("success in insert session");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection "+e.getMessage());

        }
    }
}
