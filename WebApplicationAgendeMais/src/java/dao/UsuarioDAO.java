/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;

import java.util.ArrayList;
import java.util.List;

import model.Usuario;
import util.ConectaDB;


/**
 *
 * @author isabe
 */


public class UsuarioDAO {

    public UsuarioDAO(Connection conn) {
        
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public UsuarioDAO() {
    // Construtor padrão
}

    // Inserir novo usuário
    public boolean inserir(Usuario usuario) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "INSERT INTO Usuario (nome, email, senha) VALUES (?, ?, ?)";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    // Consultar todos os usuários
    public List<Usuario> consultarTodos() throws ClassNotFoundException {
        List<Usuario> lista = new ArrayList<>();
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM Usuario";
            Statement stmt = conexao.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                lista.add(usuario);
            }

            return lista.isEmpty() ? null : lista;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }

    // Consultar usuário por ID
    public Usuario consultarPorId(int id) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM Usuario WHERE id_usuario = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                return usuario;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }

    // Excluir usuário por ID
    public boolean excluir(int id) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "DELETE FROM Usuario WHERE id_usuario = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }

    // Atualizar dados do usuário
    public boolean alterar(Usuario usuario) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "UPDATE Usuario SET nome = ?, email = ? WHERE id_usuario = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setInt(3, usuario.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
    
        public void atualizarSenha(String email, String novaSenha) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            String sql = "UPDATE Usuario SET senha = ? WHERE email = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, novaSenha);
            stmt.setString(2, email);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conexao != null) {
                try {
                    conexao.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    
    public Usuario buscarPorEmail(String email) throws ClassNotFoundException {
    Connection conexao = null;
    try {
        conexao = ConectaDB.conectar();
        String sql = "SELECT * FROM Usuario WHERE email = ?";
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id_usuario"));     // Ajuste para o seu getter/setter
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setSenha(rs.getString("senha"));
            return u;
        }
    } catch (SQLException ex) {
        System.out.println("Erro SQL: " + ex);
    } finally {
        try {
            if (conexao != null) conexao.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao fechar conexão: " + ex);
        }
    }
    return null;
}

}


