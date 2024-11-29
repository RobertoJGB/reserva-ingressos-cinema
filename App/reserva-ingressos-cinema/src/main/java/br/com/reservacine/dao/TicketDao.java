package br.com.reservacine.dao;

import br.com.reservacine.config.ConnectionPoolConfig;
import br.com.reservacine.model.Ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class TicketDao {


    public void createTicket(Ticket ticket) {


        String SQL = "INSERT INTO TICKETS (FKIDUSER, FKNOMEFILME, FKSESSAO,FKIDLUOGAR) VALUES (?,?,?,?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, ticket.getFkIdUser());
            preparedStatement.setString(2, ticket.getFkIdFilme());
            preparedStatement.setString(3, ticket.getFkIdsession());
            preparedStatement.setString(4, ticket.getFkidlugar());
            preparedStatement.execute();

            System.out.println("success in insert ticket");

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection " + e.getMessage());

        }
    }

    public List<Ticket> findAllTicketsUser(String idUser) {
        // Consulta SQL simples para pegar os IDs dos tickets
        String SQL = "SELECT * "
                + "FROM TICKETS "
                + "WHERE AND FKIDUSER = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            // Definindo os parâmetros no PreparedStatement

            preparedStatement.setString(1, idUser);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Ticket> tickets = new ArrayList<>();

            while (resultSet.next()) {
                String idTicket = resultSet.getString("IDTICKET");
                String fkNomeFilme = resultSet.getString("FKNOMEFILME");
                String fkSessao = resultSet.getString("FKSESSAO");
                String fkIdLugar = resultSet.getString("FKIDLUOGAR");

                // Criando o ticket com os dados encontrados
                Ticket ticket = new Ticket(idTicket, idUser, fkNomeFilme, fkIdLugar,fkSessao );
                tickets.add(ticket);
            }

            System.out.println("Tickets encontrados com sucesso.");

            connection.close();

            return tickets;

        } catch (Exception e) {
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<Ticket> findAllTicketsSession(String session, String idUser) {
        // Consulta SQL simples para pegar os IDs dos tickets
        String SQL = "SELECT * "
                + "FROM TICKETS "
                + "WHERE FKSESSAO = ? AND FKIDUSER = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            // Definindo os parâmetros no PreparedStatement
            preparedStatement.setString(1, session);
            preparedStatement.setString(2, idUser);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Ticket> tickets = new ArrayList<>();

            while (resultSet.next()) {
                String idTicket = resultSet.getString("IDTICKET");
                String fkNomeFilme = resultSet.getString("FKNOMEFILME");
                String fkSessao = resultSet.getString("FKSESSAO");
                String fkIdLugar = resultSet.getString("FKIDLUOGAR");

                // Criando o ticket com os dados encontrados
                Ticket ticket = new Ticket(idTicket, idUser, fkNomeFilme, fkIdLugar,fkSessao );
                tickets.add(ticket);
            }

            System.out.println("Tickets encontrados com sucesso.");

            connection.close();

            return tickets;

        } catch (Exception e) {
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

}
