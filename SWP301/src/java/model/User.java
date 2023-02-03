/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhant
 */
public class User {

   private int uId, roleId;
   private String fName, lName, username, pass, address, image;
   private String dob;
   private boolean gender;
   private String phone, email;
   private String createDate, modifyDate;

    public User() {
    }

    public User(int uId, int roleId, String fName, String lName, String username, String pass, String address, String image, String dob, boolean gender, String phone, String email,String createDate, String modifyDate) {
        this.uId = uId;
        this.roleId = roleId;
        this.fName = fName;
        this.lName = lName;
        this.username = username;
        this.pass = pass;
        this.address = address;
        this.image = image;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.createDate = createDate;
        this.modifyDate     = modifyDate;
    }

    public int getuId() {
        return uId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
   
}
