<%-- 
    Document   : alterarTipoSala
    Created on : 2 de jun. de 2025, 16:33:06
    Author     : isabe
--%>
<%@ page import="util.ConectaDB" %>
<%@ page import="dao.TipoSalaDAO" %>
<%@ page import="model.TipoSala" %>
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

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Atualizar tipo
        String descricao = request.getParameter("descricao");

        TipoSala tipo = new TipoSala();
        tipo.setId(id);
        tipo.setDescricao(descricao);

        boolean atualizado = dao.atualizarTipo(tipo);

        if (atualizado) {
            response.sendRedirect("listarTipoSala.jsp");
            return;
        } else {
            out.println("Erro ao atualizar tipo de sala.");
        }
    } else {
        // Buscar tipo para preencher formulário
        TipoSala tipo = dao.buscarPorId(id);
        if (tipo == null) {
            response.sendRedirect("listarTipoSala.jsp");
            return;
        }
%>

<html>
<head><title>Alterar Tipo de Sala</title></head>
<body>
    <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
<h2>Alterar Tipo de Sala</h2>

<form method="post" action="alterarTipoSala.jsp?id=<%= id %>">
    Descrição: <input type="text" name="descricao" value="<%= tipo.getDescricao() %>" required />
    <button type="submit">Salvar</button>
</form>

<a href="listarTipoSala.jsp" class="top-link button button-edit">Voltar à lista</a>
</body>
</html>

<%
    }
    conn.close();
%>
