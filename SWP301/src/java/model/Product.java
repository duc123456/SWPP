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
   private int priceIn;
   private String name;
   private String color;
   private String description;
   private String resolution;
   private int insurance;
   private String cDate;
   private Type type;
   private String imageDf;

   private int size,quantity;
   private float discount;
   private int priceOut;


    public Product() {
    }

    public Product(int pId, int addedBy, Category cat, int priceIn, String name, String color, String description, String resolution, int insurance, String cDate, Type type, String imageDf, int size, int quantity, float discount, int priceOut) {
        this.pId = pId;
        this.addedBy = addedBy;
        this.cat = cat;
        this.priceIn = priceIn;
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
        this.discount = discount;
        this.priceOut = priceOut;
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

    public int getPriceIn() {
        return priceIn;
    }

    public void setPriceIn(int priceIn) {
        this.priceIn = priceIn;
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

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getPriceOut() {
        return priceOut;
    }

    public void setPriceOut(int priceOut) {
        this.priceOut = priceOut;
    }


    

    

   
    
   
}
