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
import model.Category;

/**
 *
 * @author htlvn
 */
public class CategoryDAO {

    public List<Category> getAllcategories() {
        List<Category> list = new ArrayList<>();
        try { 
            String sql="select * from category_HE169003";
            Connection conn= new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs= ps.executeQuery();
            while (rs.next()) {   
//                category category = new category(rs.getInt(1),rs.getString(2));
                Category category =  Category.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2)).build();
      
                list.add(category);
                
            }
                    } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
