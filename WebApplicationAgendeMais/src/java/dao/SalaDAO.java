/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author isabe
 */

import model.Sala;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalaDAO {
    private Connection connection;

    public SalaDAO(Connection connection) {
        this.connection = connection;
    }

    // Inserir uma nova sala
    public boolean inserirSala(Sala sala) {
        String sql = "INSERT INTO Sala (nome_sala, capacidade, tipo_sala_id) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, sala.getNomeSala());
            ps.setInt(2, sala.getCapacidade());
            ps.setInt(3, sala.getTipoSalaId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Listar todas as salas
    public List<Sala> listarSalas() {
        List<Sala> lista = new ArrayList<>();
        String sql = "SELECT id_sala, nome_sala, capacidade, tipo_sala_id FROM Sala";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Sala sala = new Sala();
                sala.setIdSala(rs.getInt("id_sala"));
                sala.setNomeSala(rs.getString("nome_sala"));
                sala.setCapacidade(rs.getInt("capacidade"));
                sala.setTipoSalaId(rs.getInt("tipo_sala_id"));
                lista.add(sala);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Buscar sala pelo id
    public Sala buscarPorId(int id) {
        String sql = "SELECT id_sala, nome_sala, capacidade, tipo_sala_id FROM Sala WHERE id_sala = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Sala sala = new Sala();
                    sala.setIdSala(rs.getInt("id_sala"));
                    sala.setNomeSala(rs.getString("nome_sala"));
                    sala.setCapacidade(rs.getInt("capacidade"));
                    sala.setTipoSalaId(rs.getInt("tipo_sala_id"));
                    return sala;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Atualizar sala
    public boolean atualizarSala(Sala sala) {
        String sql = "UPDATE Sala SET nome_sala = ?, capacidade = ?, tipo_sala_id = ? WHERE id_sala = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, sala.getNomeSala());
            ps.setInt(2, sala.getCapacidade());
            ps.setInt(3, sala.getTipoSalaId());
            ps.setInt(4, sala.getIdSala());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Excluir sala
    public boolean excluirSala(int id) {
        String sql = "DELETE FROM Sala WHERE id_sala = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

