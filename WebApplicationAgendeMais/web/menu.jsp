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
      padding: 10px;
      font-family: 'Segoe UI', sans-serif;
    }
    .accordion-button {
      background-color: #e3f2fd;
      font-weight: 600;
    }
    .accordion-body a {
      color: #333;
      text-decoration: none;
      padding: 5px 0;
    }
    .accordion-body a:hover {
      color: #0d6efd;
    }
    




  </style>
</head>
<body>
  <h3 class="text-center mb-4">
    <a href="/web/index.html" target="_blank" rel="noopener noreferrer" class="text-decoration-none text-dark">
      <i class="bi bi-calendar2-check-fill text-primary"></i> Agende+
    </a>
  </h3>

  <div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:220px; height:100vh;">
<% 
  Object usuarioLogado = session.getAttribute("usuarioLogado");
  if (usuarioLogado != null) {
%>
    <a href="usuarios/index.html" target="main_page" class="w3-bar-item w3-button w3-hover-indigo">
  <i class="bi bi-person-fill"></i> Usuários
</a>
<a href="salas/index.html" target="main_page" class="w3-bar-item w3-button w3-hover-indigo">
  <i class="bi bi-building"></i> Salas
</a>
<a href="reservas/index.html" target="main_page" class="w3-bar-item w3-button w3-hover-indigo">
  <i class="bi bi-calendar-event"></i> Reservas
</a>
<a href="tiposala/index.html" target="main_page" class="w3-bar-item w3-button w3-hover-indigo">
  <i class="bi bi-folder-fill"></i> Tipo de Sala
</a>
<a href="logout.jsp" target="_blank" class="w3-bar-item w3-button w3-red w3-hover-dark-red">
  <i class="bi bi-box-arrow-right"></i> Sair
</a>

<% } else { %>
    <p>Você precisa fazer login para acessar o menu.</p>
<% } %>
  </div>
</body>
</html>
