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
    public List<LugarSessao> getLugaresPorSessao(int sessionId) {
        List<LugarSessao> lugares = new ArrayList<>();
        String SQL = "SELECT id_lugar_sessao, fk_sessao, lugar, disponivel "
                + "FROM lugar_sessao WHERE fk_sessao = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, sessionId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idLugarSessao = resultSet.getInt("id_lugar_sessao");
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
            System.out.println("Erro ao reservar o lugar: " + e.getMessage());
        }
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
