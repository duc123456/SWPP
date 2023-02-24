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

    public void register(int roleID, String name, String username, String pass, String phone, String createDate, String modifyDate) {
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
                + "           ,[FName]\n"
                + "           ,[UserName]\n"
                + "           ,[PassWord]\n"
                + "           ,[Phone]\n"
                + "           ,[CreatedDate]\n"
                + "           ,[ModifiedDate])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            st.setString(2, name);
            st.setString(3, username);
            st.setString(4, pass);

            st.setString(5, phone);

            st.setString(6, createDate);
            st.setString(7, modifyDate);
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

    public List<Product> getLisbyPage(List<Product> list, int start, int end) {

        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
                p.setPrice(rs.getInt(4));
                p.setName(rs.getString(5));

                p.setColor(rs.getString(6));
                p.setDescription(rs.getString(7));
                p.setResolution(rs.getString(8));
                p.setInsurance(rs.getInt(9));
                p.setcDate(rs.getString(10));
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));

                list.add(p);
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
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public Product getProductByID(int id) {
        String sql = "SELECT [PID]\n"
                + "      ,[AddedBy]\n"
                + "      ,[CATID]\n"
                + "      ,[Price]\n"
                + "      ,[Name]\n"
                + "      ,[Color]\n"
                + "      ,[Description]\n"
                + "      ,[Resolution]\n"
                + "      ,[Insurance]\n"
                + "      ,[CreateDate]\n"
                + "      ,[TID]\n"
                + "      ,[ImageDefault]\n"
                + "      ,[Size]\n"
                + "      ,[Quantity]\n"
                + "      ,[Discount]\n"
                + "  FROM [SWP].[dbo].[Product] Where PID = ?";
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
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));
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

    public List<Product> searchCheckBox(int[] cat, int[] pri, int[] size) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where (1=1)";
        if (cat != null) {
            if (cat.length == 1) {
                sql += "And CATID = ?";
            } else if (cat.length == 2) {
                sql += "And (CATID = ? or CATID = ?)";
            } else {
                sql += "And ( CATID = ?";
                for (int i = 1; i < cat.length - 1; i++) {
                    sql += " or CATID = ?";

                }
                sql += " or CATID = ?)";
            }

        }
        if (pri != null) {
            if (pri.length == 2) {
                sql += " AND (Price >= ? and Price <?) ";
            } else if (pri.length == 4) {
                sql += " And ((Price >= ? and Price <?) or (price >= ? and  price < ?)) ";
            } else {
                sql += " And ((Price >= ? and Price <?)";
                for (int i = 1; i < pri.length / 2 - 1; i++) {
                    sql += " or (price >= ? and price < ?)";

                }
                sql += " or (price >= ? and  price < ?))";
            }

        }
        if (size != null) {
            if (size.length == 2) {
                sql += " AND (Size >= ? and Size <?) ";
            } else if (size.length == 4) {
                sql += " And ((Size >= ? and Size <?) or (Size >= ? and  Size < ?)) ";
            } else {
                sql += " And ((Size >= ? and Size <?)";
                for (int i = 1; i < size.length / 2 - 1; i++) {
                    sql += " or (Size >= ? and Size < ?)";

                }
                sql += " or (Size >= ? and  Size < ?))";
            }

        }
