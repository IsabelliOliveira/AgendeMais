<%-- 
    Document   : listarUsuario
    Created on : 2 de jun. de 2025, 14:01:55
    Author     : isabe
--%>

<%@ page import="dao.UsuarioDAO" %>
<%@ page import="model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.consultarTodos();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuários</title>
    <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h2>Usuários Cadastrados</h2>

    <a href="index.html" class="top-link button button-edit">Voltar</a>

    <table>
        <tr>
            <th>ID</th><th>Nome</th><th>Email</th><th>Senha</th><th>Ações</th>
        </tr>
        <%
            if (lista != null) {
                for (Usuario u : lista) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getNome() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getSenha() %></td>
            <td>
                <a href="editarUsuario.jsp?id=<%= u.getId() %>" class="button button-edit">Editar</a>
                <a href="excluirUsuario.jsp?id=<%= u.getId() %>" class="button button-delete" onclick="return confirm('Deseja excluir este usuário?');">Excluir</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5">Nenhum usuário encontrado.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
