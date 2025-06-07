/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author isabe
 */

import model.TipoSala;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TipoSalaDAO {
    private Connection connection;

    public TipoSalaDAO(Connection connection) {
        this.connection = connection;
    }

    // Método de inserção – observe que o nome deve ser exatamente "inserirTipo"
    public boolean inserirTipo(TipoSala tipo) {
        String sql = "INSERT INTO TipoSala (descricao) VALUES (?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, tipo.getDescricao());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // (outros métodos: listarTipos, atualizarTipo e excluirTipo, se você já os tiver)
    public List<TipoSala> listarTipos() {
        List<TipoSala> lista = new ArrayList<>();
        String sql = "SELECT id_tipo, descricao FROM TipoSala";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TipoSala t = new TipoSala();
                t.setId(rs.getInt("id_tipo"));
                t.setDescricao(rs.getString("descricao"));
                lista.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    public boolean atualizarTipo(TipoSala tipo) {
        String sql = "UPDATE TipoSala SET descricao = ? WHERE id_tipo = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, tipo.getDescricao());
            ps.setInt(2, tipo.getId());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean excluirTipo(int idTipo) {
        String sql = "DELETE FROM TipoSala WHERE id_tipo = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idTipo);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public TipoSala buscarPorId(int id) {
    String sql = "SELECT id_tipo, descricao FROM TipoSala WHERE id_tipo = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                TipoSala tipo = new TipoSala();
                tipo.setId(rs.getInt("id_tipo"));
                tipo.setDescricao(rs.getString("descricao"));
                return tipo;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // se não achar, retorna null
}

}
