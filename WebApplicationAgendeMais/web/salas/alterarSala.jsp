<%-- 
    Document   : alterarSala
    Created on : 2 de jun. de 2025, 17:28:40
    Author     : isabe
--%>

<%@ page import="dao.SalaDAO" %>
<%@ page import="model.Sala" %>
<%@ page import="dao.TipoSalaDAO" %>
<%@ page import="model.TipoSala" %>
<%@ page import="util.ConectaDB" %>
<%@ page import="java.util.List" %>

<%
    SalaDAO daoSala = new SalaDAO(ConectaDB.conectar());
    TipoSalaDAO daoTipo = new TipoSalaDAO(ConectaDB.conectar());
    List<TipoSala> tipos = daoTipo.listarTipos();

    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("listarSala.jsp");
        return;
    }
    int id = Integer.parseInt(idParam);

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nome = request.getParameter("nomeSala");
        int capacidade = Integer.parseInt(request.getParameter("capacidade"));
        int tipoId = Integer.parseInt(request.getParameter("tipoSalaId"));

        Sala sala = new Sala();
        sala.setIdSala(id);
        sala.setNomeSala(nome);
        sala.setCapacidade(capacidade);
        sala.setTipoSalaId(tipoId);

        boolean atualizado = daoSala.atualizarSala(sala);
        if (atualizado) {
            response.sendRedirect("listarSala.jsp");
            return;
        } else {
            out.println("Erro ao atualizar sala.");
        }
    } else {
        Sala sala = daoSala.buscarPorId(id);
        if (sala == null) {
            response.sendRedirect("listarSala.jsp");
            return;
        }
%>

<html>
<head><title>Alterar Sala</title></head>
<body>
<h2>Alterar Sala</h2>

<form method="post" action="alterarSala.jsp?id=<%= id %>">
    Nome da Sala: <input type="text" name="nomeSala" value="<%= sala.getNomeSala() %>" required/><br/><br/>
    Capacidade: <input type="number" name="capacidade" value="<%= sala.getCapacidade() %>" required/><br/><br/>
    Tipo de Sala:
    <select name="tipoSalaId" required>
        <option value="">--Selecione--</option>
        <%
            for (TipoSala tipo : tipos) {
                String selected = (tipo.getId() == sala.getTipoSalaId()) ? "selected" : "";
        %>
            <option value="<%= tipo.getId() %>" <%= selected %> ><%= tipo.getDescricao() %></option>
        <%
            }
        %>
    </select><br/><br/>
    <button type="submit">Salvar</button>
</form>

<a href="listarSala.jsp">Voltar</a>
</body>
</html>

<%
    }
%>

