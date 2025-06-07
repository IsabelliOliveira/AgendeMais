<%-- 
    Document   : listarReservas
    Created on : 2 de jun. de 2025, 15:05:43
    Author     : isabe
--%>

<%@ page import="util.ConectaDB" %>
<%@ page import="dao.ReservaDAO" %>
<%@ page import="model.Reserva" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>


<%
    Connection conn = ConectaDB.conectar();
    ReservaDAO dao = new ReservaDAO(conn);
    List<Reserva> reservas = dao.listarReservas();
%>

<html>
<head><title>Listar Reservas</title></head>
<body>
<h2>Reservas</h2>
<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
<link href="../css/estilo2.css" rel="stylesheet" type="text/css"/>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>ID Sala</th>
        <th>Data Início</th>
        <th>Data Fim</th>
        <th>Status</th>
        <th>Ações</th>
    </tr>
    <%
        for (Reserva r : reservas) {
    %>
    <tr>
        <td><%= r.getIdReserva() %></td>
        <td><%= r.getNome() %></td>
        <td><%= r.getIdSala() %></td>
        <td><%= r.getDataInicio() %></td>
        <td><%= r.getDataFim() %></td>
        <td><%= r.getStatusReserva() %></td>
        <td>
            <a href="alterarReserva.jsp?id=<%= r.getIdReserva() %>" class="button button-edit">Editar</a>
            <a href="excluirReserva.jsp?id=<%= r.getIdReserva() %>" class="button button-delete" onclick="return confirm('Deseja excluir esta reserva?');">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
    <a href="index.html" class="top-link button button-edit">Voltar à lista</a>

</body>
</html>