//        if(size != null){
//            for (int i = 0; i < size.length; i++) {
//                sql += "And size >= ? and < ?";
//                
//            }
//        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int n = 0;
            if (cat != null) {
                for (int i = 0; i < cat.length; i++) {
                    n++;
                    st.setInt(i + 1, cat[i]);

                }
            }
            if (pri != null) {
                if (n == 0) {
                    for (int i = 0; i < pri.length; i++) {
                        n++;
                        st.setInt(i + 1, pri[i]);

                    }
                } else {
                    for (int i = 0; i < pri.length; i++) {
                        n++;
                        st.setInt(n, pri[i]);

                    }
                }
            }
            if (size != null) {
                if (n == 0) {
                    for (int i = 0; i < size.length; i++) {
                        n++;
                        st.setInt(i + 1, size[i]);

                    }
                } else {
                    for (int i = 0; i < size.length; i++) {
                        n++;
                        st.setInt(n, size[i]);

                    }
                }
            }
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
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductByCat(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where CATID = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
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
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));

                list.add(p);
                return list;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllProductByType(int tid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where TID = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tid);
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
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                list.add(p);
                return list;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> get4Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4 * FROM Product  \n"
                + "ORDER BY NEWID()  ";
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
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));
                list.add(p);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
                list.add(u);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public int countUser() {
        String sql = "select count(*) from [User]";
        try {

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String getFirstLetter(String s) {
        return s.substring(0, 1);
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[User]\n"
                + "      WHERE ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getStar(int id) {
        String sql = "SELECT  COUNT(*), sum(Vote) FROM FeedBack where PID = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) == 0) {
                    return 5;

                }

            }
            return rs.getInt(2) / rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

 

    public Product getProductByid(String id) {
        //lay ra id de hien thi chi tiet san pham
        String sql = "Select * FROM Product Where PID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
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
                p.setType(getTypeById(rs.getInt(11)));
                p.setImageDf(rs.getString(12));
                p.setSize(rs.getInt(13));
                p.setQuantity(rs.getInt(14));
                p.setDiscount(rs.getFloat(15));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    

    public void insertProduct(int paddby, String pcatid, String pprice, String pname, String pcolor, String pdescription, String presolution,
            String pinsurance, String format, String ptid, String pimage, String psize, String pquantity, String pdiscount) {
        String query = "INSERT INTO [dbo].[Product]\n"
                + "           ([AddedBy]\n"
                + "           ,[CATID]\n"
                + "           ,[Price]\n"
                + "           ,[Name]\n"
                + "           ,[Color]\n"
                + "           ,[Description]\n"
                + "           ,[Resolution]\n"
                + "           ,[Insurance]\n"
                + "           ,[CreateDate]\n"
                + "           ,[TID]\n"
                + "           ,[ImageDefault]\n"
                + "           ,[Size]\n"
                + "           ,[Quantity]\n"
                + "           ,[Discount])"
                + "     VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, paddby);
            st.setString(2, pcatid);
            st.setString(3, pprice);
            st.setString(4, pname);
            st.setString(5, pcolor);
            st.setString(6, pdescription);
            st.setString(7, presolution);
            st.setString(8, pinsurance);
            st.setString(9, format);
            st.setString(10, ptid);
            st.setString(11, pimage);
            st.setString(12, psize);
            st.setString(13, pquantity);
            st.setString(14, pdiscount);

            st.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void editProduct(int paddby, String pcatid, String pprice, String pname, String pcolor, String pdescription, String presolution, String pinsurance, String format, String ptid, String pimage, String psize, String pquantity, String pdiscount, int pid) {

        String query = "UPDATE [dbo].[Product]\n"
                + "  SET      [AddedBy] = ?\n"
                + "           ,[CATID] = ?\n"
                + "           ,[Price] = ?\n"
                + "           ,[Name] = ?\n"
                + "           ,[Color] = ?\n"
                + "           ,[Description] = ?\n"
                + "           ,[Resolution] = ?\n"
                + "           ,[Insurance] = ?\n"
                + "           ,[CreateDate] = ?\n"
                + "           ,[TID] = ?\n"
                + "           ,[ImageDefault] = ?\n"
                + "           ,[Size] = ?\n"
                + "           ,[Quantity] = ?\n"
                + "           ,[Discount] = ?"
                + "    Where [PID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, paddby);
            st.setString(2, pcatid);
            st.setString(3, pprice);
            st.setString(4, pname);
            st.setString(5, pcolor);
            st.setString(6, pdescription);
            st.setString(7, presolution);
            st.setString(8, pinsurance);
            st.setString(9, format);
            st.setString(10, ptid);
            st.setString(11, pimage);
            st.setString(12, psize);
            st.setString(13, pquantity);
            st.setString(14, pdiscount);
            st.setInt(15, pid);

            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    //delete san pham dua tren id 
    public void deletProduct(String pid) {
        String query = "delete from Product\n"
                + "where PID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, pid);
            st.executeUpdate();

        } catch (Exception e) {
        }

    }
    
       public static void main(String[] args) {
        DAO d = new DAO();
       Product p=d.getProductByID(1);
           System.out.println(p.getDescription());
    }
}
