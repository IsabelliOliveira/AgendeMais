<%-- 
    Document   : novaSenha
    Created on : 6 de jun. de 2025, 16:44:48
    Author     : isabe
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = (String) session.getAttribute("emailRecuperacao");
    if (email == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    String erro = request.getParameter("erro");
    String sucesso = request.getParameter("sucesso");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Nova Senha</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow-sm" style="max-width: 400px; width: 100%;">
        <h4 class="mb-3 text-center">Definir Nova Senha</h4>
        <form method="post" action="salvarNovaSenha.jsp">
            <div class="mb-3">
                <label>Nova senha</label>
                <input type="password" name="novaSenha" class="form-control" required />
            </div>
            <div class="mb-3">
                <label>Confirmar nova senha</label>
                <input type="password" name="confirmarSenha" class="form-control" required />
            </div>
            <button type="submit" class="btn btn-success w-100">Salvar</button>
        </form>
        <% if (erro != null) { %>
        <div class="alert alert-danger mt-2"><%= erro %></div>
        <% } %>
        <% if (sucesso != null) { %>
        <div class="alert alert-success mt-2"><%= sucesso %></div>
        <% } %>
    </div>
</div>
</body>
</html>
