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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author htlvn
 */
public class OrderDetailDAO {

    public void saveCart(int orderID, Map<Integer, Product> carts) {

        try {
            String sql = "INSERT INTO [dbo].[order_detail_HE169003]\n"
                    + "           ([order_id]\n"
                    + "           ,[product_id])\n"
                    + "     VALUES\n"
                    + "           (?,?)";

            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            for (Map.Entry<Integer, Product> entry : carts.entrySet()) {
                Integer productID = entry.getKey();
                Product product = entry.getValue();

                ps.setInt(2, product.getId());

                ps.executeUpdate();

            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Integer> getAllproduct(int accountID) {
        List<Integer> list = new ArrayList<>();
        try {
            String sql = "select order_detail_HE169003.product_id from orders_HE169003 inner join order_detail_HE169003 on orders_HE169003.id=order_detail_HE169003.order_id where orders_HE169003.account_id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountID);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteOrderDetailbyProductID(String id) {
        try {
            String sql = "DELETE FROM [dbo].[order_detail_HE169003]\n"
                    + "      WHERE product_id =?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        OrderDetailDAO p = new OrderDetailDAO();
        List<Integer> lis = p.getAllproduct(1);
        System.out.println(lis);
    }

    public int tolMoney() {
        try {
            String sql = "select sum(products_HE169003.price) from products_HE169003 inner join order_detail_HE169003 on products_HE169003.id=order_detail_HE169003.product_id ";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
