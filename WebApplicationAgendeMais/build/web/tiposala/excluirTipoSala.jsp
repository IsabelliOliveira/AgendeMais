<%-- 
    Document   : excluirTipoSala
    Created on : 2 de jun. de 2025, 17:16:18
    Author     : isabe
--%>

<%@ page import="util.ConectaDB" %>
<%@ page import="dao.TipoSalaDAO" %>
<%@ page import="java.sql.Connection" %>

<%
    Connection conn = ConectaDB.conectar();
    TipoSalaDAO dao = new TipoSalaDAO(conn);

    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("listarTipoSala.jsp");
        return;
    }
    int id = Integer.parseInt(idParam);

    boolean excluiu = dao.excluirTipo(id);

    if (excluiu) {
        response.sendRedirect("listarTipoSala.jsp");
    } else {
        out.println("Erro ao excluir tipo de sala.");
    }
    conn.close();
%>

