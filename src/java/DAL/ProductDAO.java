/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author htlvn
 */
public class ProductDAO {

    public List<Product> getAllproducts() { //lấy tất cả product trong database
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from products_HE169003";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                category category = new category(rs.getInt(1),rs.getString(2));
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getDouble(3))
                        .description(rs.getString(4))
                        .image(rs.getString(5))
                        .createDate(rs.getString(6))
                        .categoryID(rs.getInt(7)).build();

                list.add(product);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from products_HE169003 where products_HE169003.categoryID = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                category category = new category(rs.getInt(1),rs.getString(2));
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getDouble(3))
                        .description(rs.getString(4))
                        .image(rs.getString(5))
                        .createDate(rs.getString(6))
                        .categoryID(rs.getInt(7)).build();

                list.add(product);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public List<Product> getProductWithPage(int page, int PAGE_SIZE) { //Hàm khi phân trang sử dựng câu lệnh offset thẳng trong database
//       // bởi vì nếu list toàn bộ product trong database rồi dùng sublist giải quyết thì khi xử lí, web sẽ tốn rất nhiều time với database lớn
//        List<Product> list = new ArrayList<>();
//        try {
//            String sql = "select * from  products order by id \n"
//                    + "offset (?-1)*? row fetch next ? rows only";
//            Connection conn = new DBContext().getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, page);
//            ps.setInt(2, PAGE_SIZE);
//            ps.setInt(3, PAGE_SIZE);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
////                category category = new category(rs.getInt(1),rs.getString(2));
//                Product product = Product.builder()
//                        .id(rs.getInt(1))
//                        .name(rs.getString(2))
//                        .price(rs.getDouble(3))
//                        .description(rs.getString(4))
//                        .image(rs.getString(5))
//                        .createDate(rs.getString(6))
//                        .categoryID(rs.getInt(7)).build();
//
//                list.add(product);
//
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//     public int getTotalProduct() { 
//       
//        try {
//            String sql = "select count(id) from products";
//            Connection conn = new DBContext().getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql);
//          
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                 return rs.getInt(1);
//
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 0;
//    }
    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from products_HE169003 where name like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                category category = new category(rs.getInt(1),rs.getString(2));
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getDouble(3))
                        .description(rs.getString(4))
                        .image(rs.getString(5))
                        .createDate(rs.getString(6))
                        .categoryID(rs.getInt(7)).build();

                list.add(product);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductByID(int productID) {

        try {
            String sql = "select * from products_HE169003 where products.id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                category category = new category(rs.getInt(1),rs.getString(2));
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getDouble(3))
                        .description(rs.getString(4))
                        .image(rs.getString(5))
                        .createDate(rs.getString(6))
                        .categoryID(rs.getInt(7)).build();

                return product;

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int tolProduct() {
        try {
            String sql = "SELECT Count([id])\n"
                    + "      \n"
                    + "  FROM [dbo].[products_HE169003]";
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

    public List<Product> getAllproductADMIN() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from products_HE169003 inner join category_HE169003 on products_HE169003.categoryID= category_HE169003.id";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                category category = new category(rs.getInt(1),rs.getString(2));
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .price(rs.getDouble(3))
                        .description(rs.getString(4))
                        .image(rs.getString(5))
                        .createDate(rs.getString(6))
                        .category(rs.getString(9)).build();

                list.add(product);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteProductbyID(String id) {

        try {
            String sql = "DELETE FROM [dbo].[products_HE169003]\n"
                    + "      WHERE id =?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        List<Product> pro = (List<Product>) p.getProductByID(1);
        for (Product product : pro) {
            System.out.println(pro);
        }
    }

    public void update(Product product) {
        try {
            String sql = "UPDATE [dbo].[products_HE169003]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[create_date] = ?\n"
                    + "      ,[categoryID] = ?\n"
                    + " WHERE id=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getCreateDate());
            ps.setInt(6, product.getCategoryID());
            ps.setInt(7, product.getId());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
