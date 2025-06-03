<%-- 
    Document   : listarSala
    Created on : 2 de jun. de 2025, 17:28:09
    Author     : isabe
--%>

<%@ page import="dao.SalaDAO" %>
<%@ page import="model.Sala" %>
<%@ page import="util.ConectaDB" %>
<%@ page import="java.util.List" %>
<%
    SalaDAO dao = new SalaDAO(ConectaDB.conectar());
    List<Sala> salas = dao.listarSalas();
%>

<html>
<head>
    <title>Listar Salas</title></head>
<body>
    <link href="../css/estilo2.css" rel="stylesheet" type="text/css"/>
    <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
<h2>Salas Disponíveis</h2>

<a href="inserirSala.jsp">Nova Sala</a><br/><br/>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Capacidade</th>
        <th>Tipo Sala</th>
        <th>Ações</th>
    </tr>
    <%
        for (Sala s : salas) {
    %>
    <tr>
        <td><%= s.getIdSala() %></td>
        <td><%= s.getNomeSala() %></td>
        <td><%= s.getCapacidade() %></td>
        <td><%= s.getTipoSalaId() %></td> <!-- só o ID, podemos melhorar depois -->
        <td>
            <a href="alterarSala.jsp?id=<%= s.getIdSala() %>">Editar</a> |
            <a href="excluirSala.jsp?id=<%= s.getIdSala() %>" onclick="return confirm('Confirma exclusão?');">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
