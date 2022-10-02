/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Orders;

/**
 *
 * @author htlvn
 */
public class OrdersDAO {

  

        public int createReturnID(Orders order) {
           
            try {
                String sql = "INSERT INTO [dbo].[orders_HE169003]\n"
                        + "           ([account_id]\n"
                        + "           ,[totalPrice])\n"
                        + "     VALUES\n"
                        + "          (?,?)";

                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, order.getAccountID());
                ps.setDouble(2, order.getTotalPrice());
                ps.executeUpdate();
                ResultSet rs =ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
                
                
              
            } catch (Exception ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return 0;
            
            }

    public int tolOrder() {
 try {
            String sql = "SELECT Count([id])\n"
                    + "      \n"
                    + "  FROM [dbo].[orders_HE169003]";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
          
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return 0;      }
           
        
        }
        
    


