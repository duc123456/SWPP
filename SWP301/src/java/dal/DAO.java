/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.FeedBack;
import model.Image;
import model.Product;
import model.Size;
import model.Type;
import model.User;

/**
 *
 * @author nhant
 */
public class DAO extends DBContext {

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
                return new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
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
                return new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkUsUid(int id) {

        String query = "Select * from [User] where  [ID]  =?\n";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void register(int roleID, String fname, String lname, String username, String pass, String address, String image, String dob, boolean gen, String phone, String email, String createDate, String modifyDate) {
        //       SELECT [UserID]
        //   ,[FullName]
        // ,[Email]
        //  ,[Phone]
        //  ,[Address]
        // ,[Password]
        //,[RoleID]
        //,[Create_Date]
        //,[Update_Date]
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Role]\n"
                + "           ,[LName]\n"
                + "           ,[FName]\n"
                + "           ,[UserName]\n"
                + "           ,[PassWord]\n"
                + "           ,[Address]\n"
                + "           ,[image]\n"
                + "           ,[DOB]\n"
                + "           ,[Gender]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[CreatedDate]\n"
                + "           ,[ModifiedDate])\n"
                + "     VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            st.setString(2, lname);
            st.setString(3, fname);
            st.setString(4, username);
            st.setString(5, pass);
            st.setString(6, address);
            st.setString(7, image);
            st.setString(8, dob);
            st.setBoolean(9, gen);
            st.setString(10, phone);
            st.setString(11, email);
            st.setString(12, createDate);
            st.setString(13, modifyDate);
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

    public void changePass(String newPassword, String user) {
        try {

            PreparedStatement st = connection.prepareStatement("update [User] set PassWord = ? where [UserName] = ? ");
            st.setString(1, newPassword);
            st.setString(2, user);
            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Category> getAllCat() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(1));
                c.setcName(rs.getString(2));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Type> getAllType() {
        List<Type> list = new ArrayList<>();
        String sql = "select * from Type";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Type t = new Type();
                t.settId(rs.getInt(1));
                t.settName(rs.getString(2));

                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from category where CATID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt(1));
                c.setcName(rs.getString(2));

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Type getTypeById(int id) {
        String sql = "select * from Type where TID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Type t = new Type();
                t.settId(rs.getInt(1));
                t.settName(rs.getString(2));

                return t;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //phan trang dua tren so san pham sau do chia ra
    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by [PID] OFFSET ? rows  fetch next 12 row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPrice((int) rs.getFloat(4));
                p.setName(rs.getString(5));
                p.setImageDf(rs.getString("ImageDefault"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //dem xem co tat ca bao nhieu san pham
    public int getTotalProduct() {
        String query = "Select count(*) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getAllProd() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPrice((int) rs.getFloat(4));
                p.setName(rs.getString(5));
                p.setImageDf(rs.getString("ImageDefault"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Size> getAllSizeById(int id) {
        List<Size> list = new ArrayList<>();
        String sql = "select * from Size where PID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setsId(rs.getInt(1));
                s.setQuantity(rs.getInt(2));
                s.setSize(rs.getInt(4));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Image> getAllImageById(int id) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from Image where PID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image m = new Image();
                m.setiId(rs.getInt(1));
                m.setImage(rs.getString(3));
                list.add(m);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getImageById(int id) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from Image where PID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image m = new Image();
                m.setiId(rs.getInt(1));
                m.setImage(rs.getString(3));
                list.add(m);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list.get(0).getImage();
    }

    public void changeprofile(String fname, String lname, String address, String image, String dob, boolean gen, String phone, String email, String modify, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [LName] =  ?"
                + "      ,[FName] =  ?"
                + "      ,[Address] = ?"
                + "      ,[image] = ? "
                + "      ,[DOB] = ? "
                + "      ,[Gender] = ? "
                + "      ,[Phone] = ? "
                + "      ,[Email] = ? "
                + "      ,[ModifiedDate] = ?"
                + " WHERE [ID] = ? ";

//        String sql ="insert into Categories values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lname);
            st.setString(2, fname);
            st.setString(3, address);
            st.setString(4, image);
            st.setString(5, dob);
            st.setBoolean(6, gen);
            st.setString(7, phone);
            st.setString(8, email);
            st.setString(9, modify);
            st.setInt(10, id);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

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
    //check
    ///////////////////////////////////////////////////////////////////////////////
//tim san pham tren thanh search
    public List<Product> search(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * "
                + "  FROM [dbo].[Product]"
                + "where 1=1 ";
        if (key != null && !key.equals("")) {
            sql += " and Description like '%" + key + "%' or Name  like '%" + key + "%' or Resolution  like '%" + key + "%'";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPrice(rs.getInt(4));
                p.setName(rs.getString(5));
                p.setColor(rs.getString(6));
                p.setDescription(rs.getString(7));
                p.setResolution(rs.getString(8));
                p.setInsurance(rs.getInt(9));
                p.setcDate(rs.getString(10));
                p.setImageDf(rs.getString(12));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public Product getProductByID(int id) {
        String sql = "select * from Product\n"
                + "where PID = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPrice(rs.getInt(4));
                p.setName(rs.getString(5));
                p.setColor(rs.getString(6));
                p.setDescription(rs.getString(7));
                p.setResolution(rs.getString(8));
                p.setInsurance(rs.getInt(9));
                p.setcDate(rs.getString(10));
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                return p;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getTypebyPID(int id) {
        String sql = "select TName from Product p\n"
                + "Inner join [Type] t on t.TID = p.TID\n"
                + "where PID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<FeedBack> getFBbyPID(int pid) {
        List<FeedBack> list = new ArrayList<>();
        String sql = "SELECT [FID]\n"
                + "      ,[UID]\n"
                + "      ,[PID]\n"
                + "      ,[Description]\n"
                + "      ,[Date]\n"
                + "      ,[Vote]\n"
                + "  FROM [dbo].[FeedBack]\n"
                + "  where PID =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FeedBack f = new FeedBack();
                f.setFID(rs.getInt(1));
                f.setUID(rs.getInt(2));
                f.setUser(checkUsUid(rs.getInt(2)));
                f.setPID(rs.getInt(3));
                f.setDescription(rs.getString(4));
                f.setDate(rs.getString(5));
                f.setVote(rs.getInt(6));
                list.add(f);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public String getName(int id) {
        String sql = "select FName from [User]\n"
                + "  where ID = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {

//        d.changeprofile("Le", "dep trai", "HP", null, null, true, "0919988340", null, "2002-1-1", 6);
//        System.out.println(d.checkUsername("levanduc").getEmail());
//        System.out.println("dd");
        DAO d = new DAO();
        System.out.println(d.getTypebyPID(1));
        List<FeedBack> list = d.getFBbyPID(1);
        System.out.println(list.get(0).getDate());
    }

}
