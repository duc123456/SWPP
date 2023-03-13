/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class ProductLog {
    private int productLog;
    private  User user;
    private Product product;
    
    private int action;
    private long priceIn;
    private long priceOut;
    private long quantity;
    private String date;

    public ProductLog() {
    }

    public ProductLog(int productLog, User user, Product product, int action, long priceIn, long priceOut, long quantity, String date) {
        this.productLog = productLog;
        this.user = user;
        this.product = product;
        this.action = action;
        this.priceIn = priceIn;
        this.priceOut = priceOut;
        this.quantity = quantity;
        this.date = date;
    }

    public int getProductLog() {
        return productLog;
    }

    public void setProductLog(int productLog) {
        this.productLog = productLog;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAction() {
        return action;
    }

    public void setAction(int action) {
        this.action = action;
    }

    public long getPriceIn() {
        return priceIn;
    }

    public void setPriceIn(long priceIn) {
        this.priceIn = priceIn;
    }

    public long getPriceOut() {
        return priceOut;
    }

    public void setPriceOut(long priceOut) {
        this.priceOut = priceOut;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    

    
    
    
    
}
