/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler.sync;

import DAL.ProductDAO;
import DAL.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;
import model.*;

/**
 *
 * @author htlvn
 */
public class HomeControler extends HttpServlet {

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

        HttpSession session = request.getSession();//khởi tạo session
///////////////////////////////////////////////////////////////////////////////////////////////

        final int PAGE_SIZE = 15;// số lượng item trong 1 page
        int currentPage = 1;// page ban đầu là 1
//////////////////////////////////////////////////////////////////////////////////phần code khởi tạo lấy dữ liệu từ DAO
        ProductDAO productDAO = new ProductDAO();
        List<Category> listCategories = new CategoryDAO().getAllcategories();//lấy list category từ database    

////////////////////////////////////////////////////////////////////////////////////////////////
        String pageStr = request.getParameter("page");//lấy request page 
        if (pageStr != null) {
            currentPage = Integer.parseInt(pageStr);
        }
        List<Product> listProduct = productDAO.getAllproducts();//lấy list product theo page từ database

        int totalProduct = listProduct.size();//lấy số lượng page tối đa

        Page pages = Page.builder()
                .page(currentPage)
                .sizePage(PAGE_SIZE)
                .totalItem(totalProduct)
                .build();
        pages.calc();

//////////////////////////////////////////phần code gửi các requesst client/////////////////////////////////////////////
        session.setAttribute("listCategories", listCategories);
        request.setAttribute("listProduct", listProduct.subList(pages.getBegin(), pages.getEnd()));
//        request.setAttribute("listProduct", listProduct.subList((currentPage-1)*PAGE_SIZE, currentPage*PAGE_SIZE));
        request.setAttribute("pages", pages);
        session.setAttribute("urlHistory","home");

        request.getRequestDispatcher("homepage.jsp").forward(request, response);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
        processRequest(request, response);
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
        processRequest(request, response);
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
