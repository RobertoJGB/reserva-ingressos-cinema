package br.com.reservacine.dao;

import br.com.reservacine.config.ConnectionPoolConfig;
import br.com.reservacine.model.LugarSessao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LugarSessaoDao {
    // Listar o lugares, pesquisando a sessão, não há insert , pois deve acontecer de forma automatatica ao inserir sessão
    public List<LugarSessao> getLugaresPorSessao(String sessionId) {
        List<LugarSessao> lugares = new ArrayList<>();
        String SQL = "SELECT id_lugar_sessao, fk_sessao, lugar, disponivel "
                + "FROM lugar_sessao WHERE fk_sessao = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, sessionId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String idLugarSessao = resultSet.getString("id_lugar_sessao");
                String lugar = resultSet.getString("lugar");
                boolean disponivel = resultSet.getBoolean("disponivel");

                LugarSessao lugarSessao = new LugarSessao(idLugarSessao, sessionId, lugar, disponivel);
                lugares.add(lugarSessao);
            }

            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao consultar os lugares da sessão: " + e.getMessage());
        }

        return lugares;
    }


    public void reservarLugar(int idLugarSessao) {
        String SQL = "UPDATE lugar_sessao SET disponivel = ? WHERE id_lugar_sessao = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setBoolean(1, false); // Marcar como reservado
            preparedStatement.setInt(2, idLugarSessao); // Passando o ID do lugar
            preparedStatement.executeUpdate();

            System.out.println("Lugar reservado com sucesso.");
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao realizar reserva do lugar: " + idLugarSessao);
            System.out.println("Erro ao reservar o lugar: " + e.getMessage());
        }
    }

    // Método para mapear o nome do lugar para o id_lugar_sessao
    public int mapearIdLugarPorSessao(String lugar, String fkSessao) {
        String SQL = "SELECT id_lugar_sessao FROM lugar_sessao WHERE lugar = ? AND fk_sessao = ? AND disponivel = true LIMIT 1";

        try (
                Connection connection = ConnectionPoolConfig.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SQL)
        ) {
            preparedStatement.setString(1, lugar); // Nome do lugar (ex: A1)
            preparedStatement.setString(2, fkSessao); // ID da sessão

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("id_lugar_sessao");
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao mapear o lugar para a sessão: " + e.getMessage());
        }

        return -1; // Retorna -1 se o lugar não for encontrado
    }

    public int mapearIdLugarPorSessaoTicket(String lugar, String fkSessao) {
        String SQL = "SELECT id_lugar_sessao FROM lugar_sessao WHERE lugar = ? AND fk_sessao = ? AND disponivel = false LIMIT 1";

        try (
                Connection connection = ConnectionPoolConfig.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SQL)
        ) {
            preparedStatement.setString(1, lugar); // Nome do lugar (ex: A1)
            preparedStatement.setString(2, fkSessao); // ID da sessão

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("id_lugar_sessao");
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao mapear o lugar para a sessão: " + e.getMessage());
        }

        return -1; // Retorna -1 se o lugar não for encontrado
    }




    public void restaurarLugar(int idLugarSessao) {
        String SQL = "UPDATE lugar_sessao SET disponivel = ? WHERE id_lugar_sessao = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setBoolean(1, true); // Marcar como disponível
            preparedStatement.setInt(2, idLugarSessao); // Passando o ID do lugar
            preparedStatement.executeUpdate();

            System.out.println("Lugar restaurado para disponível.");
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao restaurar o lugar: " + e.getMessage());
        }
    }

    public void deleteLugar(String fkSessao) {
        String SQL = "DELETE FROM lugar_sessao WHERE fk_sessao = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, fkSessao); // Passando o ID do lugar
            preparedStatement.executeUpdate();

            System.out.println("Lugar excluído com sucesso.");
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao excluir o lugar: " + e.getMessage());
        }
    }

}
