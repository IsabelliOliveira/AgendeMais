<%-- 
    Document   : index
    Created on : 6 de jun. de 2025, 14:24:59
    Author     : isabe
--%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Agende +</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      margin: 0;
      padding: 0;
      height: 100vh;
      display: flex;
      flex-direction: column;
    }
    #mainFrame {
      flex: 1;
      width: 100%;
      border: none;
    }
  </style>
</head>
<body>

  <%@ include file="menu.jsp" %> <!-- Inclui o menu no topo -->

  <!-- Área principal com iframe para conteúdo -->
  <iframe id="mainFrame" src="main.html" name="main_page"></iframe>

</body>
</html>
