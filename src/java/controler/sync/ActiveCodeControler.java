/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler.sync;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author htlvn
 */
public class ActiveCodeControler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ActiveCodeControler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActiveCodeControler at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String checktime = request.getParameter("checktime");
        if (checktime != null) {
            request.getSession().removeAttribute("codeActive");
            request.getSession().removeAttribute("accountRegister");
            request.setAttribute("error", "Time out to active account,Register again");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String err = null;
        String activeEmail = request.getParameter("activemail");
        String codeActive = (String) request.getSession().getAttribute("codeActive");
        Account accountRegister = (Account) request.getSession().getAttribute("accountRegister");
        String username_accountRegister=accountRegister.getUsername();
        String password_accountRegister=accountRegister.getPassword();
        String email_accountRegister=accountRegister.getEmail();
        String displayname_accountRegister=accountRegister.getDisplayName();
        if (activeEmail.equals(codeActive)) {
            new AccountDAO().register(username_accountRegister,password_accountRegister,email_accountRegister,displayname_accountRegister);
            
            
            request.getSession().removeAttribute("codeActive");
            request.getSession().removeAttribute("accountRegister");
            request.setAttribute("error", "Register succesfully,thank you");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else {
            request.setAttribute("error", "Wrong active code, input again!");
            request.getRequestDispatcher("active.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
