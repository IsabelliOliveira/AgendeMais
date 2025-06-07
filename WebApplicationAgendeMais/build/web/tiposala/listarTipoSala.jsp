<%-- 
    Document   : listarTipoSala
    Created on : 2 de jun. de 2025, 16:28:55
    Author     : isabe
--%>

<%@ page import="util.ConectaDB" %>
<%@ page import="dao.TipoSalaDAO" %>
<%@ page import="model.TipoSala" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>

<%
    Connection conn = ConectaDB.conectar();
    TipoSalaDAO dao = new TipoSalaDAO(conn);
    List<TipoSala> tipos = dao.listarTipos();
%>

<html>
<head><title>Tipos de Sala</title></head>
<body>
<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
<link href="../css/estilo2.css" rel="stylesheet" type="text/css"/>
<h2>Tipos de Sala</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Descrição</th>
        <th>Ações</th>
    </tr>
    <%
        for (TipoSala tipo : tipos) {
    %>
    <tr>
        <td><%= tipo.getId() %></td>
        <td><%= tipo.getDescricao() %></td>
        <td>
            <a href="alterarTipoSala.jsp?id=<%= tipo.getId() %>">Editar</a>
            <a href="excluirTipoSala.jsp?id=<%= tipo.getId() %>" onclick="return confirm('Deseja excluir este tipo?')">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>
</table>



<a href="index.html"class="top-link button button-edit">Voltar</a>
</body>
</html>
