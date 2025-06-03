<%-- 
    Document   : excluirUsuario
    Created on : 2 de jun. de 2025, 14:03:01
    Author     : isabe
--%>

<%@ page import="dao.UsuarioDAO" %>
<%@ page import="model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String mensagem = "";
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));

        UsuarioDAO dao = new UsuarioDAO();
        if (dao.excluir(id)) {
            mensagem = "Usuário excluído com sucesso!";
        } else {
            mensagem = "Erro ao excluir usuário.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Excluir Usuário</title>
    <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h2>Excluir Usuário</h2>
    <p><%= mensagem %></p>
    <a href="listarUsuario.jsp" class="top-link button button-edit">Voltar à lista</a>
</body>
</html>
