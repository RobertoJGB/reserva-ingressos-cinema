package br.com.reservacine.dao;

import br.com.reservacine.model.Ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class TicketDao {

    public void createTicket(Ticket ticket){

        String SQL = "INSERT INTO TICKET (null, LUGARESC) VALUES (?)";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, ticket.getLugarEsc());
            preparedStatement.execute();

            System.out.println("success in insert ticket");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");

        }
    }

    public List<Ticket> findAllTickets() {

        String SQL = "SELECT * FROM TICKET";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Ticket> tickets = new ArrayList<>();

            while (resultSet.next()) {
                String idticket = resultSet.getString("idticket");
                String lugarEsc = resultSet.getString("lugaresc");

                Ticket ticket = new Ticket(idticket,lugarEsc);

                tickets.add(ticket);

            }

            System.out.println("success in select * ticket");

            connection.close();

            return tickets;

        } catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }

    }

}
