<%-- 
    Document   : cadastrarReserva
    Created on : 2 de jun. de 2025, 15:06:16
    Author     : isabe
--%>
<%@page import="util.ConectaDB"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="dao.ReservaDAO"%>
<%@ page import="model.Reserva" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String mensagemErro = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            int idSala = Integer.parseInt(request.getParameter("id_sala"));
            String dataInicioStr = request.getParameter("data_inicio");
            String dataFimStr = request.getParameter("data_fim");
            int statusReserva = Integer.parseInt(request.getParameter("statusReserva"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date dataInicio = sdf.parse(dataInicioStr);
            Date dataFim = sdf.parse(dataFimStr);

            if (dataFim.before(dataInicio)) {
                mensagemErro = "Data fim não pode ser anterior à data início.";
            } else {
                Reserva r = new Reserva();
                r.setIdUsuario(idUsuario);
                r.setIdSala(idSala);
                r.setDataInicio(dataInicio);
                r.setDataFim(dataFim);
                r.setStatusReserva(statusReserva);

                try (Connection conn = ConectaDB.conectar()) {
                    ReservaDAO dao = new ReservaDAO(conn);
                    dao.inserirReserva(r);
                }

                response.sendRedirect("listarReservas.jsp");
                return;
            }
        } catch (Exception e) {
            mensagemErro = "Erro: " + e.getMessage();
        }
    }
%>



