<%@ page import="util.ConectaDB" %>
<%@ page import="dao.ReservaDAO" %>
<%@ page import="model.Reserva" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Connection conn = ConectaDB.conectar();
    ReservaDAO dao = new ReservaDAO(conn);
    Reserva reserva = null;
    String idStr = request.getParameter("id");

    if (idStr != null) {
        int id = Integer.parseInt(idStr);
        reserva = dao.buscarPorId(id);  
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            String nome = request.getParameter("nome"); 
            int idSala = Integer.parseInt(request.getParameter("id_sala"));
            String dataInicioStr = request.getParameter("data_inicio");
            String dataFimStr = request.getParameter("data_fim");
            int StatusReserva = Integer.parseInt(request.getParameter("statusReserva"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            java.util.Date dataInicio = sdf.parse(dataInicioStr);
            java.util.Date dataFim = sdf.parse(dataFimStr);

            Reserva r = new Reserva();
            r.setIdReserva(Integer.parseInt(idStr)); 
            r.setIdUsuario(idUsuario);
            r.setNome(nome);
            r.setIdSala(idSala);
            r.setDataInicio(dataInicio);
            r.setDataFim(dataFim);
            r.setStatusReserva(StatusReserva);

            dao.atualizarReserva(r); 

            response.sendRedirect("listarReservas.jsp");
            return;
        } catch (Exception e) {
            out.println("Erro: " + e.getMessage());
        }
    }
%>

<html>
<head><title>Alterar Reserva</title></head>
<body>
<link href="../css/estilo2.css" rel="stylesheet" type="text/css"/>
<h2>Alterar Reserva</h2>

<% if (reserva != null) { 
    SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
%>
<form method="post">
    <input type="hidden" name="id_usuario" value="<%= reserva.getIdUsuario() %>" required /><br/>
    Usuário: <input type="text" name="nome" value="<%= reserva.getNome() %>" required /><br/>
    <input type="hidden" name="id_sala" value="<%= reserva.getIdSala() %>" required /><br/>
    Data Início: <input type="datetime-local" name="data_inicio" value="<%= sdfInput.format(reserva.getDataInicio()) %>" required /><br/>
    Data Fim: <input type="datetime-local" name="data_fim" value="<%= sdfInput.format(reserva.getDataFim()) %>" required /><br/>
    Status Reserva:
    <select name="statusReserva" required>
        <option value=""> </option>
        <option value="0" <%= (reserva.getStatusReserva() == 0) ? "selected" : "" %>>Pendente</option>
        <option value="1" <%= (reserva.getStatusReserva() == 1) ? "selected" : "" %>>Concluído</option>
        <option value="2" <%= (reserva.getStatusReserva() == 2) ? "selected" : "" %>>Cancelado</option>
        <option value="3" <%= (reserva.getStatusReserva() == 3) ? "selected" : "" %>>Finalizado</option>
    </select><br/><br/>

    <button type="submit">Salvar Alterações</button>
</form>
<% } else { %>
<p>Reserva não encontrada.</p>
<% } %>

<a href="listarReservas.jsp">Voltar</a>
</body>
</html>
