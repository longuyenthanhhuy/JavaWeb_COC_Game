/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author htlvn
 */
public class AccountDAO {

    public Account login(String username, String password) {

        try {
            String sql = "select * from account_HE169003 where username = ? and password = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .password(rs.getString(4))
                        .displayName(rs.getString(5))
                        .role(rs.getString(6)).build();

                return account;

            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void register(String username_accountRegister, String password_accountRegister, String email_accountRegister, String displayname_accountRegister) {
        try {
            String sql = "INSERT INTO [dbo].[account_HE169003]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[displayName])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username_accountRegister);
            ps.setString(2, password_accountRegister);
            ps.setString(3, email_accountRegister);
            ps.setString(4, displayname_accountRegister);

            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        Account acc = Account.builder().build();
        acc.setUsername("test1");
        acc.setPassword("test1");
        acc.setEmail("test1");
        acc.setDisplayName("test1");
        AccountDAO check = new AccountDAO();

    }

    public boolean checkUsername(String username) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[displayName]\n"
                    + "      ,[role]\n"
                    + "  FROM [dbo].[account_HE169003]\n"
                    + "  WHERE username = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int tolAccount() {
        try {
            String sql = "SELECT Count([id])\n"
                    + "      \n"
                    + "  FROM [dbo].[account_HE169003]";
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

    public boolean checkMail(String email) {
 try {
            String sql = "SELECT [id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[email]\n"
                    + "      ,[displayName]\n"
                    + "      ,[role]\n"
                    + "  FROM [dbo].[account_HE169003]\n"
                    + "  WHERE email = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;    }

}
