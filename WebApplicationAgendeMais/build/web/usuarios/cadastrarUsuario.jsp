<%-- 
    Document   : cadastrarUsuario.jsp
    Created on : 2 de jun. de 2025, 14:01:20
    Author     : isabe
--%>

<%@ page import="util.ConectaDB" %>
<%@ page import="dao.UsuarioDAO" %>
<%@ page import="model.Usuario" %>
<%@ page import="java.sql.Connection" %>

<%
    String mensagem = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);

        UsuarioDAO dao = new UsuarioDAO();
        boolean sucesso = dao.inserir(usuario);

        mensagem = sucesso ? "Usuário cadastrado com sucesso!" : "Erro ao cadastrar usuário.";
    }
%>