<%@page import="model.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    if (email != null && senha != null) {
        try {
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuario = dao.buscarPorEmail(email);

            if (usuario != null && usuario.getSenha().equals(senha)) {
                session.setAttribute("usuarioLogado", usuario);
                response.sendRedirect("main.html");
                return;
            } else {
                request.setAttribute("erro", "E-mail ou senha inválidos.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao conectar ao banco.");
        }
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-sm p-4" style="max-width: 400px; width: 100%;">
        <div class="text-center mb-4">
            <img src="img/logo.png" alt="Logo" class="img-fluid" style="max-height: 80px;" />
        </div>
        <h3 class="text-center mb-4">Login</h3>
        <form method="post" action="login.jsp">
            <div class="mb-3">
                <label for="email" class="form-label">E-mail</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Digite seu e-mail" required autofocus>
            </div>
            <div class="mb-3">
                <label for="senha" class="form-label">Senha</label>
                <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Entrar</button>
        </form>

        <%
            if (request.getAttribute("erro") != null) {
        %>
            <div class="alert alert-danger mt-3" role="alert">
                <%= request.getAttribute("erro") %>
            </div>
        <%
            }
        %>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle CDN (opcional para alguns componentes) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
