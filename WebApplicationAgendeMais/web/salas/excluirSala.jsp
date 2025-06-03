<%-- 
    Document   : excluirSala
    Created on : 2 de jun. de 2025, 17:28:56
    Author     : isabe
--%>

<%@ page import="dao.SalaDAO" %>
<%@ page import="util.ConectaDB" %>

<%
    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("listarSala.jsp");
        return;
    }
    int id = Integer.parseInt(idParam);

    SalaDAO dao = new SalaDAO(ConectaDB.conectar());
    boolean excluido = dao.excluirSala(id);

    response.sendRedirect("listarSala.jsp");
%>
