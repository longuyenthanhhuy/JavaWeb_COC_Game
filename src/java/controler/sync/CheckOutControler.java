/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler.sync;

import DAL.OrderDetailDAO;
import DAL.OrdersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;
import model.Account;
import model.Orders;
import model.Product;

/**
 *
 * @author htlvn
 */
public class CheckOutControler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
         HttpSession session = request.getSession();

        Map<Integer, Product> carts = (Map<Integer, Product>) session.getAttribute("carts");
        double totalmoney = 0;
        for (Map.Entry<Integer, Product> entry : carts.entrySet()) {
            Object productID = entry.getKey();
            Object product = entry.getValue();
            Product p = (Product) product;
            totalmoney += p.getPrice();

        }
      
        Account account=  (Account) session.getAttribute("account");
        Orders order = Orders.builder()
                .accountID(account.getId())
                .totalPrice((float) totalmoney).build();
        
        int orderID= new OrdersDAO().createReturnID(order);

        new OrderDetailDAO().saveCart(orderID,carts);
        session.removeAttribute("carts");
        response.sendRedirect("thankyou");
        
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
