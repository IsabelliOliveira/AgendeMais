<%-- 
    Document   : excluirReserva
    Created on : 2 de jun. de 2025, 15:06:47
    Author     : isabe
--%>

<%@ page import="util.ConectaDB" %>
<%@ page import="dao.ReservaDAO" %>
<%@ page import="java.sql.Connection" %>
<%

    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = ConectaDB.conectar();  // pega a conexão
    ReservaDAO dao = new ReservaDAO(conn);   // passa a conexão para o DAO

    String mensagem;
    if (dao.excluirReserva(id)) {
        mensagem = "Reserva excluída com sucesso!";
    } else {
        mensagem = "Erro ao excluir reserva.";
    }
%>
<html>
<head><title>Excluir Reserva</title></head>
<body>
    <h2><%= mensagem %></h2>
    <a href="listarReservas.jsp">Voltar</a>
</body>
</html>
