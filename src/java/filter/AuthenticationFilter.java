/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author htlvn
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/add-to-cart", "/show-carts", "/delete-cart", "/admin/*"})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        // kiểm tra đăng nhập
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            chain.doFilter(request, response);
        } else {
            //kiểm tra cookie
            Cookie[] cookies = req.getCookies();
            String username = null;
            String password = null;
            for (Cookie cooky : cookies) {

                if (cooky.getName().equals("username")) {
                    username = cooky.getValue();
                }
                if (cooky.getName().equals("password")) {
                    password = cooky.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
                

            }

            if (username != null && password != null) {
                Account accountLogin = new AccountDAO().login(username, password);
                if (accountLogin != null) {
                    session.setAttribute("account", account);
                    chain.doFilter(request, response);
                    return;

                }
            }
                    res.sendRedirect("http://localhost:9999/PRJ_Final/login");
        }


    }

    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    @Override
    public void init(FilterConfig filterConfig) {

    }

    /**
     * Return a String representation of this object.
     */
}
