<%-- 
    Document   : editarUsuario
    Created on : 2 de jun. de 2025, 14:02:38
    Author     : isabe
--%>

<%@ page import="dao.UsuarioDAO" %>
<%@ page import="model.Usuario" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String mensagem = "";
    Usuario usuario = new Usuario();
    UsuarioDAO dao = new UsuarioDAO();

    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        usuario = dao.consultarPorId(id);
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        usuario.setId(Integer.parseInt(request.getParameter("id")));
        usuario.setNome(request.getParameter("nome"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setSenha(request.getParameter("senha"));

        if (dao.alterar(usuario)) {
            mensagem = "Usuário atualizado com sucesso!";
        } else {
            mensagem = "Erro ao atualizar usuário.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuário</title>
    <style>
        /* estilo.css */

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f7fa;
    color: #333;
    margin: 0;
    padding: 20px;
}

h2 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 30px;
}

form {
    max-width: 400px;
    margin: 0 auto;
    background: #fff;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
    color: #34495e;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px 12px;
    margin-bottom: 20px;
    border: 1.8px solid #bdc3c7;
    border-radius: 5px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #2980b9;
    outline: none;
}

input[type="submit"] {
    width: 100%;
    background-color: #2980b9;
    color: white;
    font-weight: 700;
    border: none;
    padding: 12px 0;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #1f6391;
}

p {
    text-align: center;
    font-weight: 600;
    margin-top: 15px;
}

/* Estilo do link "Voltar à lista" */

a.top-link {
    display: inline-block;
    margin: 30px auto 0;
    text-decoration: none;
    background-color: #27ae60;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    font-weight: 600;
    transition: background-color 0.3s ease;
    text-align: center;
}

a.top-link:hover {
    background-color: #1e8449;
}

/* Responsividade simples */

@media (max-width: 480px) {
    form {
        padding: 20px 15px;
        max-width: 90%;
    }
}

    </style>

</head>
<body>
    <h2>Editar Usuário</h2>
    <form method="post">
        <input type="hidden" name="id" value="<%= usuario.getId() %>">

        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<%= usuario.getNome() %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= usuario.getEmail() %>" required>

        <label for="senha">Senha:</label>
        <input type="text" id="senha" name="senha" value="<%= usuario.getSenha() %>" required>

        <input type="submit" value="Salvar Alterações">
    </form>

    <p style="color: green;"><%= mensagem %></p>

    <a href="listarUsuario.jsp" class="top-link button button-edit">Voltar à lista</a>
</body>
</html>
