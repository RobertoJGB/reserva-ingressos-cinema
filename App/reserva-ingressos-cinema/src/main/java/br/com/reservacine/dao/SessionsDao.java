package br.com.reservacine.dao;


import br.com.reservacine.config.ConnectionPoolConfig;
import br.com.reservacine.model.Sessions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SessionsDao {


    public void createSession(Sessions session) {

        String SQL = "INSERT INTO SESSIONS (HORARIO, SALA, FKMOVIE) VALUES (?,?,?)";

        try {
            // Obtendo a conexão do pool de conexões
            Connection connection = ConnectionPoolConfig.getConnection();

            // Criando o PreparedStatement com a opção de recuperar a chave gerada (ID da sessão)
            PreparedStatement preparedStatement = connection.prepareStatement(SQL, PreparedStatement.RETURN_GENERATED_KEYS);

            // Configurando os parâmetros do PreparedStatement
            preparedStatement.setString(1, session.getHorario());
            preparedStatement.setString(2, session.getSala());
            preparedStatement.setString(3, session.getFkIdFilme());  // Corrigido: índice 3, não 5
            preparedStatement.executeUpdate();  // Usar executeUpdate para a inserção

            // Recuperando o ID gerado (sessionId) após o insert
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                int sessionId = resultSet.getInt(1);  // Obtendo o ID da sessão recém-inserida
                System.out.println("Session created successfully with ID: " + sessionId);

                // Chama o procedimento para inserir os lugares para a nova sessão
                createSeatsDirectly(connection, sessionId);
            }

            connection.close();

        } catch (Exception e) {
            System.out.println("Error while inserting session: " + e.getMessage());
        }
    }

    private void createSeatsDirectly(Connection connection, int sessionId) {
        String[] fileiras = {"A", "B", "C", "D", "E", "F", "G", "H"};
        String sql = "INSERT INTO lugar_sessao (fk_sessao, lugar, disponivel) VALUES (?, ?, ?)";

        try {
            for (String fileira : fileiras) {
                for (int assento = 1; assento <= 10; assento++) {
                    String lugar = fileira + assento;
                    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                        stmt.setInt(1, sessionId);  // Usando o ID da sessão recém-inserida
                        stmt.setString(2, lugar);
                        stmt.setBoolean(3, true);
                        stmt.executeUpdate();
                    }
                }
            }
            System.out.println("Lugares inseridos com sucesso para a sessão: " + sessionId);
        } catch (Exception e) {
            System.out.println("Erro ao inserir lugares: " + e.getMessage());
        }
    }

    public List<Sessions> findAllSessionsByMovie(String fkMovie) {
        String SQL = "SELECT * FROM SESSIONS WHERE FKMOVIE = ?";

        List<Sessions> allSessions = new ArrayList<>();

        try (
                Connection connection = ConnectionPoolConfig.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SQL)
        ) {

            preparedStatement.setString(1, fkMovie);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String idSession = resultSet.getString("IDSESSION");
                    String hora = resultSet.getString("HORARIO");
                    String sala = resultSet.getString("SALA");
                    String fk = resultSet.getString("fkMovie");


                    Sessions session = new Sessions(idSession, hora, sala, fk);
                    allSessions.add(session);
                }
            }

            System.out.println("Sucesso ao consultar as sessões para o filme com FKMOVIE = " + fkMovie);

        } catch (Exception e) {
            System.out.println("Falha ao consultar as sessões: " + e.getMessage());
        }

        return allSessions;
    }


    public void deleteSessionById(String sessionId) {

        String SQL = "DELETE FROM SESSIONS WHERE IDSESSION = ?";

        try {

            LugarSessaoDao ld = new LugarSessaoDao();
            ld.deleteLugar(sessionId);

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, sessionId);
            preparedStatement.execute();

            System.out.println("success on delete session with id: " + sessionId);

            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection " + e);

        }

    }

    public void updateSession(Sessions session) {

        String SQL = "UPDATE SESSIONS SET HORARIO = ?, SALA = ?, FKMOVIE = ? WHERE IDSESSION = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, session.getHorario());
            preparedStatement.setString(2, session.getSala());
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
