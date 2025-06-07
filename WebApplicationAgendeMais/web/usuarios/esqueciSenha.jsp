<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String erro = request.getParameter("erro");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Recuperar Senha</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow-sm" style="max-width: 400px; width: 100%;">
        <h4 class="mb-3 text-center">Recuperar Senha</h4>
        <form method="post" action="verificaEmail.jsp">
            <div class="mb-3">
                <label>E-mail</label>
                <input type="email" name="email" class="form-control" required />
            </div>
            <button type="submit" class="btn btn-primary w-100">Verificar</button>
        </form>
        <%
            if (erro != null) {
        %>
        <div class="alert alert-danger mt-2"><%= erro %></div>
        <%
            }
        %>
        <div class="mt-3 text-center">
            <a href="../login.jsp">Voltar para o login</a>
        </div>
    </div>
</div>
</body>
</html>
