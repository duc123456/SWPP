/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dell
 */
public class Product {
    private int pId, addedBy;
   private Category cat;
   private int price;
   private String name;
   private String color;
   private String description;
   private String resolution;
   private int insurance;
   private String cDate;
   private Type type;
   private String imageDf;
   private int size, quantity;

    public Product() {
    }

    public Product(int pId, int addedBy, Category cat, int price, String name, String color, String description, String resolution, int insurance, String cDate, Type type, String imageDf,int size, int quantity) {
        this.pId = pId;
        this.addedBy = addedBy;
        this.cat = cat;
        this.price = price;
        this.name = name;
        this.color = color;
        this.description = description;
        this.resolution = resolution;
        this.insurance = insurance;
        this.cDate = cDate;
        this.type = type;
        this.imageDf = imageDf;
        this.size = size;
        this.quantity = quantity;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(int addedBy) {
        this.addedBy = addedBy;
    }

    public Category getCat() {
        return cat;
    }

    public void setCat(Category cat) {
        this.cat = cat;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public int getInsurance() {
        return insurance;
    }

    public void setInsurance(int insurance) {
        this.insurance = insurance;
    }

    public String getcDate() {
        return cDate;
    }

    public void setcDate(String cDate) {
        this.cDate = cDate;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getImageDf() {
        return imageDf;
    }

    public void setImageDf(String imageDf) {
        this.imageDf = imageDf;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
   
}
