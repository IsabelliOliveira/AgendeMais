<%-- 
    Document   : verificaEmail
    Created on : 6 de jun. de 2025, 16:44:03
    Author     : isabe
--%>

<%@ page import="model.Usuario" %>
<%@ page import="dao.UsuarioDAO" %>
<%
    String email = request.getParameter("email");

    try {
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.buscarPorEmail(email);

        if (usuario != null) {
            session.setAttribute("emailRecuperacao", email);
            response.sendRedirect("novaSenha.jsp");
        } else {
            response.sendRedirect("esqueciSenha.jsp?erro=E-mail não encontrado");
        }
    } catch (Exception e) {
        response.sendRedirect("esqueciSenha.jsp?erro=Erro ao acessar o banco");
    }
%>
