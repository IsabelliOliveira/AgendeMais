/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author isabe
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Reserva;

public class ReservaDAO {
    private Connection connection;

    public ReservaDAO(Connection connection) {
        this.connection = connection;
        
    }
    
    // Construtor sem parâmetros cria conexão internamente
    public ReservaDAO() {
        try {
            // Exemplo: conexão direta (ajuste com seus dados)
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/AgendeMais", "usuario", "senha");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Reserva> listarReservas() throws SQLException {
        List<Reserva> lista = new ArrayList<>();
        String sql = "SELECT r.*, u.nome FROM reserva r INNER JOIN usuario u ON r.id_usuario = u.id_usuario";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Reserva r = new Reserva();
                r.setIdReserva(rs.getInt("id_reserva"));
                r.setNome(rs.getString ("nome"));
                r.setIdSala(rs.getInt("id_sala"));
                r.setDataInicio(rs.getTimestamp("data_inicio"));
                r.setDataFim(rs.getTimestamp("data_fim"));
                r.setStatusReserva(rs.getInt("statusReserva"));
                lista.add(r);
            }
        }
        return lista;
    }

    public void inserirReserva(Reserva reserva) throws SQLException {
        String sql = "INSERT INTO Reserva (id_usuario, id_sala, data_inicio, data_fim, statusReserva) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, reserva.getIdUsuario());
            stmt.setInt(2, reserva.getIdSala());
            stmt.setTimestamp(3, new Timestamp(reserva.getDataInicio().getTime()));
            stmt.setTimestamp(4, new Timestamp(reserva.getDataFim().getTime()));
            stmt.setInt(5, reserva.getStatusReserva());
            stmt.executeUpdate();
        }
    }

    public boolean excluirReserva(int idReserva) {
        String sql = "DELETE FROM Reserva WHERE id_reserva = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idReserva);
            int linhas = stmt.executeUpdate();
            return linhas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Reserva buscarPorId(int idReserva) throws SQLException {
        String sql = "SELECT r.*, u.nome FROM reserva r INNER JOIN usuario u ON r.id_usuario = u.id_usuario WHERE r.id_reserva = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idReserva);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Reserva r = new Reserva();
                r.setIdReserva(rs.getInt("id_reserva"));
                r.setIdUsuario(rs.getInt("id_usuario"));
                r.setNome(rs.getString ("nome"));
                r.setIdSala(rs.getInt("id_sala"));
                r.setDataInicio(rs.getTimestamp("data_inicio"));
                r.setDataFim(rs.getTimestamp("data_fim"));
                r.setStatusReserva(rs.getInt("statusReserva"));
                return r;
            }
        }
        return null;
    } 
    
public void atualizarReserva(Reserva r) {
    String sql = "UPDATE reserva SET id_usuario = ?, id_sala = ?, data_inicio = ?, data_fim = ?, statusReserva = ? WHERE id_reserva = ?";

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setInt(1, r.getIdUsuario());
        stmt.setInt(2, r.getIdSala());
        stmt.setTimestamp(3, new java.sql.Timestamp(r.getDataInicio().getTime()));
        stmt.setTimestamp(4, new java.sql.Timestamp(r.getDataFim().getTime()));
        stmt.setInt(5, r.getStatusReserva()); // statusReserva no parâmetro 5
        stmt.setInt(6, r.getIdReserva());     // idReserva no parâmetro 6

        int linhas = stmt.executeUpdate();


        
        
        System.out.println("Linhas atualizadas: " + linhas);
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}

