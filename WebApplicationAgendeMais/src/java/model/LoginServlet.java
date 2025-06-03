/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author isabe
 */

import dao.UsuarioDAO;
import model.Usuario;
import util.ConectaDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Connection conn = ConectaDB.conectar();
        UsuarioDAO dao = new UsuarioDAO(conn);

        try {
            Usuario usuario = dao.buscarPorEmail(email);

            if (usuario != null && usuario.getSenha().equals(senha)) { // Para segurança real, use hash e compare hash
                // Autenticado
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);
                response.sendRedirect("main.html");
            } else {
                request.setAttribute("erro", "Email ou senha inválidos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro interno, tente novamente");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Se já está logado, redireciona para dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("usuarioLogado") != null) {
            response.sendRedirect("main.html");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
