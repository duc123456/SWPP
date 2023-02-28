/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    public Item getItemById(int id){
        for(Item i:items)
            if(i.getProduct().getpId() == id)
                return i;
        
        return null;
        
    }
    public void addItem(Item t){
        if(getItemById(t.getProduct().getpId()) != null){
            Item i = getItemById(t.getProduct().getpId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        }
        else{
            items.add(t);
        }
    }
    public  void remove(Item t){
        if(getItemById(t.getProduct().getpId()) != null){
            Item i = getItemById(t.getProduct().getpId());
            items.remove(i);
        }
    }
    public long totalPrice(){
        long l = 0;
        for(Item i: items){
            l += i.getPrice()*i.getQuantity();
        }
        return l;
    }
    
}
