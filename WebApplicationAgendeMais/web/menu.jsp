<%-- 
    Document   : menu
    Created on : 3 de jun. de 2025, 02:08:03
    Author     : isabe
--%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Agende+</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background-color: #fefefe;
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
    }

    .navbar-nav .nav-link {
      font-weight: 500;
    }

    .nav-link i {
      margin-right: 5px;
    }

    .main-content {
      padding: 5px;
    }
  </style>
</head>
<body>

 <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand text-primary fw-bold" href="index.jsp" target="_blank">
      <i class="bi bi-calendar2-check-fill"></i> Agende+
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
      <% 
        Object usuarioLogado = session.getAttribute("usuarioLogado");
        boolean logado = (usuarioLogado != null);
      %>

      <% if (logado) { %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link" href="usuarios/index.html" target="main_page"><i class="bi bi-person-fill"></i> Usuários</a></li>
          <li class="nav-item"><a class="nav-link" href="salas/index.html" target="main_page"><i class="bi bi-building"></i> Salas</a></li>
          <li class="nav-item"><a class="nav-link" href="reservas/index.html" target="main_page"><i class="bi bi-calendar-event"></i> Reservas</a></li>
          <li class="nav-item"><a class="nav-link" href="tiposala/index.html" target="main_page"><i class="bi bi-folder-fill"></i> Tipo de Sala</a></li>
        </ul>

        <div class="d-flex">
          <a href="logout.jsp" class="btn btn-outline-danger"><i class="bi bi-box-arrow-right"></i> Sair</a>
        </div>
      <% } else { %>
        <div class="ms-auto">
          <a href="login.jsp" class="btn btn-primary" target="main_page"><i class="bi bi-box-arrow-in-right"></i> Login</a>
        </div>
      <% } %>
    </div>
  </div>
</nav>

  <div class="main-content">
  </div>

</body>
</html>
