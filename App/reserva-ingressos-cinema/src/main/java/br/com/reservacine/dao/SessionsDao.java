package br.com.reservacine.dao;


import br.com.reservacine.model.Sessions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SessionsDao {

    public void createSession(Sessions session) {

        String SQL = "INSERT INTO SESSIONS (HORARIO, SALA, LUGARDISP, LUGAROCU, FKFILME) VALUES (?,?,?,?,?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, session.getHorario());
            preparedStatement.setString(2, session.getSala());
            preparedStatement.setString(3, session.getLugarDisp());
            preparedStatement.setString(4, session.getLugarOcup());
            preparedStatement.setString(5, session.getLugarOcup());
            preparedStatement.execute();

            System.out.println("success in insert session");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }
}
