<%-- 
    Document   : salvarNovaSenha
    Created on : 6 de jun. de 2025, 16:45:15
    Author     : isabe
--%>

<%@ page import="dao.UsuarioDAO" %>
<%
    String novaSenha = request.getParameter("novaSenha");
    String confirmarSenha = request.getParameter("confirmarSenha");
    String email = (String) session.getAttribute("emailRecuperacao");

    if (email == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    if (!novaSenha.equals(confirmarSenha)) {
        response.sendRedirect("novaSenha.jsp?erro=As senhas não coincidem");
        return;
    }

    try {
        UsuarioDAO dao = new UsuarioDAO();
        dao.atualizarSenha(email, novaSenha);
        session.removeAttribute("emailRecuperacao");
        response.sendRedirect("../login.jsp?sucesso=Senha redefinida com sucesso");
    } catch (Exception e) {
        response.sendRedirect("novaSenha.jsp?erro=Erro ao salvar nova senha");
    }
%>

