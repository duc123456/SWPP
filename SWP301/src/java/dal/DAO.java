/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author nhant
 */
public class DAO extends DBContext{
    
    
    //check login xem co dung khong
    public User login(String user, String pass) {

        String query = "Select * from [User] where  [username]  =?\n"
                + "  and [password] =?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getBoolean(10),rs.getString(11), rs.getString(12),rs.getString(13),rs.getString(14)); 
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public User checkUsername(String user) {

        String query = "Select * from [User] where  [username]  =?\n";
                
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getBoolean(10),rs.getString(11), rs.getString(12),rs.getString(13),rs.getString(14)); 
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void register(int roleID, String fname, String lname, String username, String pass,String address, String image,String dob, boolean gen,String phone, String email, String createDate,String modifyDate ) {
 //       SELECT [UserID]
   //   ,[FullName]
     // ,[Email]
    //  ,[Phone]
    //  ,[Address]
     // ,[Password]
      //,[RoleID]
      //,[Create_Date]
      //,[Update_Date]
        String sql = "INSERT INTO [dbo].[User]\n" +
"           ([Role]\n" +
"           ,[LName]\n" +
"           ,[FName]\n" +
"           ,[UserName]\n" +
"           ,[PassWord]\n" +
"           ,[Address]\n" +
"           ,[image]\n" +
"           ,[DOB]\n" +
"           ,[Gender]\n" +
"           ,[Phone]\n" +
"           ,[Email]\n" +
"           ,[CreatedDate]\n" +
"           ,[ModifiedDate])\n" +
"     VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            st.setString(2, lname);
            st.setString(3, fname);
            st.setString(4,username);
            st.setString(5,pass);
            st.setString(6,address);
            st.setString(7, image);
            st.setString(8, dob);
            st.setBoolean(9, gen);
            st.setString(10, phone);
            st.setString(11,email);
            st.setString(12,createDate);
            st.setString(13,modifyDate);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    
    public boolean existedUser(String username) {
        String sql = "SELECT * "
                + "  FROM [dbo].[User]"
                + "Where [UserName] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //check
//    public User check(String username, String password) {
//
//        String sql = "Select * from [User] where  [username]  =?\n"
//                + "  and [password] =?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            st.setString(2, password);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                User u = new User();
//                u.setUsername(username);
//                u.setPass(password);
//                return u;
//                
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return null;
//    }

    //check user co ton tai khong
//    public User checkUserExist(String user) {
//        String query = "Select * from [User] where  [user] = ?";
//
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, user);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new User(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8));
//
//            }
//        } catch (SQLException e) {
//
//        }
//        return null;
//    }
//
//    //dang ki tai khoan
//    public void signup(String user, String pass, String fullname, String email, String phonenumber, String address) {
//        String query = "insert into [User]\n"
//                + "values(?,?,0,?,?,?,?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, user);
//            st.setString(2, pass);
//            st.setString(3, fullname);
//            st.setString(4, email);
//            st.setString(5, phonenumber);
//            st.setString(6, address);
//            st.executeUpdate();
//        } catch (SQLException e) {
//
//        }
//    }
    public void changeprofile(User a) {
        String sql = "UPDATE [dbo].[User] set [FirstName] = ?,[LastName] = ?,[Address] = ?,[image] = ?, [DOB] = ?, [Gender] =?"
                + ", [Phone] = ?, [Email] = ? "
                + "  where [UserName] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getfName());
            st.setString(2, a.getlName());
            st.setString(3, a.getAddress());
            st.setString(4, a.getImage());
            st.setString(5, a.getDob());
            st.setBoolean(6, a.isGender());
            st.setString(7, a.getPhone());
            st.setString(8, a.getEmail());
            st.setString(9, a.getUsername());

            st.executeUpdate();
        } catch (SQLException e) {

        }
    }
    //check
    
    public static void main(String[] args) {
        DAO d = new DAO();
        User u = d.login("a", "123");
        
        d.register(1,null,null,null,null,null,null,null,true,null,null, null ,null);
        
    }

    
}
