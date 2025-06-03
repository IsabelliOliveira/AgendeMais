<%-- 
    Document   : inserirSala
    Created on : 2 de jun. de 2025, 17:28:26
    Author     : isabe
--%>

<%@ page import="dao.TipoSalaDAO" %>
<%@ page import="model.TipoSala" %>
<%@ page import="dao.SalaDAO" %>
<%@ page import="model.Sala" %>
<%@ page import="util.ConectaDB" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
    SalaDAO daoSala = new SalaDAO(ConectaDB.conectar());
    TipoSalaDAO daoTipo = new TipoSalaDAO(ConectaDB.conectar());
    List<TipoSala> tipos = daoTipo.listarTipos();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nome = request.getParameter("nomeSala");
        int capacidade = Integer.parseInt(request.getParameter("capacidade"));
        int tipoId = Integer.parseInt(request.getParameter("tipoSalaId"));

        Sala sala = new Sala();
        sala.setNomeSala(nome);
        sala.setCapacidade(capacidade);
        sala.setTipoSalaId(tipoId);

        boolean inserido = daoSala.inserirSala(sala);
        if (inserido) {
            response.sendRedirect("listarSala.jsp");
            return;
        } else {
            out.println("Erro ao inserir sala.");
        }
    }
%>

<html>
<head><title>Nova Sala</title></head>
<body>
<h2>Inserir Nova Sala</h2>

<form method="post" action="inserirSala.jsp">
    Nome da Sala: <input type="text" name="nomeSala" required/><br/><br/>
    Capacidade: <input type="number" name="capacidade" required/><br/><br/>
    Tipo de Sala:
    <select name="tipoSalaId" required>
        <option value="">--Selecione--</option>
        <%
            for (TipoSala tipo : tipos) {
        %>
            <option value="<%= tipo.getId() %>"><%= tipo.getDescricao() %></option>
        <%
            }
        %>
    </select><br/><br/>
    <button type="submit">Salvar</button>
</form>

<a href="listarSala.jsp">Voltar</a>
</body>
</html>

