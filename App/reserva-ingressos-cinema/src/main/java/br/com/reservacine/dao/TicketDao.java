package br.com.reservacine.dao;

import br.com.reservacine.model.Ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class TicketDao {

    public void createTicket(Ticket ticket){

        String SQL = "INSERT INTO TICKET (IDTICKET) VALUES (?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, ticket.getTicket());
            preparedStatement.execute();

            System.out.println("success in insert ticket");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }

}
