/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler.sync;

import jakarta.mail.Authenticator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import model.Account;
import DAL.AccountDAO;
import utils.Validate;

/**
 *
 * @author htlvn
 */
public class RegisterControler extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //gửi tin nhắn bằng mail của mình
        final String emailSend = "htlvnsid2@gmail.com";
        final String passwordSend = "nydbtrcnexbizgxa";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
      
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailSend, passwordSend);
            }
        });
        // gửi tin nhắn tới ai
        String checkduplicate = null;

        String codeActive = Validate.getRandom();

        String username = request.getParameter("username");
        boolean userCheck= new AccountDAO().checkUsername(username);
      
        if (userCheck) {
            String error="Username exist!,Input again";
            request.setAttribute("error", error);
            request.getRequestDispatcher("register.jsp").forward(request, response);
             return;

        }
        String displayname = request.getParameter("displayname");
        String email = request.getParameter("email");
          boolean mailCheck= new AccountDAO().checkMail(email);
          if (mailCheck) {
            String error="Email exist!,Input again";
            request.setAttribute("error1", error);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        Account accountRegister = Account.builder()
                .username(username)
                .displayName(displayname)
                .email(email)
                .password(password).build();
        request.getSession().setAttribute("accountRegister", accountRegister);
        request.getSession().setAttribute("codeActive", codeActive);
       
        
      
            try {
                Message mes = new MimeMessage(session);
                mes.setFrom(new InternetAddress(emailSend));
                mes.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                mes.setSubject("Active code");
                mes.setText("code to active account is:" + codeActive);
                Transport.send(mes);
                System.out.println("Done");

            } catch (MessagingException e) {
            }
         request.getRequestDispatcher("active.jsp").forward(request, response);
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
