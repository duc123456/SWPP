/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Data;
import model.FeedBack;
import model.Guest;
import model.Image;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.OrderLog;
import model.Product;
import model.ProductLog;
import model.Role;
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

    public void register(User u) {
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
                + "           ,[Email]\n"
                + "           ,[CreatedDate]\n"
                + "           ,[ModifiedDate]\n"
                + "           ,[image])\n"
                + "     VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getRoleId());
            st.setString(2, u.getfName());
            st.setString(3, u.getUsername());
            st.setString(4, u.getPass());
            st.setString(5, u.getPhone());
            st.setString(6, u.getEmail());
            st.setString(7, u.getCreateDate());
            st.setString(8, u.getModifyDate());
            st.setString(9, u.getImage());
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
        String sql = "select * from Product where quantity > 0 order by [PID] desc OFFSET ? rows  fetch next 12 row only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

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
        String sql = "select * from Product where quantity > 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

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

    public void changeprofile(String fname, String lname, String address, String dob, boolean gen, String phone, String email, String modify, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [LName] =  ?"
                + "      ,[FName] =  ?"
                + "      ,[Address] = ?"
                + "      ,[DOB] = ? "
                + "      ,[Gender] = ? "
                + "      ,[Phone] = ? "
                + "      ,[Email] = ? "
                + "      ,[ModifiedDate] = ?"
                + " WHERE [ID] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, lname);
            st.setString(2, fname);
            st.setString(3, address);

            st.setString(4, dob);

            st.setBoolean(5, gen);
            st.setString(6, phone);
            st.setString(7, email);
            st.setString(8, modify);
            st.setInt(9, id);

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
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public Product getProductByID(int id) {
        String sql = "SELECT * \n"
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
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

                return p;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductNewMost() {
        String sql = "select top 1 * from Product\n"
                + "Order by PID Desc";
        try {

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

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
        String sql = "select * from Product where (1=1) and quantity > 0";
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
                sql += " AND (PriceOut >= ? and PriceOut <?) ";
            } else if (pri.length == 4) {
                sql += " And ((PriceOut >= ? and PriceOut <?) or (PriceOut >= ? and  PriceOut < ?)) ";
            } else {
                sql += " And ((PriceOut >= ? and PriceOut <?)";
                for (int i = 1; i < pri.length / 2 - 1; i++) {
                    sql += " or (PriceOut >= ? and PriceOut < ?)";

                }
                sql += " or (PriceOut >= ? and  PriceOut < ?))";
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
        sql += " Order by PID desc";
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
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchCheckBox1(int[] cat, int[] pri, int[] size) {
        List<Product> list = new ArrayList<>();
        String sql = "select od.PID  from [Order Detail] od\n"
                + " \n"
                + " Inner Join Product p\n"
                + " On p.PID = od.PID\n"
                + "\n"
                + "  Where (1=1)";
        if (cat != null) {
            if (cat.length == 1) {
                sql += "And p.CATID = ?";
            } else if (cat.length == 2) {
                sql += "And (p.CATID = ? or p.CATID = ?)";
            } else {
                sql += "And ( p.CATID = ?";
                for (int i = 1; i < cat.length - 1; i++) {
                    sql += " or p.CATID = ?";

                }
                sql += " or p.CATID = ?)";
            }

        }
        if (pri != null) {
            if (pri.length == 2) {
                sql += " AND (p.PriceOut >= ? and p.PriceOut <?) ";
            } else if (pri.length == 4) {
                sql += " And ((p.PriceOut >= ? and p.PriceOut <?) or (p.PriceOut >= ? and  p.PriceOut < ?)) ";
            } else {
                sql += " And ((p.PriceOut >= ? and p.PriceOut <?)";
                for (int i = 1; i < pri.length / 2 - 1; i++) {
                    sql += " or (p.PriceOut >= ? and p.PriceOut < ?)";

                }
                sql += " or (p.PriceOut >= ? and  p.PriceOut < ?))";
            }

        }
        if (size != null) {
            if (size.length == 2) {
                sql += " AND (p.Size >= ? and p.Size <?) ";
            } else if (size.length == 4) {
                sql += " And ((p.Size >= ? and p.Size <?) or (p.Size >= ? and  p.Size < ?)) ";
            } else {
                sql += " And ((p.Size >= ? and p.Size <?)";
                for (int i = 1; i < size.length / 2 - 1; i++) {
                    sql += " or (p.Size >= ? and p.Size < ?)";

                }
                sql += " or (p.Size >= ? and  p.Size < ?))";
            }

        }
        sql += "group by od.PID,p.CATID, p.Size,p.PriceOut\n"
                + "\n"
                + " ORDER BY Sum(Amount) Desc";
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
                Product p = getProductByID(rs.getInt(1));

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
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

                list.add(p);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
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
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

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
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

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
                    return 0;

                }

            }
            return rs.getInt(2) / rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

//    public Product getProductByid(String id) {
//        //lay ra id de hien thi chi tiet san pham
//        String sql = "Select * FROM Product Where PID = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, id);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//
//                Product p = new Product();
//                p.setpId(rs.getInt(1));
//                p.setAddedBy(rs.getInt(2));
//                p.setCat(getCategoryById(rs.getInt(3)));
//                p.setPrice(rs.getInt(4));
//                p.setName(rs.getString(5));
//
//                p.setColor(rs.getString(6));
//                p.setDescription(rs.getString(7));
//                p.setResolution(rs.getString(8));
//                p.setInsurance(rs.getInt(9));
//                p.setcDate(rs.getString(10));
//                p.setType(getTypeById(rs.getInt(11)));
//                p.setImageDf(rs.getString(12));
//                p.setSize(rs.getInt(13));
//                p.setQuantity(rs.getInt(14));
//                p.setDiscount(rs.getFloat(15));
//
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public void insertProduct(int paddby, String pcatid, String pprice, String pname, String pcolor, String pdescription, String presolution,
            String pinsurance, String format, String ptid, String pimage, String psize, String pquantity, String pdiscount, String ppriceout) {
        String query = "INSERT INTO [dbo].[Product]\n"
                + "           ([AddedBy]\n"
                + "           ,[CATID]\n"
                + "           ,[PriceIn]\n"
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
                + "           ,[Discount]\n"
                + "           ,[PriceOut])\n"
                + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            st.setString(15, ppriceout);
            st.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void editProduct(String pcatid, String pprice, String pname, String pcolor, String pdescription,
            String presolution, String pinsurance, String format, String ptid, String pimage,
            String psize, String pquantity, String pdiscount, String ppriceout, int pid) {

        String query = "UPDATE [dbo].[Product]\n"
                + "  SET     "
                + "           [CATID] = ?\n"
                + "           ,[PriceIn] = ?\n"
                + "           ,[Name] = ?\n"
                + "           ,[Color] = ?\n"
                + "           ,[Description] = ?\n"
                + "           ,[Resolution] = ?\n"
                + "           ,[Insurance] = ?\n"
                + "           ,[CreateDate] = ?\n"
                + "           ,[TID] = ?   \n"
                + "           ,[ImageDefault] = ?\n"
                + "           ,[Size] = ?\n"
                + "           ,[Quantity] = ?\n"
                + "           ,[Discount] = ?\n"
                + "            ,[PriceOut] = ?\n"
                + "    Where [PID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);

            st.setString(1, pcatid);
            st.setString(2, pprice);
            st.setString(3, pname);
            st.setString(4, pcolor);
            st.setString(5, pdescription);
            st.setString(6, presolution);
            st.setString(7, pinsurance);
            st.setString(8, format);
            st.setString(9, ptid);
            st.setString(10, pimage);
            st.setString(11, psize);
            st.setString(12, pquantity);
            st.setString(13, pdiscount);
            st.setString(14, ppriceout);
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

    public void updateRole(int id, int role) {
        String query = "UPDATE [dbo].[User]\n"
                + "   SET [Role] = ?\n"
                + "   \n"
                + " WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);

            st.setInt(1, role);
            st.setInt(2, id);
            st.executeUpdate();

        } catch (Exception e) {
        }

    }

    public List<Product> sellMost() {
        List<Product> list = new ArrayList<>();

        String sql = "select PID,Sum(Amount) from [Order Detail]\n"
                + " group by PID\n"
                + " ORDER BY Sum(Amount) Desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductByID(rs.getInt(1));

                list.add(p);

            }

        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;

    }

    public int insertGuest(Guest g) {
        String sql = "insert into Guest values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, g.getAddress());
            st.setString(2, g.getPhone());
            st.setString(3, g.getlName());
            st.setString(4, g.getfName());
            st.executeUpdate();
        } catch (SQLException e) {
        }
        String sql2 = "select top 1 guest from Guest order by Guest desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql2);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public Guest getGuestById(int id) {

        String sql1 = "Select * from Guest where guest = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql1);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Guest(id, rs.getString("LName"), rs.getString("FName"), rs.getString("Address"), rs.getString("Phone"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public String insertOrder(Guest g, Cart c, String note) throws SQLException {
        String sql1 = "insert into Guest values(?,?,?,?)";
        String sql2 = "select top 1 guest from Guest order by Guest desc";
        String sql3 = "insert into [Order](Address, Date, Note, TotalPrice, GID) values (?,?,?,?,?)";
        String sql4 = "Select top 1 OID from [Order] order by OID desc";
        String sql5 = "insert into [Order Detail] (OID,PID,Price,Amount) values (?,?,?,?)";
        String sql6 = "update product set quantity=quantity-? where PID=?";
        String sql7 = "INSERT INTO [dbo].[OrderLog]\n"
                + "           ([OID]\n"
                + "           ,[StatusID]\n"
                + "           ,[Date]\n"
                + "           ,[Confirm]) values (?,?,?,?)";
        LocalDateTime myDateObj = LocalDateTime.now();
   //YYYY-MM-DD HH:MI:SS
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
     String formattedDate = myDateObj.format(myFormatObj);
        connection.setAutoCommit(false);
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, g.getAddress());
            st1.setString(2, g.getPhone());
            st1.setString(3, g.getlName());
            st1.setString(4, g.getfName());
            st1.executeUpdate();

            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();
            int gid = 0;
            if (rs.next()) {
                gid = rs.getInt(1);
            }

            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setString(1, g.getAddress());
            st3.setString(2, formattedDate);
            st3.setString(3, note);
            st3.setLong(4, c.totalPrice());
            st3.setInt(5, gid);
            st3.executeUpdate();

            int oid = 1;
            PreparedStatement st4 = connection.prepareStatement(sql4);
            rs = st4.executeQuery();
            rs.next();
            oid = rs.getInt(1);

            PreparedStatement st5 = connection.prepareStatement(sql5);
            for (Item i : c.getItems()) {
                st5.setInt(1, oid);
                st5.setInt(2, i.getProduct().getpId());
                st5.setInt(3, i.getPrice());
                st5.setInt(4, i.getQuantity());
                st5.executeUpdate();
            }
            PreparedStatement st6 = connection.prepareStatement(sql6);
            for (Item i : c.getItems()) {
                st6.setInt(1, i.getQuantity());
                st6.setInt(2, i.getProduct().getpId());

                if (getProductByID(i.getProduct().getpId()).getQuantity() < i.getQuantity()) {
                    connection.rollback();
                    return "Đơn hàng không được đặt thành công";
                }
                st6.executeUpdate();
            }
            PreparedStatement st7 = connection.prepareStatement(sql7);
            st7.setInt(1, oid);
            st7.setInt(2, 1);
            st7.setString(3, formattedDate);
            st7.setBoolean(4, false);
            st7.executeUpdate();

            connection.commit();
        } catch (SQLException e) {

            connection.rollback();
            return "Đơn hàng không được đặt thành công";
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
            }
        }

        return "CẢM ƠN";

    }

    public String insertOrderUser(int uid, String diaChi, Cart c, String note, String phone) throws SQLException {

        String sql3 = "insert into [Order](UID ,Address, Date, Note, TotalPrice,Phone) values (?,?,?,?,?,?)";
        String sql4 = "Select top 1 OID from [Order] order by OID desc";
        String sql5 = "insert into [Order Detail] (OID,PID,Price,Amount) values (?,?,?,?)";
        String sql6 = "update product set quantity=quantity-? where PID=?";
        String sql7 = "INSERT INTO [dbo].[OrderLog]\n"
                + "           ([OID]\n"
                + "           ,[StatusID]\n"
                + "           ,[Date]\n"
                + "           ,[Confirm]) values (?,?,?,?)";
        LocalDateTime myDateObj = LocalDateTime.now();
   
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
     String formattedDate = myDateObj.format(myFormatObj);
     connection.setAutoCommit(false);

        try {

            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, uid);
            st3.setString(2, diaChi);
            st3.setString(3, formattedDate);
            st3.setString(4, note);
            st3.setLong(5, c.totalPrice());
            st3.setString(6, phone);

            st3.executeUpdate();
            int oid = 1;
            PreparedStatement st4 = connection.prepareStatement(sql4);
            ResultSet rs = st4.executeQuery();
            rs.next();
            oid = rs.getInt(1);
            PreparedStatement st5 = connection.prepareStatement(sql5);
            for (Item i : c.getItems()) {
                st5.setInt(1, oid);
                st5.setInt(2, i.getProduct().getpId());
                st5.setInt(3, i.getPrice());
                st5.setInt(4, i.getQuantity());
                st5.executeUpdate();
            }
            PreparedStatement st6 = connection.prepareStatement(sql6);
            for (Item i : c.getItems()) {
                st6.setInt(1, i.getQuantity());
                st6.setInt(2, i.getProduct().getpId());

                if (getProductByID(i.getProduct().getpId()).getQuantity() < i.getQuantity()) {
                    connection.rollback();
                    return "Đơn hàng không được đặt thành công";
                }
                st6.executeUpdate();
            }
            PreparedStatement st7 = connection.prepareStatement(sql7);
            st7.setInt(1, oid);
            st7.setInt(2, 1);
            st7.setString(3, formattedDate);
            st7.setBoolean(4, false);
            st7.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            return "Đơn hàng không được đặt thành công";
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
            }
        }

        return "CẢM ƠN";
    }

    public List<Order> getListOrderbyID(int uid) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]\n"
                + "where UID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order u = new Order();//rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5),rs.getLong(6),rs.getInt(7),rs.getString(8));
                u.setoId(rs.getInt(1));
                u.setUser(checkUsUid(rs.getInt(2)));
                u.setAddress(rs.getString(3));
                u.setDate(rs.getString(4));
                u.setNote(rs.getString(5));
                u.setTotalPrice(rs.getLong(6));
                u.setGuest(getGuestById(rs.getInt(7)));
                u.setPhone(rs.getString(8));
                u.setStatus(rs.getInt("Status"));

                list.add(u);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public Order getOrderbyID(int oid) {

        String sql = "select * from [Order]\n"
                + "where UID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order u = new Order();//rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5),rs.getLong(6),rs.getInt(7),rs.getString(8));
                u.setoId(rs.getInt(1));
                u.setUser(checkUsUid(rs.getInt(2)));
                u.setAddress(rs.getString(3));
                u.setDate(rs.getString(4));
                u.setNote(rs.getString(5));
                u.setTotalPrice(rs.getLong(6));
                u.setGuest(getGuestById(rs.getInt(7)));
                u.setPhone(rs.getString(8));
                u.setStatus(rs.getInt("Status"));

                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;

    }

    public List<OrderDetail> getODDTbyUID(int uid) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from [Order] o\n"
                + "Inner join [Order Detail] od\n"
                + "on od.OID = o.OID\n"
                + "where UID = ?\n"
                + "Order by o.Date Desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder(getOrderbyID(rs.getInt("OID")));
                od.setProduct(getProductByID(rs.getInt("PID")));
                od.setPrice(rs.getInt("Price"));
                od.setAmount(rs.getInt("Amount"));

                list.add(od);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public void changAvarta(String fileName, int uId) {
        String sql = "Update [User] set Image =? where ID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fileName);
            st.setInt(2, uId);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        String sql = "select * from Role";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setrId(rs.getInt(1));
                r.setrName(rs.getString(2));

                list.add(r);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<User> getUserbyRole(int role) {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User] where Role = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
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

    public User getUserbyEmail(String email) {
        String query = "select * from [User] \n"
                + "where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select *   from [Order] ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setoId(rs.getInt(1));
                o.setUser(checkUsUid(rs.getInt(2)));
                o.setAddress(rs.getString(3));
                o.setDate(rs.getString(4));
                o.setNote(rs.getString(5));
                o.setTotalPrice(rs.getLong(6));
                o.setGuest(getGuestById(rs.getInt(7)));
                o.setPhone(rs.getString(8));

                list.add(o);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public OrderLog getODLogByOID(int oid) {

        String sql = "select top 1 * from OrderLog\n"
                + "where OID  =?\n"
                + "Order by StatusID Desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderLog ol = new OrderLog();
                ol.setLogID(rs.getInt(1));
                ol.setOrder(getOrderbyID(rs.getInt(2)));
                ol.setStatusId(rs.getInt(3));
                ol.setDate(rs.getString(4));
                ol.setConfirm(rs.getBoolean(5));
                return ol;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;

    }

    public long totalgetPriceStock(String from, String to, String now) {
        String sql = "select Sum(PriceIn *Quatity) from ProductLog\n"
                + " Where (1=1) and Action = 1 or Action = 4";
        if (from != null && to == null) {
            sql += " and Date between '" + from + "' and '" + now + "'";

        } else if (from != null && to != null) {
            sql += " and Date between '" + from + "' and '" + to + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderLog ol = new OrderLog();
                return rs.getLong(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<ProductLog> getProductLogByDate(String from, String to, String now) {
        List<ProductLog> list = new ArrayList<>();

        String sql = "select * from ProductLog \n"
                + " Where  (1=1)  and Action = 1 ";
        if (from != null && to == null) {
            sql += " and Date between '" + from + "' and '" + now + "'";

        } else if (from != null && to != null) {
            sql += " and Date between '" + from + "' and '" + to + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductLog pl = new ProductLog();
                pl.setProductLog(rs.getInt(1));
                pl.setUser(checkUsUid(rs.getInt(2)));
                pl.setProduct(getProductByID(rs.getInt(3)));
                pl.setAction(rs.getInt(4));
                pl.setPriceIn(rs.getInt(5));
                pl.setPriceOut(rs.getInt(6));
                pl.setQuantity(rs.getInt(7));
                pl.setDate(rs.getString(8));

                list.add(pl);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderResived(String from, String to, String now) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] o\n"
                + "inner join [OrderLog] ol\n"
                + "on o.OID = ol.OID\n"
                + "where ol.StatusID = 3 ";
        if (from != null && to == null) {
            sql += " and o.Date between '" + from + "' and '" + now + "'";

        } else if (from != null && to != null) {
            sql += " and o.Date between '" + from + "' and '" + to + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setoId(rs.getInt(1));
                o.setUser(checkUsUid(rs.getInt(2)));
                o.setAddress(rs.getString(3));
                o.setDate(rs.getString(4));
                o.setNote(rs.getString(5));
                o.setTotalPrice(rs.getLong(6));
                o.setGuest(getGuestById(rs.getInt(7)));
                o.setPhone(rs.getString(8));
                list.add(o);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderDetail> listProductMost() {
        List<OrderDetail> list = new ArrayList();
        String sql = "select PID, sum(Amount) from [Order detail]\n"
                + "Group by PID\n"
                + "order by PID, sum(Amount)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setProduct(getProductByID(rs.getInt(1)));
                od.setAmount(rs.getInt(2));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "             where [Name] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getProductCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getProductCountInurance() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product WHere Insurance >= 12 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getProductCountQuantity() {
        int count = 0;
        String sql = "SELECT Sum(Quantity) FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    //Lay Order
    public List<OrderLog> getAllOrderLog() {
        List<OrderLog> list = new ArrayList<>();
        String sql = "SELECT ol.OID, MAX(ol.StatusID) as MaxStatusID, o.UID, o.Address, o.[Date], o.Note, o.TotalPrice, o.GID, o.Phone\n"
                + "FROM [SWP].[dbo].[OrderLog] ol\n"
                + "INNER JOIN [Order] o ON o.OID = ol.OID\n"
                + "WHERE ol.StatusID = (SELECT MAX(StatusID) FROM [SWP].[dbo].[OrderLog] WHERE OID = ol.OID)\n"
                + "GROUP BY ol.OID, o.UID, o.Address, o.[Date], o.Note, o.TotalPrice, o.GID, o.Phone";

        try {

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLog p = new OrderLog();
                // p.setLogID(rs.getInt(1));
                p.setOrder(getOrderById(rs.getInt(1)));
                p.setStatusId(rs.getInt(2));
                p.setDate(rs.getString(5));

//                p.setConfirm(rs.getInt(5));
//
                //         p.setOrder(getOrderByAddress(rs.getString(4)));
                //  p.setOrder(getGuestByOrder(rs.getInt(12)));       
                list.add(p);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public Order getOrderByAddress(String address) {
        String sql = "select * from [Order] where [Address] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, address);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order t = new Order();
                t.setoId(rs.getInt(1));
                t.setUser(checkUsUid(rs.getInt(2)));
                t.setAddress(rs.getString(3));
                t.setNote(rs.getString(5));
                t.setTotalPrice(rs.getLong(6));
                t.setGuest(getGuestById(rs.getInt(7)));
                t.setPhone(rs.getString(8));
                return t;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int SelProductFolowTime(String month, String year) {

        String sql = "SELECT sum(o.TotalPrice) FROM [Order]  o\n"
                + "Inner join [Order Detail] od\n"
                + "On o.OID =od.OID\n"
                + "WHERE (1=1) and MONTH(o.Date) = " + month + " ";
        if (year != null && year != "") {
            sql += " and YEAR(o.Date) = " + year;
        }
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

    public List<OrderLog> getStatusOrder(int statusid) {
        List<OrderLog> list = new ArrayList<>();
        String sql = "	SELECT ol.OID, MAX(ol.StatusID) as MaxStatusID, o.UID, o.Address, o.[Date], o.Note, o.TotalPrice, o.GID, o.Phone\n"
                + "FROM [SWP].[dbo].[OrderLog] ol\n"
                + "INNER JOIN [Order] o ON o.OID = ol.OID\n"
                + "WHERE ol.StatusID = ?\n"
                + "AND ol.StatusID = (SELECT MAX(StatusID) FROM [SWP].[dbo].[OrderLog] WHERE OID = ol.OID)\n"
                + "GROUP BY ol.OID, o.UID, o.Address, o.[Date], o.Note, o.TotalPrice, o.GID, o.Phone";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, statusid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                OrderLog p = new OrderLog();
                p.setOrder(getOrderById(rs.getInt(1)));
                p.setStatusId(rs.getInt(2));
                p.setDate(rs.getString(5));
//                p.setConfirm(rs.getInt(5));
//
                p.setOrder(getOrderByAddress(rs.getString(4)));
                list.add(p);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int ChiPhi(String year) {
        String sql = "select sum(PriceIn*Quatity) from ProductLog\n"
                + "where Action = 1 ";
        if (year != null && year != "") {
            sql += " and YEAR(Date) = " + year;
        }
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

    public int DoanhThu(String year) {
        String sql = "select sum(TotalPrice) from [Order]\n"
                + "where (1=1) ";
        if (year != null && year != "") {
            sql += " and YEAR(Date) = " + year;
        }
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

    public Order getOrderById(int id) {
        String sql = "select * from [Order] where [OID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order t = new Order();
                t.setoId(rs.getInt(1));
                t.setUser(checkUsUid(rs.getInt(2)));
                t.setAddress(rs.getString(3));
                t.setNote(rs.getString(5));
                t.setTotalPrice(rs.getLong(6));
                t.setGuest(getGuestById(rs.getInt(7)));
                t.setPhone(rs.getString(8));

                return t;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllProdSellOut() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product Where Quantity < 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpId(rs.getInt(1));
                p.setAddedBy(rs.getInt(2));
                p.setCat(getCategoryById(rs.getInt(3)));
                p.setPriceIn(rs.getInt(4));
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
                p.setPriceOut(rs.getInt(16));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Order> getAllOrderByUID(int uId) {
        List<Order> list = new ArrayList<>();
        String sql = "select *   from [Order] where [UID] = ? order by OID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            ResultSet rs = st.executeQuery();
            int n = 1;
            while (rs.next()) {
                Order o = new Order();
                o.setoId(rs.getInt(1));
                o.setUser(checkUsUid(rs.getInt(2)));
                o.setAddress(rs.getString(3));
                o.setDate(rs.getString(4));

                o.setNote(rs.getString(5));
                o.setTotalPrice(rs.getLong(6));
                o.setGuest(getGuestById(rs.getInt(7)));
                o.setPhone(rs.getString(8));
                if (getODLogByOID(rs.getInt(1)) != null) {
                    n = getODLogByOID(rs.getInt(1)).getStatusId();
                }

                o.setStatus(n);

                list.add(o);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public List<OrderDetail> getODDTbyOId(int oId) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from [Order Detail] where OID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setODID(rs.getInt(1));
                od.setOrder(getOrderbyID1(rs.getInt("OID")));
                od.setProduct(getProductByID(rs.getInt("PID")));
                od.setPrice(rs.getInt("Price"));
                od.setAmount(rs.getInt("Amount"));

                list.add(od);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public List<Order> getAllOrder(String from, String now, String to, String statusId) {

        List<Order> list = new ArrayList<>();
        String sql = "Select * from [Order] o\n"
                + "Inner join \n"
                + " (\n"
                + "    SELECT OrderLogId, OID,StatusID,[date], \n"
                + "           ROW_NUMBER() OVER (PARTITION BY oid ORDER BY StatusID DESC) AS row_num\n"
                + "    FROM OrderLog \n"
                + "	where (1=1) ";

        if (from != null && to == null) {
            sql += " and [Date] between '" + from + "' and '" + now + "'";

        } else if (from != null && to != null) {
            sql += " and [Date] between '" + from + "' and '" + to + "'";
        }
        sql = sql + " ) t \n"
                + " on t.OID = o.OID\n"
                + "where t.row_num = 1 ";
        if (statusId != null && statusId != "") {
            sql += " and t.StatusID = " + statusId;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setoId(rs.getInt(1));
                o.setUser(checkUsUid(rs.getInt(2)));
                o.setAddress(rs.getString(3));
                o.setDate(rs.getString(4));
                o.setNote(rs.getString(5));
                o.setTotalPrice(rs.getLong(6));
                o.setGuest(getGuestById(rs.getInt(7)));
                o.setPhone(rs.getString(8));

                list.add(o);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;

    }

    public long getAllOrderForchart(String month, String year) {

        String sql = "Select sum(TotalPrice) from [Order] o\n"
                + "Inner join(\n"
                + "SELECT OrderLogId, OID,StatusID,[date], \n"
                + "ROW_NUMBER() OVER (PARTITION BY oid ORDER BY StatusID DESC) AS row_num\n"
                + "FROM OrderLog \n"
                + "where (1=1)  and Month(Date) =" + month + " ";
        if (year != null && year != "") {
            sql += " and YEar(Date) =" + year;
        }
        sql += " ) t \n"
                + "on t.OID = o.OID\n"
                + "where t.row_num = 1 and  t.StatusID =3";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getLong(1) / 1000;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;

    }

    public Order getOrderbyID1(int oid) {

        String sql = "select * from [Order]\n"
                + "where OID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            int n = 1;
            if (rs.next()) {
                Order u = new Order();//rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5),rs.getLong(6),rs.getInt(7),rs.getString(8));
                u.setoId(rs.getInt(1));
                u.setUser(checkUsUid(rs.getInt(2)));
                u.setAddress(rs.getString(3));
                u.setDate(rs.getString(4));
                u.setNote(rs.getString(5));
                u.setTotalPrice(rs.getLong(6));
                u.setGuest(getGuestById(rs.getInt(7)));
                u.setPhone(rs.getString(8));
                if (getODLogByOID(rs.getInt(1)) != null) {
                    n = getODLogByOID(rs.getInt(1)).getStatusId();
                }
                u.setStatus(n);

                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;

    }

    public void insertSanPhamDaXem(int uId, int pId) {
        String sql = "insert into ProductLog (UId, PId, Action, Quatity) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            st.setInt(2, pId);
            st.setInt(3, 0);
            st.setInt(4,1);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }
    public void updateSanPhamDaXem(int uId, int pId) {
        String sql = "update ProductLog set Quatity = Quatity + 1 where UId = ? and PId = ? and Action = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            st.setInt(2, pId);
           
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }
  

    public List<Product> sanPhamDaXem(int uId) {
        String sql = "select LogId, PId from ProductLog where UId = ? and Action = 0 Order By LogId desc";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p = getProductByID(rs.getInt(2));
                list.add(p);

            }

            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Data> xemData(int uId) {
        String sql = "select LogId, PId, Quatity from ProductLog where [UId] = ? and Action = 0 Order By LogId desc";
        List<Data> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Data d = new Data();
               d.setId(rs.getInt(2));
               d.setQuantity(rs.getInt(3));
               
                list.add(d);

            }

            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Data> xemDataOrder(int uId) {
        String sql = "select o.OID, od.PID, od.Amount from [Order] o join [Order Detail] od on o.OID = od.OID where o.UID = ? ";
        List<Data> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Data d = new Data();
               d.setId(rs.getInt(2));
               d.setQuantity(rs.getInt(3));
               
                list.add(d);

            }

            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void xoaSanPham(int uId, int pId) {
        String sql = "delete ProductLog where UId = ? and PId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            st.setInt(2, pId);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public List<OrderLog> getAllOrderLogByUser(int uId) {
        String sql = "select od.OID,  ol.StatusID, ol.Date, Confirm, ol.OrderLogId from [Order] od join OrderLog ol on od.OID = ol.OID where od.UID =? Order By ol.OrderLogId desc";
        List<OrderLog> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLog ol = new OrderLog();
                ol.setOrder(getOrderById(rs.getInt(1)));
                ol.setStatusId(rs.getInt(2));
                ol.setDate(rs.getString(3));
                ol.setConfirm(rs.getBoolean(4));
                list.add(ol);

            }
            return list;
        } catch (Exception e) {
        }

        return list;

    }
    public List<OrderLog> thongBao(int uId) {
        String sql = "select ol.OrderLogId, od.OID,  ol.StatusID, ol.Date, ol.Confirm from [Order] od join OrderLog ol on od.OID = ol.OID where od.UID =? and  ol.Confirm= 0 Order By ol.OrderLogId desc";
        List<OrderLog> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLog ol = new OrderLog();
                ol.setLogID(rs.getInt(1));
                ol.setOrder(getOrderById(rs.getInt(2)));
                ol.setStatusId(rs.getInt(3));
                ol.setDate(rs.getString(4));
                ol.setConfirm(rs.getBoolean(5));
                list.add(ol);

            }
            return list;
        } catch (Exception e) {
        }

        return list;

    }

    public void editOrder(int oid, int status, String Date) {
        String query = "INSERT INTO [dbo].[OrderLog]\n"
                + "           ([OID]\n"
                + "           ,[StatusID]\n"
                + "           ,[Date]\n"
                + "          ,[Confirm])\n"
                + "     VALUES\n"
                + "           (?,?,?,0)";
        try {
            PreparedStatement st = connection.prepareStatement(query);

            st.setInt(1, oid);
            st.setInt(2, status);
            st.setString(3, Date);

            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void editProduct2(String pcatid, String pprice, String pname, String pcolor, String pdescription, String presolution, String pinsurance, String format, String ptid, String psize, String pquantity, String pdiscount, String ppriceout, int pid) {

        String query = "UPDATE [dbo].[Product]\n"
                + "  SET     "
                + "           [CATID] = ?\n"
                + "           ,[PriceIn] = ?\n"
                + "           ,[Name] = ?\n"
                + "           ,[Color] = ?\n"
                + "           ,[Description] = ?\n"
                + "           ,[Resolution] = ?\n"
                + "           ,[Insurance] = ?\n"
                + "           ,[CreateDate] = ?\n"
                + "           ,[TID] = ?   \n"
                + "           ,[Size] = ?\n"
                + "           ,[Quantity] = ?\n"
                + "           ,[Discount] = ?\n"
                + "            ,[PriceOut] = ?\n"
                + "    Where [PID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);

            st.setString(1, pcatid);
            st.setString(2, pprice);
            st.setString(3, pname);
            st.setString(4, pcolor);
            st.setString(5, pdescription);
            st.setString(6, presolution);
            st.setString(7, pinsurance);
            st.setString(8, format);
            st.setString(9, ptid);

            st.setString(10, psize);
            st.setString(11, pquantity);
            st.setString(12, pdiscount);
            st.setString(13, ppriceout);
            st.setInt(14, pid);
            st.executeUpdate();

        } catch (Exception e) {
        }
    }

    public int getTotalOrder() {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT OID) FROM [OrderLog] WHERE [StatusID] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getOrder1() {
        int count = 0;
        String sql = "	SELECT COUNT(DISTINCT OID) FROM [OrderLog] WHERE [StatusID] = 2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getOrder2() {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT OID) FROM [OrderLog] WHERE [StatusID] = 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getOrder3() {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT OID) FROM [OrderLog] WHERE [StatusID] = 4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public int getOrder4() {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT OID) FROM [OrderLog] Where [StatusID] =1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return count;
    }

    public void addProductLog(ProductLog pl) {

        String sql = "INSERT INTO [dbo].[ProductLog]\n"
                + "           ([UId]\n"
                + "           ,[PId]\n"
                + "           ,[Action]\n"
                + "           ,[PriceIn]\n"
                + "           ,[PriceOut]\n"
                + "           ,[Quatity]\n"
                + "           ,[Date])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pl.getUser().getuId());
            st.setInt(2, pl.getProduct().getpId());
            st.setInt(3, pl.getAction());
            st.setLong(4, pl.getPriceIn());
            st.setLong(5, pl.getPriceOut());
            st.setLong(6, pl.getQuantity());
            st.setString(7, pl.getDate());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void Feedback(int uid, int pid, String description, String date, int vote) {
        String query = "INSERT INTO [dbo].[FeedBack]\n"
                + "           ([UID]\n"
                + "           ,[PID]\n"
                + "           ,[Description]\n"
                + "           ,[Date]\n"
                + "           ,[Vote])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);

            st.setInt(1, uid);
            st.setInt(2, pid);
            st.setString(3, description);
            st.setString(4, date);
            st.setInt(5, vote);

            st.executeUpdate();

        } catch (Exception e) {
        }
    }
    public void updateQuantity(Product p) {
        String query = "UPDATE [dbo].[Product]\n"
                + "  SET  "
                + "           [Quantity] = ?\n"
                + "    Where [PID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);


            st.setInt(1, p.getQuantity());
            st.setInt(2, p.getpId());
   
            st.executeUpdate();

        } catch (Exception e) {
               }
    }
    
    public void huyDonHang(int oId){
        String sql6 = "update product set quantity=quantity+? where PID=?";
        List<OrderDetail> list = getODDTbyOId(oId);
        try {
            PreparedStatement st = connection.prepareStatement(sql6);
            if(list != null){
                for (OrderDetail orderDetail : list) {
                    st.setInt(1, orderDetail.getAmount());
                    st.setInt(2, orderDetail.getProduct().getpId());
                    st.executeUpdate();
                }
            }
        } catch (SQLException e) {

        }
    }
    public void daXemThongBao(int logId){
        String sql = "update OrderLog set Confirm = 1 where OrderLogId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, logId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void main(String[] args) throws SQLException {
        DAO d = new DAO();
        
        Guest g = new Guest(0, "Chien", "Vu", "Ha Noi", "0987654321");
        Item t1 = new Item(d.getProductByID(32),1, 24690000);
        Cart c = new Cart();
        c.addItem(t1);
        String s = d.insertOrder(g, c, "mua");
        System.out.println("" + s);
    }
}


