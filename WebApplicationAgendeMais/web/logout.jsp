<%-- 
    Document   : logout
    Created on : 3 de jun. de 2025, 01:39:40
    Author     : isabe
--%>

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
