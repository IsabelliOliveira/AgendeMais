/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

/**
 *
 * @author isabe
 */


import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/main.html", "/reservas.jsp", "/clientes.jsp", "/quartos.jsp", "/agenda.jsp"})
public class AutenticacaoFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        boolean usuarioLogado = (session != null && session.getAttribute("usuarioLogado") != null);

        if (usuarioLogado) {
            chain.doFilter(request, response); // continua normalmente
        } else {
            res.sendRedirect("login.jsp"); // redireciona para login
        }
    }

    public void init(FilterConfig filterConfig) throws ServletException {}
    public void destroy() {}
}
