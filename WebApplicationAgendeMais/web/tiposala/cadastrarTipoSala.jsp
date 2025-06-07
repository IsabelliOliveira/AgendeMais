<%-- 
    Document   : cadastrarTipoSala
    Created on : 2 de jun. de 2025, 16:29:12
    Author     : isabe
--%>

<%@ page import="util.ConectaDB" %>
<%@ page import="dao.TipoSalaDAO" %>
<%@ page import="model.TipoSala" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%

    String descricao = request.getParameter("descricao");


    if (descricao != null && !descricao.trim().isEmpty()) {
        Connection conn = ConectaDB.conectar();
        if (conn == null) {
            out.println("Erro: não foi possível conectar ao banco.");
        } else {

            TipoSalaDAO dao = new TipoSalaDAO(conn);


            TipoSala tipo = new TipoSala();
            tipo.setDescricao(descricao);


            boolean inseriu = dao.inserirTipo(tipo);
            if (inseriu) {

                response.sendRedirect("listarTipoSala.jsp");
                return;
            } else {

                out.println("Erro ao cadastrar tipo de sala.");
            }
        }
    } else {
        out.println("O campo 'descricao' é obrigatório.");
    }
%>





